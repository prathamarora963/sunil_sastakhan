import 'package:SastaKhana/controller/shared/paginated_list_controller.dart';
import 'package:SastaKhana/data/models/admin_models/track_orders_model.dart';
import 'package:SastaKhana/data/shared/pagination_response.dart';
import 'package:SastaKhana/data/models/user_models/user_profile_model.dart';
import 'package:SastaKhana/data/network/api_provider/user_api_provider.dart';
import 'package:SastaKhana/utils/app_utils.dart';
import 'package:get/get.dart';

class ProfileController
    extends PaginatedListController<TrackOrdersModel, AdminTrackOrdersRequest> {
  ProfileController() : super(pageSize: 10);

  final Rx<UserProfileModel?> userProfile = Rx<UserProfileModel?>(null);
  List<TrackOrdersModel> get orderHistory => items;

  String _currentOrderStatus = "1";

  @override
  void onInit() {
    super.onInit();
    _initializeProfileAndOrders();
  }

  Future<void> _initializeProfileAndOrders() async {

    await fetchOrderHistory(
      orderStatus: _currentOrderStatus,
      reset: true,
      showOverlayLoader: true,
    );
  }

  Future<void> fetchUserProfile() async {
    Utils.showLoading();
    try {
      var response = await UserApiProvider().getUserProfileApi();
      if (response.success == true && response.body != null) {
        userProfile.value = response.body;
      } else {
        Utils.showErrorDialog(
          response.message ?? "Failed to fetch user profile",
        );
      }
    } on Exception catch (e) {
      Utils.showErrorDialog(e.toString());
    } finally {
      Utils.hideLoading();
    }
  }

  @override
  AdminTrackOrdersRequest buildRequest({
    required String search,
    required int pageNo,
  }) {
    return AdminTrackOrdersRequest(
      userId: userProfile.value?.id ?? "",
      orderStatus: search,
      pageNo: pageNo,
    );
  }

  @override
  Future<PaginationResponse<TrackOrdersModel>> requestPage(
    AdminTrackOrdersRequest request,
  ) {
    return UserApiProvider().getOrderHistoryApi(request);
  }

  @override
  String? itemId(TrackOrdersModel item) => item.id;

  Future<void> fetchOrderHistory({
    String? orderStatus,
    bool reset = false,
    bool showOverlayLoader = false,
  }) {
    if (orderStatus != null) {
      _currentOrderStatus = orderStatus;
    }
    return fetchPage(
      search: _currentOrderStatus,
      reset: reset,
      showOverlayLoader: showOverlayLoader,
    );
  }

  Future<void> refreshOrderHistory() {
    return fetchOrderHistory(
      orderStatus: _currentOrderStatus,
      reset: true,
      showOverlayLoader: false,
    );
  }

  void filterOrderHistoryByStatus(String orderStatus) {
    fetchOrderHistory(
      orderStatus: orderStatus,
      reset: true,
      showOverlayLoader: false,
    );
  }
}
