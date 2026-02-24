import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:get/route_manager.dart';

import '../../loginsignup/SignupWelcome.dart';
import '../../utils/app_utils.dart';
import '../../utils/db_helper.dart';
import 'no_internet_page.dart';

enum RequestType { post, get, delete, put, patch, raw }

class ApiRequest {
  final String url;
  final RequestType requestType;
  final Map<String, dynamic>? body;

  ApiRequest({required this.url, required this.requestType, this.body});
}

/// api methods
class BaseClient {
  static final BaseClient _singleton = BaseClient._internal();
  static late Dio _dio;

  factory BaseClient() {
    return _singleton;
  }

  BaseClient._internal() {
    _dio = Dio();
    BaseOptions options = BaseOptions(
      receiveTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
    );
    _dio.options = options;
    _dio.options.followRedirects = false;
    _dio.options.headers["Content-Type"] = "application/json";
    (_dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient(
        context: SecurityContext(withTrustedRoots: false),
      );
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    _dio.interceptors.clear();
    _dio.interceptors.add(LoggingInterceptors());
  }

  Options? getHeaderToken() {
    String? token = DbHelper().getUserToken();
    Map<String, dynamic> headers = {
      // 'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwibG9naW5UaW1lIjoxNzM3NjIzMDYyLCJpc1ZlcmlmeSI6MSwiaWF0IjoxNzM3NjIzMDYyLCJleHAiOjE3NjkxNTkwNjJ9.rE14J6jOUIn3wYA8SWANngC7b0TfoEWrnTS4l5nZnwk',
      "secret_key": "mobile_secret_fiji_#123@321#",
      "publish_key": "mobile_publish_fiji_#123@321#",
      "language_type": DbHelper().getLanguage() != "eng" ? "2" : "1",
    };
    if (token != null) {
      if (kDebugMode) {
        print("User Token => $token");
      }
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    return Options(headers: headers);
  }

  Future<dynamic> handleRequest(ApiRequest apiRequest) async {
    bool isOnline = await hasNetwork();
    if (!isOnline) {
      Utils.sucessSnackBar('No Internet, Please try later !');
      Get.to(
        () => NoInternetPage(
          callBack: (apiRequest) {
            handleRequest(apiRequest);
          },
          apiRequest: apiRequest,
        ),
      );
      return;
    }
    switch (apiRequest.requestType) {
      case RequestType.post:
        var response = await _dio.post(
          apiRequest.url,
          data: FormData.fromMap(apiRequest.body ?? {}),
          options: getHeaderToken(),
        );
        return response.data;

      case RequestType.raw:
        var response = await _dio.post(
          apiRequest.url,
          data: apiRequest.body ?? {},
          options: getHeaderToken(),
        );
        return response.data;

      case RequestType.get:
        var response = await _dio.get(
          apiRequest.url,
          options: getHeaderToken(),
        );
        return response.data;

      case RequestType.delete:
        var response = await _dio.delete(
          apiRequest.url,
          data: FormData.fromMap(apiRequest.body ?? {}),
          options: getHeaderToken(),
        );
        return response.data;

      case RequestType.patch:
        var response = await _dio.patch(
          apiRequest.url,
          data: FormData.fromMap(apiRequest.body ?? {}),
          options: getHeaderToken(),
        );
        return response.data;

      case RequestType.put:
        var response = await _dio.put(
          apiRequest.url,
          data: FormData.fromMap(apiRequest.body ?? {}),
          options: getHeaderToken(),
        );
        return response.data;
    }
  }

  Future<dynamic> handleMultipartRequest(
    ApiRequest apiRequest,
    String imageFile,
  ) async {
    bool isOnline = await hasNetwork();
    if (!isOnline) {
      Utils.showErrorDialog('No Internet, Please try later !');
      Get.to(
        () => NoInternetPage(
          callBack: (apiRequest) {
            handleMultipartRequest(apiRequest, imageFile);
          },
          apiRequest: apiRequest,
        ),
      );

      return;
    }
    FormData data = FormData.fromMap({
      "image": await MultipartFile.fromFile(imageFile),
    });

    var res = await _dio.post(
      apiRequest.url,
      data: data,
      options: getHeaderToken(),
    );
    if (kDebugMode) {
      print(res.data.toString());
    }
    return res.data;
  }

  static Future<bool> hasNetwork() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}

/// loggingInterceptors
class LoggingInterceptors extends Interceptor {
  String printObject(Object object) {
    // Encode your object and then decode your object to Map variable
    Map jsonMapped = json.decode(json.encode(object));

    // Using JsonEncoder for spacing
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');

    // encode it to string
    String prettyPrint = encoder.convert(jsonMapped);
    return prettyPrint;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint(
      "--> ${options.method.toUpperCase()} ${"${options.baseUrl}${options.path}"}",
    );
    debugPrint("Headers:");
    options.headers.forEach((k, v) => debugPrint('$k: $v'));
    options.queryParameters.forEach((k, v) => debugPrint('$k: $v'));
    if (options.data != null) {
      try {
        FormData formData = options.data as FormData;
        debugPrint("Body:");
        var buffer = [];
        for (MapEntry<String, String> pair in formData.fields) {
          buffer.add('${pair.key}:${pair.value}');
        }
        debugPrint("Body:{${buffer.join(', ')}}");
      } catch (e) {
        debugPrint("Body: ${printObject(options.data)}");
      }
    }
    debugPrint(options.method.toUpperCase());
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint(
      "${err.message} ${(err.response?.requestOptions != null ? ("${err.response?.requestOptions.baseUrl} ${err.response?.requestOptions.path}") : 'URL')}",
    );
    debugPrint(
      "error ====> ${err.response != null ? err.response?.data : 'Unknown Error'}",
    );
    if (err.type == DioExceptionType.connectionError) {
      Utils.hideLoading();
      Utils.showErrorDialog("Something went wrong connection Error");
      return;
    }
    if (err.type == DioExceptionType.receiveTimeout) {
      Utils.hideLoading();
      Utils.showErrorDialog("Something went wrong receive Timeout");
      return;
    }
    if (err.response?.statusCode == 400 &&
        err.response?.data['msg'] ==
            "Unauthorized: User not found or session expired") {
      Utils.hideLoading();
      DbHelper().clearAll();
      Get.off(SignupWelcome());
      Utils.showErrorDialog("Session Expired!!!");
      return;
    }

    if (err.response?.statusCode == 403 &&
        err.response?.data['msg'] ==
            "Unauthorized: User not found or session expired") {
      Utils.hideLoading();
      DbHelper().clearAll();
      Get.off(SignupWelcome());
      Utils.showErrorDialog("Session Expired!!!");
      return;
    }

    if (err.response?.statusCode == 401 &&
        err.response?.data['message'] ==
            "Unauthorized: User not found or session expired") {
      Utils.hideLoading();
      DbHelper().clearAll();
      Get.off(SignupWelcome());
      Utils.showErrorDialog("Session Expired!!!");
      return;
    }

    return super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
      "${response.statusCode} ${(response.requestOptions.baseUrl + response.requestOptions.path)}",
    );
    debugPrint("Headers:");
    response.headers.forEach((k, v) => debugPrint('$k: $v'));
    debugPrint("Response: ${response.data}");
    debugPrint("END HTTP");
    return super.onResponse(response, handler);
  }
}
