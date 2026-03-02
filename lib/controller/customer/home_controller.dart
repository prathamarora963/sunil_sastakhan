import 'package:SastaKhana/controller/shared/paginated_list_controller.dart';
import 'package:SastaKhana/data/models/user_models/item_details_model.dart';
import 'package:SastaKhana/data/models/user_models/item_model.dart';
import 'package:SastaKhana/data/network/api_provider/user_api_provider.dart';
import 'package:SastaKhana/data/shared/pagination_response.dart';
import 'package:SastaKhana/utils/app_utils.dart';
import 'package:get/get.dart';

class HomeController extends PaginatedListController<ItemModel, HomeRequest> {
  HomeController() : super(pageSize: 10);

  final RxList<ItemModel> supperDiscountItems = <ItemModel>[].obs;
  List<ItemModel> get homeItems => items;
  final Rx<ItemDetailsModel?> selectedItemDetails = Rx<ItemDetailsModel?>(null);
  final RxMap<String, ItemDetailsModel> itemDetailsById =
      <String, ItemDetailsModel>{}.obs;

  @override
  void onInit() {
    super.onInit();
    fetchItems();
    fetchHomeItems(reset: true, showOverlayLoader: true);
  }

  Future<void> fetchItems() async {
    Utils.showLoading();
    try {
      var response = await UserApiProvider().getSupperDiscountItemsApi();
      if (response.success == true && response.body != null) {
        supperDiscountItems.value = response.body ?? [];
      } else {
        Utils.showErrorDialog(response.message ?? "Failed to fetch items");
      }
    } on Exception catch (e) {
      Utils.showErrorDialog(e.toString());
    } finally {
      Utils.hideLoading();
    }
  }

  @override
  HomeRequest buildRequest({required String search, required int pageNo}) {
    return HomeRequest(pageNo: pageNo);
  }

  @override
  Future<PaginationResponse<ItemModel>> requestPage(HomeRequest request) {
    return UserApiProvider().getHomeItemsListApi(request);
  }

  Future<void> fetchHomeItems({
    bool reset = false,
    bool showOverlayLoader = false,
  }) {
    return fetchPage(
      search: '',
      reset: reset,
      showOverlayLoader: showOverlayLoader,
    );
  }

Future<ItemDetailsModel?> getItemDetails(
    String itemId, {
    bool showLoader = true,
    bool showError = true,
  }) async {
    final cached = itemDetailsById[itemId];
    if (cached != null) {
      selectedItemDetails.value = cached;
      return cached;
    }
    if (showLoader) {
      Utils.showLoading();
    }
    try {
      var response = await UserApiProvider().getItemDetailsApi(itemId);
      if (response.success == true && response.body != null) {
        selectedItemDetails.value = response.body;
        itemDetailsById[itemId] = response.body!;
        return response.body;
      } else {
        if (showError) {
          Utils.showErrorDialog(response.message ?? "Failed to fetch item details");
        }
      }
    } on Exception catch (e) {
      if (showError) {
        Utils.showErrorDialog(e.toString());
      }
    } finally {
      if (showLoader) {
        Utils.hideLoading();
      }
    }
    return null;
  }

}
