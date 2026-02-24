import 'package:SastaKhana/data/network/api_provider.dart';
import 'package:SastaKhana/utils/app_string.dart';
import 'package:SastaKhana/utils/app_utils.dart';
import 'package:SastaKhana/utils/db_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  Future<void> signIn() async {
    if (emailController.text.trim().isEmpty) {
      Utils.showErrorDialog(AppString.pleaseEnterYourEmail);
      return;
    }
    if (Utils.emailValidation(emailController.text.trim()) == false) {
      Utils.showErrorDialog(AppString.pleaseEnterValidEmail);
      return;
    }
    if (passwordController.text.trim().isEmpty) {
      Utils.showErrorDialog(AppString.pleaseEnterYourPassword);
      return;
    }
    Utils.showLoading();
    Map<String, dynamic> data = {};

    data = {
      "email": emailController.text.trim(),
      "password": passwordController.text.trim(),
      "deviceId": "saasas",
      "fcmToken": "dsdsds",
      "deviceType": GetPlatform.isIOS ? 1 : 2,
    };

    var response = await ApiProvider().loginApi(data);
    Utils.hideLoading();
    if (response.success == true) {
      if (response.body != null) {
        DbHelper().saveUserModel(response.body);
        DbHelper().saveUserToken(response.body?.token);
        if (response.body?.isOtpVerified.toString() == "0") {
          //   Get.toNamed(
          //     AppRoutes.verificationView,
          //     arguments: response.body?.email ?? "",
          //   );
          //   return;
          // }
          // if (response.body?.isZipCode.toString() == "0") {
          //   Get.offAllNamed(AppRoutes.locationView);
          //   return;
          // }
          // Utils.hideKeyboard(Get.context!);
        }
        DbHelper().saveIsLoggedIn(true);
        // Get.offAllNamed(AppRoutes.dashBoardView);
      }
    } else {
      Utils.showErrorDialog(response.message ?? "");
    }
  }
}
