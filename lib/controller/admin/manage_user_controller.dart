import 'package:SastaKhana/controller/shared/paginated_list_controller.dart';
import 'package:SastaKhana/data/models/admin_models/manage_user_model.dart';
import 'package:SastaKhana/data/network/api_provider/admin_api_provider.dart';
import 'package:SastaKhana/data/shared/pagination_response.dart';

class ManageUserController
    extends PaginatedListController<ManageUserModel, ManageUserRequest> {
  ManageUserController() : super(pageSize: 10);

  List<ManageUserModel> get users => items;

  @override
  void onInit() {
    super.onInit();
    fetchUsers(reset: true, showOverlayLoader: true);
  }

  @override
  ManageUserRequest buildRequest({
    required String search,
    required int pageNo,
  }) {
    return ManageUserRequest(search: search, pageNo: pageNo);
  }

  @override
  Future<PaginationResponse<ManageUserModel>> requestPage(
    ManageUserRequest request,
  ) {
    return AdminApiProvider().manageUserApi(request);
  }

  @override
  String? itemId(ManageUserModel item) => item.id;

  Future<void> fetchUsers({
    String? search,
    bool reset = false,
    bool showOverlayLoader = false,
  }) {
    return fetchPage(
      search: search,
      reset: reset,
      showOverlayLoader: showOverlayLoader,
    );
  }

  Future<void> refreshUsers() {
    return refreshPage();
  }

  void searchUsers(String value) {
    onSearchChanged(value);
  }
}
