import 'package:SastaKhana/modules/admin/AdminBottombar.dart';
import 'package:SastaKhana/data/network/api_provider/auth_api_provider.dart';
import 'package:SastaKhana/modules/admin/AdminHome.dart';
import 'package:SastaKhana/modules/merchent/MarchentHome.dart';
import 'package:SastaKhana/modules/user/UserHome.dart';
import 'package:SastaKhana/utils/app_string.dart';
import 'package:SastaKhana/utils/app_utils.dart';
import 'package:SastaKhana/utils/db_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  Future<void> signIn() async {
    //  Get.offAll(() => AdminBottombar()); //UserBottombar() MerchentBottombar() AdminBottombar() --- IGNORE ---
    //  return;
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

try{
    var response = await AuthApiProvider().loginApi(data);
    if (response.success == true) {
        Utils.sucessSnackBar(response.message ?? "");
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
         Get.offAll(() => UserHome());
      }
    } else {
      Utils.showErrorDialog(response.message ?? "");
    }
  }on Exception catch (e) {
      Utils.showErrorDialog(e.toString());
      if (kDebugMode) {
        print("Signup Error: $e");
      }
    } finally {
      Utils.hideLoading();
    }
  }
}
