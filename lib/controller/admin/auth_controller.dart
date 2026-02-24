import 'package:get/get.dart';

import '../../utils/camera_Helper.dart';

class AdminAuthController extends GetxController
    implements CameraOnCompleteListener {
  late CameraHelper cameraHelper;
  RxString imagePath = "".obs;
  @override
  void onInit() {
    cameraHelper = CameraHelper(this);
    super.onInit();
  }

  @override
  void onSuccessFile(String file, String fileType) {
    imagePath.value = file;
  }
}
