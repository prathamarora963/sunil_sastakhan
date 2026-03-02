import 'package:SastaKhana/data/models/admin_models/manage_merchant_model.dart';
import 'package:SastaKhana/data/models/admin_models/manage_user_model.dart';
import 'package:SastaKhana/data/models/admin_models/merchant_details_model.dart';
import 'package:SastaKhana/data/models/admin_models/monthly_revenue_model.dart';
import 'package:SastaKhana/data/models/admin_models/sales_model.dart';
import 'package:SastaKhana/data/models/admin_models/support_model.dart';
import 'package:SastaKhana/data/models/admin_models/track_orders_model.dart';
import 'package:SastaKhana/data/network/api_constants.dart';
import 'package:SastaKhana/data/network/base_client.dart';
import 'package:SastaKhana/data/shared/data_response.dart';
import 'package:SastaKhana/data/shared/pagination_response.dart';

class AdminApiProvider {
  static final AdminApiProvider _singleton = AdminApiProvider._internal();
  static late BaseClient _baseClient;

  factory AdminApiProvider() {
    return _singleton;
  }

  AdminApiProvider._internal() {
    _baseClient = BaseClient();
  }

  Future<DataResponse<SalesModel?>> todaySalesApi() async {
    ApiRequest apiRequest = ApiRequest(
      url: ApiConstants.todaySale,
      requestType: RequestType.raw,
    );
    try {
      var response = await _baseClient.handleRequest(apiRequest);

      return DataResponse.fromJson(
        response,
        (data) => SalesModel.fromJson(data),
      );
    } catch (e) {
      return DataResponse(message: e.toString());
    }
  }

  Future<PaginationResponse<ManageMerchantModel>> manageMerchantApi(
    ManageMerchantRequest request,
  ) async {
    ApiRequest apiRequest = ApiRequest(
      url: ApiConstants.manageMerchant,
      requestType: RequestType.raw,
      body: request.toJson(),
    );
    try {
      var response = await _baseClient.handleRequest(apiRequest);

      return PaginationResponse.fromJson(
        response,
        (data) => ManageMerchantModel.fromJson(data),
      );
    } catch (e) {
      return PaginationResponse(message: e.toString());
    }
  }

  Future<DataResponse<String?>> updateMerchantStatusApi(
    Map<String, dynamic> request,
  ) async {
    ApiRequest apiRequest = ApiRequest(
      url: ApiConstants.updateVerifyStatus,
      requestType: RequestType.raw,
      body: request,
    );
    try {
      var response = await _baseClient.handleRequest(apiRequest);

      return DataResponse.fromJson(response, (data) => null);
    } catch (e) {
      final res = (e as dynamic).response;
      if (res != null) {
        return DataResponse.fromJson(res?.data, (data) => null);
      }
      return DataResponse(message: e.toString());
    }
  }

  Future<DataResponse<MerchantDetailsModel?>> merchantDetailsApi(
    String merchantId,
  ) async {
    ApiRequest apiRequest = ApiRequest(
      url: ApiConstants.merchantDetailAdmin,
      requestType: RequestType.raw,
      body: {"id": merchantId},
    );
    try {
      var response = await _baseClient.handleRequest(apiRequest);

      return DataResponse.fromJson(
        response,
        (data) => MerchantDetailsModel.fromJson(data),
      );
    } catch (e) {
      final res = (e as dynamic).response;
      if (res != null) {
        return DataResponse.fromJson(res?.data, (data) => null);
      }
      return DataResponse(message: e.toString());
    }
  }

  Future<DataResponse<String?>> deleteMerchantApi(String merchantId) async {
    ApiRequest apiRequest = ApiRequest(
      url: ApiConstants.deleteMerchant,
      requestType: RequestType.raw,
      body: {"id": merchantId},
    );
    try {
      var response = await _baseClient.handleRequest(apiRequest);

      return DataResponse.fromJson(response, (data) => null);
    } catch (e) {
      final res = (e as dynamic).response;
      if (res != null) {
        return DataResponse.fromJson(res?.data, (data) => null);
      }
      return DataResponse(message: e.toString());
    }
  }

  Future<PaginationResponse<ManageUserModel>> manageUserApi(
    ManageUserRequest request,
  ) async {
    ApiRequest apiRequest = ApiRequest(
      url: ApiConstants.manageUser,
      requestType: RequestType.raw,
      body: request.toJson(),
    );
    try {
      var response = await _baseClient.handleRequest(apiRequest);

      return PaginationResponse.fromJson(
        response,
        (data) => ManageUserModel.fromJson(data),
      );
    } catch (e) {
      return PaginationResponse(message: e.toString());
    }
  }

  Future<PaginationResponse<TrackOrdersModel>> trackOrdersApi(
    AdminTrackOrdersRequest request,
  ) async {
    ApiRequest apiRequest = ApiRequest(
      url: ApiConstants.trackOrder,
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

Future<PaginationResponse<SupportModel>> supportsListApi(
    SupportRequest request,
  ) async {
    ApiRequest apiRequest = ApiRequest(
      url: ApiConstants.supportCenter,
      requestType: RequestType.raw,
      body: request.toJson(),
    );
    try {
      var response = await _baseClient.handleRequest(apiRequest);

      return PaginationResponse.fromJson(
        response,
        (data) => SupportModel.fromJson(data),
      );
    } catch (e) {
      return PaginationResponse(message: e.toString());
    }
  }


Future<DataResponse<MonthlyRevenueModel>> getRevenue({required String  year}) async {
    ApiRequest apiRequest = ApiRequest(
      url: ApiConstants.revenue,
      requestType: RequestType.raw,
      body: {"year": year},
    );
    try {
      var response = await _baseClient.handleRequest(apiRequest);

      return DataResponse.fromJson(
        response,
        (data) => MonthlyRevenueModel.fromJson(data['data']),
      );
    } catch (e) {
      return DataResponse(message: e.toString());
    }
  }

  Future<DataResponse<QuartlyReportModel>> getQuartlyRevenue() async {
    ApiRequest apiRequest = ApiRequest(
      url: ApiConstants.report,
      requestType: RequestType.raw,
    );
    try {
      var response = await _baseClient.handleRequest(apiRequest);

      return DataResponse.fromJson(
        response,
        (data) => QuartlyReportModel.fromJson(data),
      );
    } catch (e) {
      return DataResponse(message: e.toString());
    }
  }


}
