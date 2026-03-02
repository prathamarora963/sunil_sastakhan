import 'package:SastaKhana/modules/admin/AdminBottombar.dart';
import 'package:SastaKhana/modules/merchent/MerchentBottombar.dart';
import 'package:SastaKhana/data/network/api_provider/auth_api_provider.dart';
import 'package:SastaKhana/modules/user/PhoneVerification.dart';
import 'package:SastaKhana/utils/app_utils.dart';
import 'package:SastaKhana/utils/camera_Helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
      () => SignupController(),
      fenix: true, // Recreates controller when needed after deletion
    );
  }
}

class SignupController extends GetxController implements CameraOnCompleteListener {
  // Form field observables for reactive updates
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Merchant signup fields
  TextEditingController storeNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final categoryController = 0.obs;
  TextEditingController addressController = TextEditingController();
  TextEditingController cityIdController = TextEditingController();
  TextEditingController stateIdController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController contactPersonController = TextEditingController();
  TextEditingController merchantPhoneController = TextEditingController();
  TextEditingController merchantEmailController = TextEditingController();
  TextEditingController merchantPasswordController = TextEditingController();
  TextEditingController agentController = TextEditingController();
  TextEditingController gstNumberController = TextEditingController();
  TextEditingController panNumberController = TextEditingController();

  // Device info observables
  final deviceId = ''.obs;
  final deviceType = ''.obs;


// Image paths for merchant signup
    RxString logoPic = "".obs;
    RxList<String> shopImageList = List.filled(6, "").obs;
    RxString fssaiDoc = "".obs;
    RxString panCardDoc = "".obs;
    RxString merchantDoc = "".obs;
    RxString otherDoc = "".obs;

  // Business timing observables
  late RxList<DayTiming> timings;

  
  late CameraHelper cameraHelper;

  // API provider instance
  late AuthApiProvider _apiProvider;

  @override
  void onInit() {
    super.onInit();
    cameraHelper = CameraHelper(this);
    _apiProvider = AuthApiProvider();
    loadDeviceInfo();
    _initializeTimings();
  }
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    bioController.dispose();
    passwordController.dispose();
    storeNameController.dispose();
    descriptionController.dispose();
    addressController.dispose();
    cityIdController.dispose();
    stateIdController.dispose();
    pincodeController.dispose();
    contactPersonController.dispose();
    merchantPhoneController.dispose();
    merchantEmailController.dispose();
    merchantPasswordController.dispose();
    agentController.dispose();
    gstNumberController.dispose();
    panNumberController.dispose();
    categoryController.value = 0;
    
        super.dispose();
      }

  void _initializeTimings() {
    timings = [
      "Everyday",
      "Sunday",
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
    ].map((day) => DayTiming(day: day)).toList().obs;
  }

  void loadDeviceInfo() {
    deviceId.value = Utils.deviceID;
    deviceType.value = Utils.deviceType;
  }


 
  /// Perform signup API call with all data.  
  /// [isCustomer] flag determines the post-signup navigation flow.
  /// If true, navigates to phone verification. If false, navigates to admin dashboard.
  /// this function only perfoms customer signup, for admin signup 
  Future<void> performSignup({bool isCustomer = false}) async {
    // Validate form first
    if (!validateForm()) {
      return;
    }

    try {
      Utils.showLoading();

      // Prepare signup data with dynamic user data + static device info
      Map<String, dynamic> signupData = {
        "name": nameController.text.trim().toString(),
        "phone": phoneController.text.trim().toString(),
        "email": emailController.text.trim().toString(),
        "bio": bioController.text.trim().toString(),
        "password": passwordController.text.trim().toString(),
        "deviceId": deviceId.value, // Static device ID (same for each device)
        "deviceType":
            deviceType.value, // Static device type (same for each device)
      };

      if (kDebugMode) {
        print("Signup Data: $signupData");
      }

      // Call signup API
      final response = await _apiProvider.customerSignup(signupData);

      if (response.success ?? false) {
        // Signup successful
        Utils.sucessSnackBar(response.message ?? "Signup successful!");
        switch (isCustomer) {
          case true:
            Get.to(() => PhoneVerification());
            break;
          case false:
            Get.offAll(() => AdminBottombar());
            break;
        }
      } else {
        // Signup failed
        Utils.showErrorDialog(
          response.message ?? "Signup failed. Please try again.",
        );
      }
    } on Exception catch (e) {
      Utils.showErrorDialog(e.toString());
      if (kDebugMode) {
        print("Signup Error: $e");
      }
    } finally {
      Utils.hideLoading();
    }
  }


// this function is only for merchant signup, 
  Future<void> performMerchantSignup() async {
    // Validate form first
    if (!validateMerchantForm()) {
      return;
    }

    try {

      Utils.showLoading();

      // Prepare merchant signup data
      Map<String, dynamic> merchantSignupData = {
        "storeName": storeNameController.text.trim(),
        "description": descriptionController.text.trim(),
        "category": categoryController.value.toString(), // Assuming category is stored as an observable integer ID
        "address": addressController.text.trim(),
        "cityId": cityIdController.text.trim(),
        "StateId": stateIdController.text.trim(),
        "pincode": pincodeController.text.trim(),
        "contactPerson": contactPersonController.text.trim(),
        "phone": merchantPhoneController.text.trim(),
        "email": merchantEmailController.text.trim(),
        "password": merchantPasswordController.text.trim(),
        "agent": agentController.text.trim(),
        "deviceId": deviceId.value,
        "deviceType": deviceType.value,
        "gstnumber": gstNumberController.text.trim(),
        "pannumber": panNumberController.text.trim(),
        "businessTiming": buildBusinessTiming(),
        "logo": logoPic.value,
        "shop_images[]": shopImageList.where((image) => image.isNotEmpty).toList(),
        "fssai_certificate": fssaiDoc.value,
        "pan_card": panCardDoc.value,
        "merchant_identity": merchantDoc.value,
        "other_document": otherDoc.value,
        'fcmToken':"token"
      };

      if (kDebugMode) {
        print("Merchant Signup Data: $merchantSignupData");
      }

      // Call merchant signup API
      final response = await _apiProvider.merchantSignup(merchantSignupData);

      if (response.success ?? false) {
        // Signup successful
        Utils.sucessSnackBar(response.message ?? "Merchant signup successful!");
        // Navigate to merchant dashboard or next screen
        Get.offAll(() => MerchentBottombar());
      } else {
        // Signup failed
        Utils.showErrorDialog(
          response.message ?? "Merchant signup failed. Please try again.",
        );
      }
    } on Exception catch (e) {
      Utils.showErrorDialog(e.toString());
      if (kDebugMode) {
        print("Merchant Signup Error: $e");
      }
    } finally {
      Utils.hideLoading();
    }
  }





// Validate form fields before making API call. Shows error dialogs for invalid inputs.
   bool validateForm() {
    if (nameController.text.trim().toString().isEmpty) {
      Utils.showErrorDialog("Name is required");
      return false;
    }

    if (phoneController.text.trim().toString().isEmpty ||
        phoneController.text.trim().toString().length < 10) {
      Utils.showErrorDialog("Valid phone number is required");
      return false;
    }

    if (emailController.text.trim().toString().isEmpty) {
      Utils.showErrorDialog("Email is required");
      return false;
    }

    if (!GetUtils.isEmail(emailController.text.trim().toString())) {
      Utils.showErrorDialog("Please enter a valid email");
      return false;
    }

    if (passwordController.text.trim().toString().isEmpty ||
        passwordController.text.trim().toString().length < 6) {
      Utils.showErrorDialog("Password must be at least 6 characters");
      return false;
    }

    if (deviceId.value.isEmpty || deviceType.value.isEmpty) {
      Utils.showErrorDialog("Device information not available");
      return false;
    }

    return true;
  }


  bool validateMerchantForm() {
    if (storeNameController.text.trim().isEmpty) {
      Utils.showErrorDialog("Store name is required");
      return false;
    }
    if (descriptionController.text.trim().isEmpty) {
      Utils.showErrorDialog("Description is required");
      return false;
    }
    if (categoryController.value == 0) {
      Utils.showErrorDialog("Category is required");
      return false;
    }
    if (addressController.text.trim().isEmpty) {
      Utils.showErrorDialog("Address is required");
      return false;
    }
    // if (cityIdController.text.trim().isEmpty) {
    //   Utils.showErrorDialog("City ID is required");
    //   return false;
    // }
    // if (stateIdController.text.trim().isEmpty) {
    //   Utils.showErrorDialog("State ID is required");
    //   return false;
    // }
    if (pincodeController.text.trim().isEmpty) {
      Utils.showErrorDialog("Pincode is required");
      return false;
    }
    if (contactPersonController.text.trim().isEmpty) {
      Utils.showErrorDialog("Contact person is required");
      return false;
    }
    // if (merchantPhoneController.text.trim().isEmpty ||
    //     merchantPhoneController.text.trim().length < 10) {
    //   Utils.showErrorDialog("Valid phone number is required");
    //   return false;
    // }
    if (merchantEmailController.text.trim().isEmpty) {
      Utils.showErrorDialog("Email is required");
      return false;
    }
    if (!GetUtils.isEmail(merchantEmailController.text.trim())) {
      Utils.showErrorDialog("Please enter a valid email");
      return false;
    }
    // if (merchantPasswordController.text.trim().isEmpty ||
    //     merchantPasswordController.text.trim().length < 6) {
    //   Utils.showErrorDialog("Password must be at least 6 characters");
    //   return false;
    // }
    if (deviceId.value.isEmpty || deviceType.value.isEmpty) {
      Utils.showErrorDialog("Device information not available");
      return false;
    }
    // Additional validations for GST and PAN can be added here
    return true;
  }

  /// Set opening or closing time for a specific day
  /// [index] - Index in the timings list
  /// [isStart] - true for opening time, false for closing time
  /// If setting time for "Everyday" (index 0), sync to all other days if "Everyday" is selected
  Future<void> setTime(int index, bool isStart) async {
    String picked = await Utils.selectTime();
    if (picked.isNotEmpty) {
      if (isStart) {
        timings[index].startTime.value = picked;
      } else {
        timings[index].endTime.value = picked;
      }
      
      // If setting time for "Everyday" (index 0) and it's selected, sync to all days
      if (index == 0 && timings[0].isOpen.value) {
        _syncEverydayTimesToAllDays();
      }
    }
  }

  /// Sync "Everyday" times to all individual days
  void _syncEverydayTimesToAllDays() {
    for (int i = 1; i < timings.length; i++) {
      timings[i].startTime.value = timings[0].startTime.value;
      timings[i].endTime.value = timings[0].endTime.value;
    }
    timings.refresh();
  }

  /// Toggle day selection with smart "Everyday" logic
  /// If "Everyday" (index 0) is toggled:
  ///   - Toggling ON: Select all days and copy "Everyday" times to all days
  ///   - Toggling OFF: Deselect all days
  /// If any other day is toggled:
  ///   - If deselecting while "Everyday" is ON: Deselect only that day and "Everyday", keep others ON
  ///   - If all individual days are selected: Auto-select "Everyday"
  ///   - Otherwise: Just toggle that specific day
 void toggleDay(int index, bool val) {
  if (index == 0) {
    // ===== EVERYDAY TOGGLED =====
    timings[0].isOpen.value = val;

    if (val) {
      // Turn ON all days + sync time
      for (int i = 1; i < timings.length; i++) {
        timings[i].isOpen.value = true;
        timings[i].startTime.value = timings[0].startTime.value;
        timings[i].endTime.value = timings[0].endTime.value;
      }
    } else {
      // Turn OFF everything
      for (var timing in timings) {
        timing.isOpen.value = false;
        timing.startTime.value = "";
        timing.endTime.value = "";
      }
    }
  } else {
    // ===== INDIVIDUAL DAY TOGGLED =====
    timings[index].isOpen.value = val;

    // If Everyday is ON and one day turns OFF
    if (!val && timings[0].isOpen.value) {
      timings[0].isOpen.value = false;
      // IMPORTANT: DO NOT clear times
    }

    // Auto-enable Everyday if all days selected
    if (val) {
      bool allSelected = true;
      for (int i = 1; i < timings.length; i++) {
        if (!timings[i].isOpen.value) {
          allSelected = false;
          break;
        }
      }

      if (allSelected) {
        timings[0].isOpen.value = true;

        // Optional: sync times from first day
        timings[0].startTime.value = timings[1].startTime.value;
        timings[0].endTime.value = timings[1].endTime.value;
      }
    }
  }

  timings.refresh();
}
  /// Build business timing list in API format
  /// Returns a list of timing entries for selected days
  /// Excludes "Everyday" entry and only includes days with start and end times
  List<Map<String, dynamic>> buildBusinessTiming() {
    List<Map<String, dynamic>> result = [];

    for (int i = 1; i < timings.length; i++) {
      // Skip "Everyday" (index 0)
      final timing = timings[i];
      if (timing.isOpen.value &&
          timing.startTime.value.isNotEmpty &&
          timing.endTime.value.isNotEmpty) {
        result.add({
          "day": timing.day,
          "timing": {
            "from": timing.startTime.value,
            "to": timing.endTime.value
          }
        });
      }
    }

    return result;
  }

  /// Clear all timing selections
  void clearBusinessTiming() {
    for (var timing in timings) {
      timing.isOpen.value = false;
      timing.startTime.value = "";
      timing.endTime.value = "";
    }
    timings.refresh();
  }
  
  @override
  void onSuccessFile(String file, String fileType,{ImageType? imageType}) {
    switch(imageType){
      case .logo:
        logoPic.value = file;
        break;
      case .shopImages:
        int emptyIndex = shopImageList.indexWhere((element) => element.isEmpty);
      if (emptyIndex != -1) {
        shopImageList[emptyIndex] = file;
        shopImageList.refresh();
      } else {
        Utils.showErrorDialog("Maximum of 6 shop images allowed");
      }
      break;
      case .fssaiDoc:
        fssaiDoc.value = file;
        break;
      case .panCardDoc:
        panCardDoc.value = file;
        break;
      case .merchantDoc:
        merchantDoc.value = file;
        break;
      case .otherDoc:
        otherDoc.value = file;
        break;
      default:
      break;
    }
  
   
  }

}

/// Model class for managing daily business timing
/// Represents a single day's opening and closing times
class DayTiming {
  String day;
  RxBool isOpen = false.obs;
  RxString startTime = "".obs; // Opening time (e.g., "10:00 AM")
  RxString endTime = "".obs;   // Closing time (e.g., "10:00 PM")

  DayTiming({required this.day});
}
