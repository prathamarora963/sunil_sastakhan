import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:permission_handler/permission_handler.dart';
import 'color.dart' as AppColor;

class Utils {
  final regexToRemoveEmoji =
      r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])';
  static bool isSnackBarShowing = false;
  static bool isSnackBarErrorShowing = false;
  static bool emailValidation(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(email);
  }

  static void showLoading() {
    Get.context?.loaderOverlay.show();
  }

  static void hideLoading() {
    Get.context?.loaderOverlay.hide();
  }

  static showErrorDialog(String? message) {
    if (message == null || isSnackBarErrorShowing) {
      return;
    }
    isSnackBarErrorShowing = true;
    Get.closeCurrentSnackbar();

    Get.snackbar(
      "Sasta Khana",
      icon: Icon(Icons.notifications, color: AppColor.whiteColor, size: 30),
      message,
      duration: const Duration(seconds: 2),
      backgroundColor: AppColor.redColor,
      padding: const EdgeInsets.only(left: 20, bottom: 10, right: 20, top: 12),
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      borderRadius: 10,
      snackPosition: SnackPosition.TOP,
      colorText: AppColor.whiteColor,
      titleText: Text(
        "Sasta Khana",
        textAlign: TextAlign.start,
        style: TextStyle(
          color: AppColor.whiteColor,
          fontWeight: FontWeight.w700,
          fontSize: 16,
          height: 1.6,
        ),
      ),
      messageText: Text(
        message.tr,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: AppColor.whiteColor,
          fontWeight: FontWeight.w400,
          fontSize: 15,
          height: 1.6,
        ),
      ),
    );
    Future.delayed(const Duration(milliseconds: 4000), () {
      isSnackBarErrorShowing = false;
    });
  }

  // static List<ParentHomeModel?> convertToParentHomeList(List<dynamic> data) {
  //   return data.map((item) => ParentHomeModel.fromJson(item as Map<String, dynamic>)).toList();
  // }

  // static List<ParentHomeModel?> convertToParentHomeDetail(Map<String, dynamic> data) {
  //   return [ParentHomeModel.fromJson(data)];
  // }

  // static List<MessageModel?> convertToInboxList(List<dynamic> data) {
  //   return data.map((item) => MessageModel.fromJson(item as Map<String, dynamic>)).toList();
  // }

  static String chatTimeConverter(String utcDateTime) {
    DateTime dateTime = DateTime.parse(utcDateTime).toLocal();
    return DateFormat('hh:mm a').format(dateTime);
  }

  static sucessSnackBar(String? message) {
    if (message == null || isSnackBarShowing) {
      return;
    }
    isSnackBarShowing = true;
    Get.closeAllSnackbars();
    Get.snackbar(
      "Sasta Khana",
      message,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      icon: const Icon(
        Icons.done_outline_outlined,
        color: Colors.white,
        size: 30,
      ),
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      backgroundColor: AppColor.greenColorPrimery,
      borderRadius: 5,
      snackPosition: SnackPosition.TOP,
      colorText: Colors.white,
      titleText: const Text(
        "Sasta Khana",
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16.0,
        ),
      ),
      duration: const Duration(milliseconds: 1800),
      animationDuration: const Duration(milliseconds: 600),
      messageText: Text(
        message.tr,
        textAlign: TextAlign.start,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ),
    );
    Future.delayed(const Duration(milliseconds: 4000), () {
      isSnackBarShowing = false;
    });
  }

  static String convertTimeFormat(String time) {
    try {
      DateTime dateTime = DateFormat("HH:mm:ss").parse(time);
      return DateFormat("hh:mm a").format(dateTime);
    } catch (e) {
      return "Invalid Time Format";
    }
  }

  Future<Position?> getCurrentLocation() async {
    Position? position;
    if (!await Utils.isLocationEnabled()) {
      Utils.sucessSnackBar("Location permission denied. Please allow access.");
      Utils.hideLoading();
      return null;
    } else {
      try {
        position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        Utils.hideLoading();
        return position;
      } catch (e) {
        Utils.hideLoading();
        if (kDebugMode) {
          print(e.toString());
        }
        return null;
      }
    }
  }

  Future<String?> getAddressFromLatLng(
    latitude,
    longitude, {
    RxString? currentLocationAddress,
  }) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude,
        longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        debugPrint(
          "${place.locality}, ${place.administrativeArea}, ${place.country}, ${place.postalCode}",
        );
        Utils.hideLoading();
        currentLocationAddress?.value =
            "${place.locality}, ${place.administrativeArea}, ${place.country}";
        return "${place.locality}, ${place.administrativeArea}, ${place.country}, ${place.postalCode}";
      } else {
        return 'Unable to determine location';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }

  static Future<String> selectDate({
    String? dateFormat,
    required DateTime initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
  }) async {
    final DateTime? pickedDate = await showDatePicker(
      builder: (context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              onPrimary: AppColor.whiteColor,
              primary: AppColor.greenColorPrimery,
              surface: AppColor.whiteColor,
              onSurface: AppColor.blackColor,
            ),
            dialogBackgroundColor: AppColor.whiteColor,
          ),
          child: child!,
        );
      },
      context: Get.context!,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (pickedDate != null) {
      return DateFormat(
        dateFormat ?? "yyyy-MM-dd",
      ).format(pickedDate).toString();
    }
    return "";
  }

  static Future<String> selectTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColor.greenColorPrimery,
              onPrimary: AppColor.whiteColor,
              onSurface: AppColor.blackColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      final hour = pickedTime.hourOfPeriod == 0 ? 12 : pickedTime.hourOfPeriod;
      final minute = pickedTime.minute.toString().padLeft(2, '0');
      final period = pickedTime.period == DayPeriod.am ? "AM" : "PM";
      return "$hour:$minute $period";
    }
    return "";
  }

  static String formatDate(String isoDate) {
    // Parse the ISO 8601 date string into DateTime
    DateTime dateTime = DateTime.parse(isoDate).toLocal();

    // Format the date into the required format (e.g., 'Sep 06, 2014')
    return DateFormat('MMM dd, yyyy').format(dateTime);
  }

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Future<bool> isLocationEnabled() async {
    var status = await Permission.location.status;

    if (status.isGranted) {
      return true;
    }

    var newStatus = await Permission.location.request();
    print("Camera Permission Status: $newStatus");

    if (newStatus.isGranted) {
      return true;
    } else if (newStatus.isPermanentlyDenied) {
      Future.delayed(const Duration(seconds: 1), () async {
        Utils.sucessSnackBar(
          "Location permission denied. Please allow access.",
        );
        await openAppSettings();
      });
      return false;
    } else {
      Get.back();
      Utils.sucessSnackBar("Location permission denied. Please allow access.");
      Future.delayed(const Duration(seconds: 1), () async {
        await openAppSettings();
      });
      return false;
    }
  }
}
