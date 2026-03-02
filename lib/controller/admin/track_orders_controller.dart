import 'package:SastaKhana/controller/shared/paginated_list_controller.dart';
import 'package:SastaKhana/data/models/admin_models/track_orders_model.dart';
import 'package:SastaKhana/data/network/api_provider/admin_api_provider.dart';
import 'package:SastaKhana/data/shared/pagination_response.dart';

class TrackOrdersController
    extends PaginatedListController<TrackOrdersModel, AdminTrackOrdersRequest> {
  TrackOrdersController() : super(pageSize: 10);

  List<TrackOrdersModel> get orders => items;

  String _currentOrderStatus = '3';

  @override
  void onInit() {
    super.onInit();
    fetchTrackOrders(reset: true, showOverlayLoader: true);
  }

  @override
  AdminTrackOrdersRequest buildRequest({
    required String search,
    required int pageNo,
  }) {
    return AdminTrackOrdersRequest(orderStatus: search, pageNo: pageNo);
  }

  @override
  Future<PaginationResponse<TrackOrdersModel>> requestPage(
    AdminTrackOrdersRequest request,
  ) {
    return AdminApiProvider().trackOrdersApi(request);
  }

  @override
  String? itemId(TrackOrdersModel item) => item.id;

  Future<void> fetchTrackOrders({
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

  Future<void> refreshTrackOrders() {
    return fetchTrackOrders(
      orderStatus: _currentOrderStatus,
      reset: true,
      showOverlayLoader: false,
    );
  }

  void filterByOrderStatus(String orderStatus) {
    fetchTrackOrders(
      orderStatus: orderStatus,
      reset: true,
      showOverlayLoader: false,
    );
  }
}
