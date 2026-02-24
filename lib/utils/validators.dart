import 'package:get/get.dart';

class Validators {
  String? validateEmail({String? value}) {
    // A common regex for email validation (can be more complex for stricter validation)
    final emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value!.length == 0)
      return "Please enter your email";
    else if (!emailRegex.hasMatch(value))
      return "Please enter valid email";
    else
      return null;
  }

  String? validateMobile({String? value}) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (value!.length != 10) {
      return 'Please enter mobile number';
    }
    else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  String? validatePassword({String? value}) {
    if (value!.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
  String? validateOTP({String? value}) {
    if (value!.isEmpty) {
      return 'OTP is required';
    } else if (value.length < 6) {
      return 'Please enter complete OTP';
    }
    return null;
  }
  String? validateName({String? value}) {
    final specialCharRegExp = RegExp(r'[^\w\s]');
    if (value!.isEmpty) {
      return 'Please enter your full name';
    }else if(specialCharRegExp.hasMatch(value)){
      return 'Please enter only alphabet in the name';
    }
    return null;
  }

  String? validateDOB({DateTime? value}) {
    if (value == null)
      return "Please select your date of birth.";
    else if (!is18OrOlder(value))
      return "You must be at least 18 years old to Sign Up the application!.";
    else
      return null;
  }
  // Function to check if user is 18+
  bool is18OrOlder(DateTime dob) {
    final DateTime today = DateTime.now();
    final eighteenYearsAgo = DateTime(today.year - 18, today.month, today.day);
    return dob.isBefore(eighteenYearsAgo) || dob.isAtSameMomentAs(eighteenYearsAgo);
  }

  String? validateUsername({String? value}) {
    if (value!.isEmpty) {
      return 'please_write_your_username'.tr;
    }
    return null;
  }

  String? validateCheckedValue({bool? value}) {
    if (value == false) {
      return 'Please click checkbox to read terms of use and privacy policy';
    }
    return null;
  }
  String? phoneVehicleID({String? value}) {
    if (value!.isEmpty) {
      return 'please_write_your_phone'.tr;
    }
    return null;
  }

  String? validateAccidentName({String? value}) {
    if (value!.isEmpty) {
      return 'please_write_accident_name'.tr;
    }
    return null;
  }

  String? validateAccidentDescription({String? value}) {
    if (value!.isEmpty) {
      return 'please_write_some_notes'.tr;
    }
    return null;
  }
}
