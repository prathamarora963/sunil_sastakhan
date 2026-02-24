import '../models/user_model.dart';
import '../shared/data_response.dart';
import 'api_constants.dart';
import 'base_client.dart';
import 'package:dio/dio.dart' as dio;

class ApiProvider {
  static final ApiProvider _singleton = ApiProvider._internal();
  static late BaseClient _baseClient;

  factory ApiProvider() {
    return _singleton;
  }

  ApiProvider._internal() {
    _baseClient = BaseClient();
  }

  /// ------------------------- auth apis ------------------------------------
  Future<DataResponse<UserModel?>> loginApi(
    final Map<String, dynamic> body,
  ) async {
    ApiRequest apiRequest = ApiRequest(
      url: ApiConstants.login,
      requestType: RequestType.raw,
      body: body,
    );
    try {
      var response = await _baseClient.handleRequest(apiRequest);

      return DataResponse.fromJson(
        response,
        (data) => UserModel.fromJson(data),
      );
    } catch (e) {
      final res = (e as dynamic).response;
      if (res != null) {
        return DataResponse.fromJson(res?.data, (data) => null);
      }
      return DataResponse(message: e.toString());
    }
  }
  Future<DataResponse<UserModel?>> customerSignup(
    final Map<String, dynamic> body,
  ) async {
    ApiRequest apiRequest = ApiRequest(
      url: ApiConstants.signUp,
      requestType: RequestType.raw,
      body: body,
    );
    try {
      var response = await _baseClient.handleRequest(apiRequest);

      return DataResponse.fromJson(
        response,
        (data) => UserModel.fromJson(data),
      );
    } catch (e) {
      final res = (e as dynamic).response;
      if (res != null) {
        return DataResponse.fromJson(res?.data, (data) => null);
      }
      return DataResponse(message: e.toString());
    }
  }

  ///-------------get event category list-----------------
}
