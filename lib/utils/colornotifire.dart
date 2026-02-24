import 'package:flutter/material.dart';

import 'color.dart';

class ColorNotifire with ChangeNotifier {
  bool isDark = false;
  set setIsDark(value) {
    isDark = value;
    notifyListeners();
  }

  get getIsDark => isDark;

  get getprimerycolor => isDark ? darkPrimeryColor : primeryColor;
  get getcardcolor => isDark ? darkcardColor : cardColor;
  get gettextcolor => isDark ? darktextColor : textColor;
  get getprimetextcolor => isDark ? primetextColor1 : primeTextColor2;
  get getprocolor => isDark ? darkproColor : proColor;
  get gettext1color => isDark ? darktext1Color : text1Color;
  get getwhitecolor => isDark ? whiteColor : darkwhiteColor;
  get getbuttonscolor => isDark ? darkbuttonsColor : buttonsColor;
  get getbuttoncolor => isDark ? buttonboldColor : buttonColor;
  get gettopcolor => isDark ? darktopColor : topColor;
  get getdarkscolor => isDark ? blackColor : darkblackColor;
  get getbluecolor => isDark ? darkblueColor : blueColor;
  get getorangecolor => isDark ? darkorangeColor : orangeColor;
  get getpinkcolor => isDark ? darkpinkColor : pinkColor;
  get getblackcolor => isDark ? darkwhiteColor : whiteColor;
  get getsettingcolor => isDark ? darktopColor : whiteColor;
  get getticketcolor => isDark ? darktopColor1 : buttonColor;
  get getwhite => isDark ? whiteColor : whiteColor;
  get getfieldbg => isDark ? fieldbgColor : fieldbgColor;
  get getbordercolor => isDark ? darktextColor : darktextColor;
  get getboxbgColor => isDark ? boxbgColor : boxbgColor;



  get textcolor => isDark ? Colors.white : const Color(0xff171A1F);
  get textcolor2 => isDark ? Colors.white : const Color(0xff565D6D);
  get textcolor3 => isDark ?  const Color(0xff727272) : Colors.white;
  get textcolor4 => isDark ? const Color(0xff343434) :Colors.white ;
  get backgrounde => isDark ? const Color(0xff161616) : Colors.white;
  get backgrounde1 => isDark ? Colors.white : const Color(0xffE5E5E5);
  get finalticketcolore => isDark ? const Color(0xff161616) : const Color(0xff3F51B5);
  get containercolore => isDark ? const Color(0xff1C1C1C) :  Colors.white;
  get homecontainercolore => isDark ? const Color(0xff1C1C1C) :  const Color(0xff3F51B5);
  get bottommenucolore => isDark ? Colors.white :  const Color(0xff161616).withOpacity(.70);
  get hearedcolore => isDark ? const Color(0xff161616).withOpacity(.70) : Colors.white;

  get bordercolore => isDark ? const Color(0xff1E293B) :  Colors.grey.shade200;
  get newtopbgcolore => isDark ? const Color(0xff161616) :  primeTextColor2;
  get bordercoloreblue => isDark ? const Color(0xff3F51B5) :  Colors.grey.shade200;
  get iconColor => isDark ? Colors.white : darlgreyColor ;



}
