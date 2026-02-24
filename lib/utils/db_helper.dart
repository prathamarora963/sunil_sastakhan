import 'dart:convert';
import 'package:get_storage/get_storage.dart';

import '../data/models/user_model.dart';

class DbHelper {
  static final DbHelper _singleton = DbHelper._internal();
  static late GetStorage getStorage;

  static const String _rememberMe = "rememberMe";
  static const String _userRole = "userRole";
  static const String cartValue = "cartValue";
  static const String _userId = "userId";
  static const String _cartId = "cartId";
  static const String _userToken = "userToken";
  static const String _isLoggedIn = "isLoggedIn";
  static const String _isUserOrder = "isUserOrder";
  static const String languageKey = "languageKey";
  static const String _userModel = "userModel";
  static const String _notificationStatus = "notificationStatus";
  static const String _recommendationList = "recommendationList";
  static const String _shopId = "shopId";
  static const String _catId = "catId";
  static const String _shopStatus = "shopStatus";
  static const String _driverStatus = "driverStatus";

  static const JsonDecoder _decoder = JsonDecoder();
  static const JsonEncoder _encoder = JsonEncoder.withIndent('  ');

  factory DbHelper() {
    return _singleton;
  }

  DbHelper._internal() {
    getStorage = GetStorage();
    _init();
  }

  Future<void> _init() async {
    await GetStorage.init();
    getStorage = GetStorage();
  }

  Future<void> _savePref(String key, Object? value) async {
    var prefs = getStorage;
    if (prefs.hasData(key)) {
      prefs.remove(key);
    }
    if (value is bool) {
      return prefs.write(key, value);
    } else if (value is int) {
      return prefs.write(key, value);
    } else if (value is String) {
      return prefs.write(key, value);
    } else if (value is double) {
      return prefs.write(key, value);
    } else if (value is List<String>) {
      return prefs.write(key, value);
    }
  }

  T _getPref<T>(String key) {
    return getStorage.read(key) as T;
  }

  void clearAll() {
    getStorage.erase();
  }

  static void clearWithRememberMe() {
    List<String> allKeys = List.from(getStorage.getKeys());
    for (String key in allKeys) {
      if (!_rememberMe.contains(key)) {
        getStorage.remove(key);
      }
    }
  }

  String? getUserId() {
    return _getPref(_userId);
  }

  void saveUserId(String? userId) {
    _savePref(_userId, userId);
  }

  int? getUserRole() {
    return _getPref(_userRole);
  }

  int? getCartValue() {
    return _getPref(cartValue) ?? 0;
  }

  void saveUserRole(int? userRole) {
    _savePref(_userRole, userRole);
  }

  void saveCartValue(int? cartValues) {
    _savePref(cartValue, cartValues);
  }

  String? getUserToken() {
    return _getPref(_userToken);
  }

  String? getCartId() {
    return _getPref(_cartId);
  }

  void saveNotificationStatus(String? notificationStatus) {
    _savePref(_notificationStatus, notificationStatus);
  }

  String? getNotificationStatus() {
    return _getPref(_notificationStatus) ?? "0";
  }

  void saveRecommendationList(List<String>? list) {
    if (list != null) {
      _savePref(_recommendationList, list);
    } else {
      _savePref(_recommendationList, []);
    }
  }

  List<String> getRecommendationList() {
    return getStorage.read(_recommendationList)?.cast<String>() ?? [];
  }

  String? getLanguage() {
    return _getPref(languageKey);
  }

  void saveLanguage(String? userId) {
    _savePref(languageKey, userId);
  }

  void saveCartId(String? cartId) {
    _savePref(_cartId, cartId);
  }

  void saveShopId(String? shopId) {
    _savePref(_shopId, shopId);
  }

  String? getShopId() {
    return _getPref(_shopId);
  }

  void saveCatId(String? catId) {
    _savePref(_catId, catId);
  }

  String? getCatId() {
    return _getPref(_catId) ?? "0";
  }

  void saveShopStatus(String? shopStatus) {
    _savePref(_shopStatus, shopStatus);
  }

  String? getShopStatus() {
    return _getPref(_shopStatus) ?? "1";
  }

  void saveDriverStatus(String? driverStatus) {
    _savePref(_driverStatus, driverStatus);
  }

  String? getDriverStatus() {
    return _getPref(_driverStatus) ?? "0";
  }

  void saveUserToken(String? token) {
    _savePref(_userToken, token);
  }

  UserModel? getUserModel() {
    String? user = _getPref(_userModel);
    if (user != null) {
      Map<String, dynamic> userMap = _decoder.convert(user);
      return UserModel.fromJson(userMap);
    } else {
      return null;
    }
  }

  void saveUserModel(UserModel? userModel) {
    if (userModel != null) {
      String value = _encoder.convert(userModel);
      _savePref(_userModel, value);
    } else {
      _savePref(_userModel, null);
    }
  }

  // UserModel? getRememberMe() {
  //   String? user = _getPref(_rememberMe);
  //   if (user != null) {
  //     Map<String, dynamic> userMap = _decoder.convert(user);
  //     return UserModel.fromJson(userMap);
  //   } else {
  //     return null;
  //   }
  // }

  // void saveRememberMe(UserModel? userModel) {
  //   if (userModel != null) {
  //     String value = _encoder.convert(userModel);
  //     _savePref(_rememberMe, value);
  //   } else {
  //     _savePref(_rememberMe, null);
  //   }
  // }

  bool getIsLoggedIn() {
    return _getPref(_isLoggedIn) ?? false;
  }

  void saveIsLoggedIn(bool value) {
    _savePref(_isLoggedIn, value);
  }

  bool getIsUserOrder() {
    return _getPref(_isUserOrder) ?? false;
  }

  void saveIsUserOrder(bool value) {
    _savePref(_isUserOrder, value);
  }

  bool getAILogin() {
    return _getPref("getAILogin") ?? true;
  }

  void saveAILogin(bool value) {
    _savePref("getAILogin", value);
  }

  bool getFertilizer() {
    return _getPref("getFertilizer") ?? true;
  }

  void saveFertilizer(bool value) {
    _savePref("getFertilizer", value);
  }

  bool getGardenWork() {
    return _getPref("getGardenWork") ?? false;
  }

  void saveGardenWork(bool value) {
    _savePref("getGardenWork", value);
  }

  bool getWeatherIrrigation() {
    return _getPref("getWeatherIrrigation") ?? true;
  }

  void saveWeatherIrrigation(bool value) {
    _savePref("getWeatherIrrigation", value);
  }

  bool getLinkTree() {
    return _getPref("getLinkTree") ?? true;
  }

  void saveLinkTree(bool value) {
    _savePref("getLinkTree", value);
  }

/*  NotificationEntity? convertStringToNotificationEntity(String? value) {
    if (value == null) {
      return null;
    }
    Map<String, dynamic> map = _decoder.convert(value);
    return NotificationEntity.fromJson(map);
  }

  String convertNotificationEntityToString(
    NotificationEntity? notificationEntity,
  ) {
    String value = _encoder.convert(notificationEntity);
    return value;
  }*/
}
