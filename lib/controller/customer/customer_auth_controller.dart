import 'package:SastaKhana/utils/camera_Helper.dart';
import 'package:get/get.dart';

class CustomerAuthController extends GetxController
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
