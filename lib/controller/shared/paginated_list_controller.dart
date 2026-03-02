import 'dart:async';

import 'package:SastaKhana/data/shared/pagination_response.dart';
import 'package:SastaKhana/utils/app_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class PaginatedListController<TItem, TRequest> extends GetxController {
  PaginatedListController({
    this.pageSize = 10,
    this.scrollThreshold = 200.0,
    this.searchDebounce = const Duration(milliseconds: 500),
  });

  final int pageSize;
  final double scrollThreshold;
  final Duration searchDebounce;

  final RxList<TItem> items = <TItem>[].obs;
  final ScrollController scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();

  final RxBool isInitialLoading = false.obs;
  final RxBool isLoadingMore = false.obs;
  final RxBool hasMore = true.obs;
  final RxInt totalRecords = 0.obs;

  String currentSearch = '';
  int currentPage = 1;

  bool _isFetching = false;
  Timer? _searchDebounceTimer;

  @protected
  TRequest buildRequest({required String search, required int pageNo});

  @protected
  Future<PaginationResponse<TItem>> requestPage(TRequest request);

  @protected
  String? itemId(TItem item) => null;

  @protected
  void onPaginationError(String message) {
    Utils.showErrorDialog(message);
  }

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_onScroll);
  }

  @override
  void onClose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    searchController.dispose();
    _searchDebounceTimer?.cancel();
    super.onClose();
  }

  Future<void> fetchPage({
    String? search,
    bool reset = false,
    bool showOverlayLoader = false,
  }) async {
    if (_isFetching) return;
    if (!reset && !hasMore.value) return;

    _isFetching = true;

    if (reset) {
      currentPage = 1;
      hasMore.value = true;
      totalRecords.value = 0;
      items.clear();
      isInitialLoading.value = true;
      if (scrollController.hasClients) {
        scrollController.jumpTo(0);
      }
    } else {
      isLoadingMore.value = true;
    }

    currentSearch = (search ?? currentSearch).trim();

    // if (showOverlayLoader) {
      Utils.showLoading();
    // }

    try {
      final response = await requestPage(
        buildRequest(search: currentSearch, pageNo: currentPage),
      );

      if (response.success == true) {
        final fetchedItems = response.data ?? <TItem>[];
        final total = int.tryParse(response.countTotalRecord ?? '');
        if (total != null && total >= 0) {
          totalRecords.value = total;
        }

        if (reset) {
          items.assignAll(fetchedItems);
        } else {
          _appendUnique(fetchedItems);
        }

        final reachedByCount =
            totalRecords.value > 0 && items.length >= totalRecords.value;
        final reachedByBatch = fetchedItems.length < pageSize;
        hasMore.value = !(reachedByCount || reachedByBatch);

        if (fetchedItems.isNotEmpty && hasMore.value) {
          currentPage++;
        }
      } else {
        if (reset) {
          items.clear();
        }
        hasMore.value = false;
        // onPaginationError(response.message ?? 'Failed to fetch data');
      }
    } on Exception catch (e) {
      onPaginationError(e.toString());
      if (kDebugMode) {
        print('PaginatedListController fetchPage error: $e');
      }
    } finally {
     
        Utils.hideLoading();
    
      isInitialLoading.value = false;
      isLoadingMore.value = false;
      _isFetching = false;
    }
  }

  Future<void> refreshPage() async {
    await fetchPage(
      search: currentSearch,
      reset: true,
      showOverlayLoader: false,
    );
  }

  void loadMore() {
    fetchPage(reset: false, showOverlayLoader: false);
  }

  void onSearchChanged(String value) {
    _searchDebounceTimer?.cancel();
    _searchDebounceTimer = Timer(searchDebounce, () {
      fetchPage(search: value, reset: true, showOverlayLoader: false);
    });
  }

  void clearSearch() {
    _searchDebounceTimer?.cancel();
    searchController.clear();
    fetchPage(search: '', reset: true, showOverlayLoader: false);
  }

  void _onScroll() {
    if (!scrollController.hasClients) return;
    if (_isFetching || !hasMore.value) return;

    if (scrollController.position.pixels >=
        (scrollController.position.maxScrollExtent - scrollThreshold)) {
      loadMore();
    }
  }

  void _appendUnique(List<TItem> incoming) {
    final canDedupe = incoming.isNotEmpty && itemId(incoming.first) != null;
    if (!canDedupe) {
      items.addAll(incoming);
      return;
    }

    final existingIds = items.map(itemId).whereType<String>().toSet();
    final uniqueItems = incoming.where((item) {
      final id = itemId(item);
      if (id == null) return true;
      return !existingIds.contains(id);
    });
    items.addAll(uniqueItems);
  }
}
