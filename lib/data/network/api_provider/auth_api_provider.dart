import 'package:flutter/foundation.dart';

import '../../models/user_model.dart';
import '../../shared/data_response.dart';
import '../api_constants.dart';
import '../base_client.dart';
import 'package:dio/dio.dart' as dio;

class AuthApiProvider {
  static final AuthApiProvider _singleton = AuthApiProvider._internal();
  static late BaseClient _baseClient;

  factory AuthApiProvider() {
    return _singleton;
  }

  AuthApiProvider._internal() {
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
    } on dio.DioException catch (e) {
      if (kDebugMode) {
        print("DioException in loginApi: $e");
      }
      return DataResponse(message: e.message ?? "An error occurred");
    }  catch (e) {
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

  

  Future<DataResponse<UserModel?>> merchantSignup(
    final Map<String, dynamic> body,
  ) async {
    ApiRequest apiRequest = ApiRequest(
      url: ApiConstants.merchantRegistration,
      requestType: RequestType.raw,
      body: body,
    );
    try {
      var response = await _baseClient.handleMultipartRequest(apiRequest);

      return DataResponse.fromJson(
        response,
         (data) {
          debugPrint("Merchant Signup Response Data: $data");
          return null;
         }
      );
    } catch (e) {
      final res = (e as dynamic).response;
      if (res != null) {
        return DataResponse.fromJson(res?.data, (data) => null);
      }
      return DataResponse(message: e.toString());
    }
  }

 
}
