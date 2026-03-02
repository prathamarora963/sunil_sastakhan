import 'package:SastaKhana/data/models/admin_models/track_orders_model.dart';
import 'package:SastaKhana/data/models/user_models/item_details_model.dart';
import 'package:SastaKhana/data/models/user_models/item_model.dart';
import 'package:SastaKhana/data/models/user_models/user_profile_model.dart';
import 'package:SastaKhana/data/network/api_constants.dart';
import 'package:SastaKhana/data/network/base_client.dart';
import 'package:SastaKhana/data/shared/data_response.dart';
import 'package:SastaKhana/data/shared/list_response.dart';
import 'package:SastaKhana/data/shared/pagination_response.dart';

class UserApiProvider {
  static final UserApiProvider _singleton = UserApiProvider._internal();
  static late BaseClient _baseClient;

  factory UserApiProvider() {
    return _singleton;
  }

  UserApiProvider._internal() {
    _baseClient = BaseClient();
  }

  Future<DataResponse<UserProfileModel>> getUserProfileApi() async {
    ApiRequest apiRequest = ApiRequest(
      url: ApiConstants.profileApi,
      requestType: RequestType.raw,
    );
    try {
      var response = await _baseClient.handleRequest(apiRequest);

      return DataResponse.fromJson(
        response,
        (data) => UserProfileModel.fromJson(data['body']),
      );
    } catch (e) {
      return DataResponse(message: e.toString());
    }
  }


  Future<PaginationResponse<TrackOrdersModel>> getOrderHistoryApi(
    AdminTrackOrdersRequest request,
  ) async {
    ApiRequest apiRequest = ApiRequest(
      url: ApiConstants.orderHistory,
      requestType: RequestType.raw,
      body: request.toJson(),
    );
    try {
      var response = await _baseClient.handleRequest(apiRequest);

      return PaginationResponse.fromJson(
        response,
        (data) => TrackOrdersModel.fromJson(data),
      );
    } catch (e) {
      return PaginationResponse(message: e.toString());
    }
  }


  Future<ListResponse<ItemModel>> getSupperDiscountItemsApi() async {
    ApiRequest apiRequest = ApiRequest(
      url: ApiConstants.getSupperDiscountItemsList,
      requestType: RequestType.raw,
    );
    try {
      var response = await _baseClient.handleRequest(apiRequest);

      return ListResponse.fromJson(
        response,
        (data) => ItemModel.fromJson(data),
      );
    } catch (e) {
      return ListResponse(message: e.toString());
    }
  }

  Future<PaginationResponse<ItemModel>> getHomeItemsListApi(
    HomeRequest request,
  ) async {
    ApiRequest apiRequest = ApiRequest(
      url: ApiConstants.getHomeItemsList,
      requestType: RequestType.raw,
      body: request.toJson(),
    );
    try {
      var response = await _baseClient.handleRequest(apiRequest);

      return PaginationResponse.fromJson(
        response,
        (data) => ItemModel.fromJson(data),
      );
    } catch (e) {
      return PaginationResponse(message: e.toString());
    }
  }

  Future<DataResponse<ItemDetailsModel>> getItemDetailsApi(String itemId) async {
    ApiRequest apiRequest = ApiRequest(
      url: ApiConstants.viewItemDetail,
      requestType: RequestType.raw,
      body: {"id": itemId},
    );
    try {
      var response = await _baseClient.handleRequest(apiRequest);

      return DataResponse.fromJson(
        response,
        (data) => ItemDetailsModel.fromJson(data['body']),
      );
    } catch (e) {
      return DataResponse(message: e.toString());
    } 

  }

}
