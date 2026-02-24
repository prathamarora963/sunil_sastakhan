import 'package:SastaKhana/utils/app_utils.dart';
import 'package:SastaKhana/utils/camera_Helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MerchantAuthController extends GetxController
    implements CameraOnCompleteListener {
  late CameraHelper cameraHelper;
  RxString logoPic = "".obs;
  RxList<String> shopImageList = List.filled(6, "").obs;
  RxBool uploadStoreLogo = true.obs;
  RxInt selectShopImageIndex = RxInt(0);
  RxList timings = [
    "Everyday",
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
  ].map((day) => DayTiming(day: day)).toList().obs;
  Future<void> setTime(int index, bool isStart) async {
    String picked = await Utils.selectTime();
    if (picked.isNotEmpty) {
      if (isStart) {
        timings[index].startTime.value = picked;
      } else {
        timings[index].endTime.value = picked;
      }
    }
  }

  void toggleDay(int index, bool val) {
    timings[index].isOpen.value = val;
    timings.refresh();
  }

  @override
  void onInit() {
    cameraHelper = CameraHelper(this);
    super.onInit();
  }

  @override
  void onSuccessFile(String file, String fileType) {
    if (uploadStoreLogo.value) {
      logoPic.value = file;
    } else {
      shopImageList[selectShopImageIndex.value] = file;
      shopImageList.refresh();
    }
  }
}

class DayTiming {
  String day;
  RxBool isOpen = false.obs;
  RxString startTime = "".obs; // Holds the selected time string
  RxString endTime = "".obs;

  DayTiming({required this.day});
}
