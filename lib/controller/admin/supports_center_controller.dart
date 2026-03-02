import 'package:SastaKhana/controller/shared/paginated_list_controller.dart';
import 'package:SastaKhana/data/models/admin_models/support_model.dart';
import 'package:SastaKhana/data/network/api_provider/admin_api_provider.dart';
import 'package:SastaKhana/data/shared/pagination_response.dart';

class SupportsCenterController
    extends PaginatedListController<SupportModel, SupportRequest> {
  SupportsCenterController() : super(pageSize: 10);

  List<SupportModel> get supports => items;

  String _agentType = '1';

  @override
  void onInit() {
    super.onInit();
    fetchSupports(reset: true, showOverlayLoader: true);
  }

  @override
  SupportRequest buildRequest({required String search, required int pageNo}) {
    return SupportRequest(
      pageNo: pageNo,
      agent: _agentType,
    );
  }

  @override
  Future<PaginationResponse<SupportModel>> requestPage(SupportRequest request) {
    return AdminApiProvider().supportsListApi(request);
  }

  @override
  String? itemId(SupportModel item) => item.id;

  Future<void> fetchSupports({
    String? search,
    String? userType,
    bool reset = false,
    bool showOverlayLoader = false,
  }) {
    if (userType != null) {
      _agentType = userType;
    }

    return fetchPage(
      search: search,
      reset: reset,
      showOverlayLoader: showOverlayLoader,
    );
  }

  Future<void> refreshSupports() {
    return fetchSupports(
      search: currentSearch,
      userType: _agentType,
      reset: true,
      showOverlayLoader: false,
    );
  }

  void searchSupports(String value) {
    onSearchChanged(value);
  }

  void filterByUserType(String userType) {
    fetchSupports(
      search: currentSearch,
      userType: userType,
      reset: true,
      showOverlayLoader: false,
    );
  }
}
