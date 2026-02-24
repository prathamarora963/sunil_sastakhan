import 'dart:ui';

import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import 'color.dart';

Future<Color> getMaterialYouData() async {
  return darkPrimeryColor;
}
/*
Future<Color> getMaterialYouData() async {
  if (appStore.useMaterialYouTheme && await isAndroid12Above()) {
    return await getMaterialYouPrimaryColor() ?? darkPrimeryColor;
  } else {
    return darkPrimeryColor;
  }
}*/
