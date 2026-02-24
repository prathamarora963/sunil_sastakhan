import 'package:flutter/material.dart';

import '../../utils/color.dart';


class DarkTheme {
  static const String AppFont = "Raleway";
  static ThemeData darkTheme() =>  ThemeData(
    primaryColor: darkPrimeryColor,
    hintColor: darkPrimeryColor,
    // buttonColor: darkPrimeryColor,
    cardColor: darkPrimeryColor,
    indicatorColor: darkPrimeryColor,
    //cursorColor: Colors.white,
    textTheme: TextTheme(
    bodyLarge: TextStyle(
        fontFamily: AppFont,  fontSize: 14),
    bodyMedium: TextStyle(
      fontFamily: AppFont,
      color: darkgrey_60,
      fontSize: 12,
    ),
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
        fontFamily: AppFont, color:darkgrey_60, fontSize: 18),
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
  ), colorScheme: darkColorScheme,
  );

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xFFB93C5D),
    onPrimary: Colors.black,
    secondary: Color(0xFFEFF3F3),
    onSecondary: Color(0xFF322942),
    error: Colors.redAccent,
    onError: Colors.white,
    surface: Color(0xFFFAFBFB),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );
  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color(0xFFFF8383),
    secondary: Color(0xFF4D1F7C),
    surface: Color(0xFF1F1929),
    error: Colors.redAccent,
    onError: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    brightness: Brightness.dark,
  );
}
