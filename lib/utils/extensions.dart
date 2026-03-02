
import 'package:SastaKhana/data/network/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

extension NavigationExtension on BuildContext {

  Future<T?> launch<T>(
    Widget page, {
    bool isNewTask = false,
    PageRouteAnimation? pageRouteAnimation,
    Duration? duration,
    String? routeName,
    Object? routeArguments,
  }) async {

    final route = buildPageRoute<T>(
      page,
      pageRouteAnimation ?? pageRouteAnimationGlobal,
      duration,
      routeName,
      routeArguments,
    );

    if (isNewTask) {
      return await Navigator.of(this).pushAndRemoveUntil(
        route,
        (route) => false,
      );
    } else {
      return await Navigator.of(this).push(route);
    }
  }
}

extension ImageUrlExtension on String? {
  String toImageUrl() {
    if (this == null || this!.isEmpty) return "";
    return ApiConstants.baseImageUrl + this!;
  }
}

extension DynamicParser on Object? {
  String?  toStringOrNull() {
    if (this == null) return null;
    return toString();
  }
}