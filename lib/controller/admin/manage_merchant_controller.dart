import 'package:SastaKhana/controller/shared/paginated_list_controller.dart';
import 'package:SastaKhana/data/models/admin_models/manage_merchant_model.dart';
import 'package:SastaKhana/data/models/admin_models/merchant_details_model.dart';
import 'package:SastaKhana/data/network/api_provider/admin_api_provider.dart';
import 'package:SastaKhana/data/shared/pagination_response.dart';
import 'package:SastaKhana/utils/app_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ManageMerchantControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageMerchantController>(
      () => ManageMerchantController(),
      fenix: true, // Recreates controller when needed after deletion
    );
  }
}

class ManageMerchantController
    extends
        PaginatedListController<ManageMerchantModel, ManageMerchantRequest> {
  ManageMerchantController() : super(pageSize: 10);

  final Rx<MerchantDetailsModel?> selectedMerchant = Rx<MerchantDetailsModel?>(
    null,
  );
  final RxString currentVerifyStatus = '0'.obs;

  RxList<ManageMerchantModel> get merchants => items;

  @override
  void onInit() {
    super.onInit();
    fetchMerchants(reset: true, showOverlayLoader: true);
  }

  @override
  ManageMerchantRequest buildRequest({
    required String search,
    required int pageNo,
  }) {
    return ManageMerchantRequest(
      search: search,
      verifyStatus: currentVerifyStatus.value,
      pageNo: pageNo,
    );
  }

  @override
  Future<PaginationResponse<ManageMerchantModel>> requestPage(
    ManageMerchantRequest request,
  ) {
    return AdminApiProvider().manageMerchantApi(request);
  }

  @override
  String? itemId(ManageMerchantModel item) => item.id;

  Future<void> fetchMerchants({
    String? search,
    String? verifyStatus,
    bool reset = false,
    bool showOverlayLoader = false,
  }) async {
    if (verifyStatus != null) {
      currentVerifyStatus.value = verifyStatus;
    }
    return fetchPage(
      search: search,
      reset: reset,
      showOverlayLoader: showOverlayLoader,
    );
  }

  @override
  void loadMore() {
    fetchMerchants(
      search: currentSearch,
      verifyStatus: currentVerifyStatus.value,
      reset: false,
      showOverlayLoader: false,
    );
  }

  void searchMerchants(String search) {
    onSearchChanged(search);
  }

  Future<void> updateMerchantStatus(String merchantId, String newStatus) async {
    Utils.showLoading();
    try {
      final request = {"id": merchantId, "verify_status": newStatus};
      var response = await AdminApiProvider().updateMerchantStatusApi(request);
      if (response.success == true) {
        Utils.sucessSnackBar(response.message ?? "Status updated successfully");
        fetchMerchants(
          search: currentSearch,
          verifyStatus: currentVerifyStatus.value,
          reset: true,
        );
      } else {
        Utils.showErrorDialog(response.message ?? "Failed to update status");
      }
    } on Exception catch (e) {
      Utils.showErrorDialog(e.toString());
      if (kDebugMode) {
        print("Update Merchant Status Error: $e");
      }
    } finally {
      Utils.hideLoading();
    }
  }

  Future<void> fetchMerchantDetails(String merchantId) async {
    Utils.showLoading();
    try {
      var response = await AdminApiProvider().merchantDetailsApi(merchantId);
      if (response.success == true && response.body != null) {
        selectedMerchant.value = response.body;
      } else {
        Utils.showErrorDialog(
          response.message ?? "Failed to fetch merchant details",
        );
      }
    } on Exception catch (e) {
      Utils.showErrorDialog(e.toString());
      if (kDebugMode) {
        print("Fetch Merchant Details Error: $e");
      }
    } finally {
      Utils.hideLoading();
    }
  }

  Future<void> deleteMerchant(String merchantId) async {
    Utils.showLoading();
    try {
      var response = await AdminApiProvider().deleteMerchantApi(merchantId);
      if (response.success == true) {
        Get.back();
        Utils.sucessSnackBar(
          response.message ?? "Merchant deleted successfully",
        );
        fetchMerchants(
          search: currentSearch,
          verifyStatus: currentVerifyStatus.value,
          reset: true,
        );
      } else {
        Utils.showErrorDialog(response.message ?? "Failed to delete merchant");
      }
    } on Exception catch (e) {
      Utils.showErrorDialog(e.toString());
      if (kDebugMode) {
        print("Delete Merchant Error: $e");
      }
    } finally {
      Utils.hideLoading();
    }
  }
}
