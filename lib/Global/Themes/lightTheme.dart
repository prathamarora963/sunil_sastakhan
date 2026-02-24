import 'package:flutter/material.dart';

import '../../utils/color.dart';


class LightTheme {
  static const String AppFont = "Raleway";
  static ThemeData lightTheme() => ThemeData(
    primaryColor: darkPrimeryColor,
    hintColor: darkPrimeryColor,
    // buttonColor: darkPrimeryColor,
    cardColor: darkPrimeryColor,
    indicatorColor: darkPrimeryColor,
    //cursorColor: darkPrimeryColor,
    textTheme: TextTheme(
    bodyLarge: TextStyle(
        fontFamily: AppFont, color: darkgrey_60, fontSize: 14),
    bodyMedium: TextStyle(
        fontFamily: AppFont, color: darkgrey_60, fontSize: 12),
    labelLarge: TextStyle(
      fontFamily: AppFont,
      color: Colors.white,
      fontSize: 20.0,
    ),
    displayLarge: TextStyle(
        fontFamily: AppFont, color: Colors.black, fontSize: 20),
      displayMedium: TextStyle(
        fontFamily: AppFont, color: darkgrey_60, fontSize: 16),
      displaySmall: TextStyle(
        fontFamily: AppFont, color: Colors.black, fontSize: 18),
      headlineMedium: TextStyle(
        fontFamily: AppFont,
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.bold),
    bodySmall: TextStyle(
        fontFamily: AppFont, color: darkgrey_60, fontSize: 14),
    labelSmall: TextStyle(fontFamily: AppFont, color: Colors.white, fontSize: 16),
    titleMedium: TextStyle(
      fontFamily: AppFont,
      color: darkgrey_60,
      fontSize: 25,
    ),
  ), colorScheme: lightColorScheme
  );
  static ColorScheme lightColorScheme = ColorScheme(
    primary: darkPrimeryColor,
    onPrimary: onPrimary,
    secondary: secondary,
    onSecondary: onSecondary,
    error: error,
    onError: onError,
    surface: onPrimary,
    onSurface: onSurface,
    brightness: Brightness.light,
  );
}
