import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'color.dart';


class CommonUtills {
  static Future<bool> ConnectionStatus() async {
    final bool isConnected = await InternetConnection().hasInternetAccess;
    if (isConnected) {
      // print('Internet Connected!');
      return true;
    } else {
      print('No internet connection.');
    }
    return false;
  }
  static Future<bool> ConnectionStatusOld() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    bool exists = connectivityResult.any((element) => element.name == "wifi" || element.name == "mobile");
    if (exists) {
      return true;
    }
    return false;

  }

  static Size displaySize(BuildContext context) {
    debugPrint('Size = ' + MediaQuery
        .of(context)
        .size
        .toString());
    return MediaQuery
        .of(context)
        .size;
  }

  static double displayHeight(BuildContext context) {
    debugPrint('Height = ' + displaySize(context).height.toString());
    return displaySize(context).height;
  }

  static double displayWidth(BuildContext context) {
    debugPrint('Width = ' + displaySize(context).width.toString());
    return displaySize(context).width;
  }

  static flutterToast(String msg) {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
  static showOfflineToast1({double delay = 1}) {
    BotToast.showText(
      text: "You are not connected to internet",
      duration: Duration(seconds: (2 * delay).ceil()),
      textStyle: TextStyle(fontSize: 14, color: Colors.white),
    ); //popup a text toast;
  }
  static String parseHtmlString(String htmlString) {
    RegExp exp = RegExp(
        r"<[^>]*>",
        multiLine: true,
        caseSensitive: true
    );
    return htmlString.replaceAll(exp, '');
  }
  static Widget isLoadingCircular() {
    return Column(
      children: [
        SizedBox(height: Get.height * 0.40),
        Center(
          child: CircularProgressIndicator(color: buttonColor),
        ),
      ],
    );
  }
  /*static String gethtmltitle(String htmlString) {
    var document = parse(htmlString);
    String id = document.body.outerHtml;

    return id;
  }*/

  static String getupdateDateTime(String datetimeStr) {
    DateTime tempDate = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(
        datetimeStr);
//   "updated_at":"2020-05-15 16:34:11",  createdDate": "2023-12-06 17:29:55",
    final DateFormat formatter = DateFormat('yMMMd');
    final String formatted = formatter.format(tempDate);
    // print(formatted);
    return formatted;
  }

  static String getCurentDate() {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    print(formattedDate); // 2016-01-25
    return formattedDate;
  }

  static showtoast(String string) {
    Fluttertoast.showToast(
        msg: "$string",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey[800],
        textColor: Colors.white,
        fontSize: 16.0);
  }
  static String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Morning ';
    }
    if (hour < 17) {
      return 'Afternoon ';
    }
    return 'Evening ';
  }

  static logOut(BuildContext context){

   /* showConfirmDialogCustom(
      context,
      title: "Do you want to logout from the app?",
      dialogType: DialogType.CONFIRMATION,
      onAccept: (context) {
        appStore.setToken("");
        logoutApp(context);
        // DashBoardScreen().launch(context,pageRouteAnimation: PageRouteAnimation.Fade,isNewTask: true);
      },
    );*/

  }

  //open url
  static Future<void> openUrl(String url) async {
    Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
  //! --------|| Open Url ||-------
  static Future<void> launchInBrowser(String url) async {
    Uri _url = Uri.parse(url);
    if (!await launchUrl(
      _url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  static Future<bool> isTablet(BuildContext context) async {
    bool isTab = false;
    if (Platform.isIOS) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      if(iosInfo.model?.toLowerCase() == "ipad") {
        isTab = true;
      } else {
        isTab = false;
      }
      return isTab;
    } else {
      var shortestSide = MediaQuery.of(context).size.shortestSide;
      if(shortestSide > 600) {
        isTab = true;
      } else {
        isTab = false;
      }
      return isTab;
    }
  }
}