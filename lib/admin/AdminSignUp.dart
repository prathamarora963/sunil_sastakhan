import 'dart:io';

import 'package:SastaKhana/controller/admin/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:nb_utils/nb_utils.dart' hide whiteColor;
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../AdminBottombar.dart';
import '../globalwidgets/base_scaffold_body.dart';
import '../utils/color.dart';
import '../utils/colornotifire.dart';
import '../utils/image_view.dart';

class AdminSignUp extends StatefulWidget {
  const AdminSignUp({Key? key}) : super(key: key);

  @override
  _AdminSignUpState createState() => _AdminSignUpState();
}

class _AdminSignUpState extends State<AdminSignUp> {
  final controller = Get.put(AdminAuthController());
  late ColorNotifire notifire;
  bool _isObscure = true;
  String? password;
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.backgrounde,
      body: Body(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 28.sp),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 0.sp,
                          bottom: 0,
                          left: 0.sp,
                          right: 0.sp,
                        ),
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          onPressed: () {
                            finish(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: textColor,
                            size: 3.h,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Register Profile",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'GeneralSans-Bold',
                            color: notifire.gettextcolor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.sp),
                  Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // Profile Image
                        Obx(
                          () => controller.imagePath.value != ""
                              ? Container(
                                  height: 180,
                                  width: 180,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: FileImage(
                                        File(controller.imagePath.value),
                                      ),
                                    ),
                                  ),
                                )
                              : ImageView.circle(
                                  image: "https://picsum.photos/200",
                                  height: 180,
                                  width: 180,
                                  fit: BoxFit
                                      .cover, // ✔ better for profile image
                                ),
                        ),

                        // Edit Icon
                        Positioned(
                          bottom: 10.sp,
                          right: 10.sp,
                          child: GestureDetector(
                            onTap: () {
                              controller.cameraHelper.openImagePicker();
                            },
                            child: Container(
                              width: 25.sp,
                              height: 25.sp,
                              decoration: BoxDecoration(
                                color: skyBlueColorPrimery,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.edit,
                                size: 18.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.sp),
                  Container(
                    margin: EdgeInsets.only(
                      top: 0.sp,
                      bottom: 0,
                      left: 0.sp,
                      right: 0.sp,
                    ),
                    child: Text(
                      "Full Name",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'GeneralSans-Medium',
                        color: textColorSecond,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  TextField(
                    onChanged: (text) {
                      // password=text.toString();
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: textBoxbgColor,
                      hintText: "Enter Your Full Name",
                      hintStyle: TextStyle(color: PlaceholderColor),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: greenColorPrimery,
                          width: 4.sp,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: borderColorvalue,
                          width: 4.sp,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: redColorvalue,
                          width: 4.sp,
                        ),
                      ),
                      disabledBorder: InputBorder.none,
                      isDense: false,
                      // Added this
                      contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                    ),
                    cursorColor: notifire.gettextcolor,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: notifire.gettextcolor,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 15.sp,
                      bottom: 0,
                      left: 0.sp,
                      right: 0.sp,
                    ),
                    child: Text(
                      "Email Id",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'GeneralSans-Medium',
                        color: textColorSecond,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  TextField(
                    onChanged: (text) {
                      // password=text.toString();
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: textBoxbgColor,
                      hintText: "Enter Your Mail Id",
                      hintStyle: TextStyle(color: PlaceholderColor),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: greenColorPrimery,
                          width: 4.sp,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: borderColorvalue,
                          width: 4.sp,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: redColorvalue,
                          width: 4.sp,
                        ),
                      ),
                      disabledBorder: InputBorder.none,
                      isDense: false,
                      // Added this
                      contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                    ),
                    cursorColor: notifire.gettextcolor,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: notifire.gettextcolor,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 15.sp,
                      bottom: 0,
                      left: 0.sp,
                      right: 0.sp,
                    ),
                    child: Text(
                      "Phone Number",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'GeneralSans-Medium',
                        color: textColorSecond,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  TextField(
                    onChanged: (text) {
                      // password=text.toString();
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: textBoxbgColor,
                      hintText: "Enter Your Phone Number",
                      hintStyle: TextStyle(color: PlaceholderColor),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: greenColorPrimery,
                          width: 4.sp,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: borderColorvalue,
                          width: 4.sp,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: redColorvalue,
                          width: 4.sp,
                        ),
                      ),
                      disabledBorder: InputBorder.none,
                      isDense: false,
                      // Added this
                      contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                    ),
                    cursorColor: notifire.gettextcolor,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: notifire.gettextcolor,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                      top: 15.sp,
                      bottom: 0,
                      left: 0.sp,
                      right: 0.sp,
                    ),
                    child: Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'GeneralSans-Medium',
                        color: textColorSecond,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  TextField(
                    onChanged: (text) {
                      password = text.toString();
                    },
                    obscureText: _isObscure,

                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(color: PlaceholderColor),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: greenColorPrimery,
                          width: 4.sp,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: PlaceholderColor,
                          width: 4.sp,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: redColorvalue,
                          width: 4.sp,
                        ),
                      ),
                      disabledBorder: InputBorder.none,
                      isDense: false,
                      // Added this
                      contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                      // this button is used to toggle the password visibility
                      suffixIcon: IconButton(
                        icon: Icon(
                          size: 22,
                          color: textColor,
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                    ),
                    cursorColor: notifire.gettextcolor,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: notifire.gettextcolor,
                    ),
                  ),

                  SizedBox(height: 25.sp),

                  Container(
                    margin: EdgeInsets.only(
                      top: 0.sp,
                      bottom: 0,
                      left: 15.sp,
                      right: 15.sp,
                    ),
                    width: double.infinity,
                    height: 28.sp,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                      ),
                      onPressed: () {
                        AdminBottombar().launch(
                          context,
                          isNewTask: true,
                          pageRouteAnimation: PageRouteAnimation.Fade,
                        );
                      },
                      child: Text(
                        'Submit',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'GeneralSans-Semibold',
                          color: white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.sp),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // IMAGE UPLOAD BOX
  Widget uploadBox({double size = 100, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: textBoxbgColor,
          borderRadius: BorderRadius.circular(15.sp),
          border: Border.all(color: borderColorvalue),
        ),
        child: Center(
          child: Icon(
            Icons.add_photo_alternate_outlined,
            size: 25.sp,
            color: Color(0xFF4C566A),
          ),
        ),
      ),
    );
  }
}
