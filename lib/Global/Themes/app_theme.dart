
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:nb_utils/nb_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color.dart';


double header1=24.sp;
double header2=20.sp;
double header3=16.sp;

double subtitle1=18.sp;
double subtitle2=16.sp;

double bodyText1=16.sp;
double bodyText2=14.sp;

double buttonSize=18.sp;

double fontSize1=24.sp;
double fontSize2=20;
double fontSize3=18;
double bodyText1Size=16;
double bodyText2Size=14;
double bodyText3Size=12;
double buttonTextStyleSize=16;
double linkStyleSize=12;
class AppTheme {
  //
  AppTheme._();

  static ThemeData lightTheme({Color? color}) => ThemeData(
    primarySwatch: createMaterialColor(color ?? darkPrimeryColor),
    primaryColor: color ?? darkPrimeryColor,
    scaffoldBackgroundColor: Colors.white,
    //fontFamily: GoogleFonts.workSans().fontFamily,
    useMaterial3: true,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Colors.white),
    iconTheme: IconThemeData(color: darkPrimeryColor),

    textTheme: TextTheme(
      displayLarge: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: header1),
      displayMedium: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: header2),
      displaySmall: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: header3),
        headlineMedium: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: header1),
        headlineSmall: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: header2),
        titleLarge: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: header3),
      titleMedium: TextStyle(color: Colors.black26,fontWeight: FontWeight.w400,fontSize: subtitle1),
      titleSmall: TextStyle(color: Colors.black26,fontWeight: FontWeight.w400,fontSize: subtitle2),
      bodyLarge:  TextStyle(color: Colors.black,fontSize: bodyText1),
      bodyMedium:  TextStyle(color: Colors.black,fontSize: bodyText2),
      labelLarge: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: buttonSize)


    ),
    unselectedWidgetColor: Colors.black,
    dividerColor: Colors.black,
    //buttonColor: darkPrimeryColor,
    cardTheme: CardThemeData(color: Colors.white,),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: darkPrimeryColor, fixedSize: Size.fromHeight(10)
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: darkPrimeryColor, backgroundColor: darkPrimeryColor,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: darkPrimeryColor, backgroundColor: Colors.white,
      ),
    ),
    buttonTheme: ButtonThemeData(buttonColor: darkPrimeryColor,
      shape: RoundedRectangleBorder(),
      textTheme: ButtonTextTheme.accent, ),
    bottomSheetTheme: BottomSheetThemeData(
      shape: RoundedRectangleBorder(borderRadius: radiusOnly(topLeft: defaultRadius, topRight: defaultRadius)),
      backgroundColor: Colors.white,
    ),
    cardColor: Colors.white,
    appBarTheme: AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light)),
    dialogTheme: DialogThemeData(shape: dialogShape()),
    pageTransitionsTheme: PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );

  static ThemeData darkTheme({Color? color}) => ThemeData(
    primarySwatch: createMaterialColor(darkPrimeryColor),
    primaryColor: darkPrimeryColor,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
    ),
    scaffoldBackgroundColor: darkPrimeryColor,
   // fontFamily: GoogleFonts.workSans().fontFamily,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: darkPrimeryColor),
    iconTheme: IconThemeData(color: Colors.white),
   // textTheme: GoogleFonts.workSansTextTheme(),
    dialogBackgroundColor: darkPrimeryColor,
    unselectedWidgetColor: Colors.white60,
    useMaterial3: true,
    bottomSheetTheme: BottomSheetThemeData(
      shape: RoundedRectangleBorder(borderRadius: radiusOnly(topLeft: defaultRadius, topRight: defaultRadius)),
      backgroundColor: darkPrimeryColor,
    ),
    dividerColor: dividerDarkColor,
    cardColor: darkPrimeryColor,
    dialogTheme: DialogThemeData(shape: dialogShape()),
  ).copyWith(
    pageTransitionsTheme: PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );
}

