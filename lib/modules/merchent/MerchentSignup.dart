import 'dart:io';
import 'package:SastaKhana/controller/signup_controller.dart';
import 'package:SastaKhana/utils/color.dart' as AppColor;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'MerchentBottombar.dart';
import '../../globalwidgets/base_scaffold_body.dart';
import '../../utils/color.dart';
import '../../utils/colornotifire.dart';

class MerchentSignup extends StatefulWidget {
  const MerchentSignup({Key? key}) : super(key: key);

  @override
  _MerchentSignupState createState() => _MerchentSignupState();
}

class _MerchentSignupState extends State<MerchentSignup> {
  // final signupController = Get.put(SignupController());
    final signupController = Get.find<SignupController>();
  late ColorNotifire notifire;
  bool status = false;
  final number = TextEditingController();
  String? dropdownValue = "";
  bool _isObscure = true;
  String? password;


  @override
  void dispose() {
    super.dispose();
  }

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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
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
                            "Store Details",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontFamily: 'GeneralSans-Bold',
                              color: notifire.gettextcolor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 10.sp,
                        bottom: 0,
                        left: 0.sp,
                        right: 0.sp,
                      ),
                      child: Text(
                        "Tell us about your business to get started. All fields are mandatory unless specified.",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'GeneralSans-Regular',
                          color: textColorSecond,
                        ),
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
                        "Store Name",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'GeneralSans-Medium',
                          color: textColorSecond,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    TextField(
                      controller: signupController.storeNameController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: textBoxbgColor,
                        hintText: "Type your Store Name",
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
                      controller: signupController.merchantPasswordController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: textBoxbgColor,
                        hintText: "Type your Store Password",
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
                        "Store Description",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'GeneralSans-Medium',
                          color: textColorSecond,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    TextField(
                      controller: signupController.descriptionController,
                      maxLines: 4,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: textBoxbgColor,
                        hintText:
                            "Type your Store Description here Your Journey to less food waste begins.",
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
                        "Upload Store Logo",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'GeneralSans-Medium',
                          color: textColorSecond,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    GestureDetector(
                      onTap: () {
                      
                        signupController.cameraHelper.openImagePicker(imageType: .logo);
                      },
                      child: Obx(
                        () => signupController.logoPic.value == ""
                            ? Container(
                                height: 45.sp,
                                width: 45.sp,
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
                              )
                            : Container(
                                height: 45.sp,
                                width: 45.sp,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: FileImage(
                                      File(signupController.logoPic.value),
                                    ),
                                  ),
                                  color: textBoxbgColor,
                                  borderRadius: BorderRadius.circular(15.sp),
                                  border: Border.all(color: borderColorvalue),
                                ),
                              ),
                      ),
                    ),

                    // ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 15.sp,
                        bottom: 0,
                        left: 0.sp,
                        right: 0.sp,
                      ),
                      child: Text(
                        "Merchant Shop Photo",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'GeneralSans-Medium',
                          color: textColorSecond,
                        ),
                      ),
                    ),
                    // SizedBox(height:10.sp),
                    Container(
                      // height: 70.sp,
                      padding: EdgeInsets.all(15.sp),
                      decoration: BoxDecoration(
                        color: textBoxbgColor,
                        borderRadius: BorderRadius.circular(15.sp),
                      ),
                      child: Obx(
                        () => GridView.builder(
                          padding: EdgeInsets.zero,
                           shrinkWrap: true,
                          itemCount: signupController.shopImageList.length,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 15.sp,
                                mainAxisSpacing: 15.sp,
                              ),
                          itemBuilder: (_, index) {
                            var data = signupController.shopImageList[index];
                            return GestureDetector(
                              onTap: () {
                            
                                signupController.cameraHelper.openImagePicker(imageType: .shopImages);
                              },
                              child: data == ""
                                  ? Container(
                                      height: 45.sp,
                                      width: 45.sp,
                                      decoration: BoxDecoration(
                                        color: textBoxbgColor,
                                        borderRadius: BorderRadius.circular(
                                          15.sp,
                                        ),
                                        border: Border.all(
                                          color: borderColorvalue,
                                        ),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.add_photo_alternate_outlined,
                                          size: 25.sp,
                                          color: Color(0xFF4C566A),
                                        ),
                                      ),
                                    )
                                  : Container(
                                      height: 45.sp,
                                      width: 45.sp,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: FileImage(File(data)),
                                        ),
                                        color: textBoxbgColor,
                                        borderRadius: BorderRadius.circular(
                                          15.sp,
                                        ),
                                        border: Border.all(
                                          color: borderColorvalue,
                                        ),
                                      ),
                                    ),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 10.sp,
                        bottom: 0,
                        left: 0.sp,
                        right: 0.sp,
                      ),
                      child: Text(
                        "Upload a clear photo of your shop and max file size 5MB.",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'GeneralSans-Regular',
                          color: textColorSecond,
                        ),
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
                        "Business Category",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'GeneralSans-Medium',
                          color: textColorSecond,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    Obx(
                     (){
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: 0,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: borderColorvalue),
                          borderRadius: BorderRadius.circular(15.sp),
                          color: textBoxbgColor,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: categoryItem(
                                "Restaurants",
                                isActive: signupController.categoryController.value == 1,
                                onChanged: (value) {
                                  if (value == true) {
                                    signupController.categoryController.value = 1;
                                  } 
                                },
                              ),
                            ),
                            categoryItem(
                              "Bakery",
                              isActive: signupController.categoryController.value == 2,
                              onChanged: (value) {
                                if (value == true) {
                                  signupController.categoryController.value = 2;
                                } 
                              },
                            ),
                            Expanded(
                              child: categoryItem(
                                "Home Chef",
                                isActive: signupController.categoryController.value == 3,
                                onChanged: (value) {
                                  if (value == true) {
                                    signupController.categoryController.value = 3;
                                  } 
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    
                     } 
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 15.sp,
                        bottom: 0,
                        left: 0.sp,
                        right: 0.sp,
                      ),
                      child: Text(
                        "Business Timing",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'GeneralSans-Medium',
                          color: textColorSecond,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: borderColorvalue),
                        borderRadius: BorderRadius.circular(15.sp),
                        color: textBoxbgColor,
                      ),
                      child: Obx(
                        () => Column(
                          children: [
                            ...signupController.timings.asMap().entries.map((entry) {
                              int idx = entry.key;
                              DayTiming data = entry.value;
                              return timingRow(data, idx);
                            }).toList(),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    Container(
                      margin: EdgeInsets.only(
                        top: 15.sp,
                        bottom: 0,
                        left: 0.sp,
                        right: 0.sp,
                      ),
                      child: Text(
                        "Address Line 1",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'GeneralSans-Medium',
                          color: textColorSecond,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    TextField(
                      controller: signupController.addressController,
                      onChanged: (text) {
                        // password=text.toString();
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: textBoxbgColor,
                        hintText: "Type your Store Address Line 1",
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
                        "Address Line 2 (Optional)",
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
                        hintText: "Type your Store Address Line 2",
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
                        "Pin code",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'GeneralSans-Medium',
                          color: textColorSecond,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    TextField(
                        controller: signupController.pincodeController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: textBoxbgColor,
                        hintText: "Type your area pin code",
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
                        "Contact Person",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'GeneralSans-Medium',
                          color: textColorSecond,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    TextField(
                      controller: signupController.contactPersonController,
                      onChanged: (text) {
                        // password=text.toString();
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: textBoxbgColor,
                        hintText: "Type your Contact Person",
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
                        "Contact Number",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'GeneralSans-Medium',
                          color: textColorSecond,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    TextField(
                      controller: signupController.merchantPhoneController,
                       keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: textBoxbgColor,
                        hintText: "Type your Contact Number",
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
                       controller: signupController.merchantEmailController,
                       keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: textBoxbgColor,
                        hintText: "Type your Email Id",
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
                        "GST Number",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'GeneralSans-Medium',
                          color: textColorSecond,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    TextField(
                        controller: signupController.gstNumberController,
                      onChanged: (text) {
                        // password=text.toString();
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: textBoxbgColor,
                        hintText: "Type GST Number",
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
                        "PAN Number",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'GeneralSans-Medium',
                          color: textColorSecond,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    TextField(
                        controller: signupController.panNumberController,
                      onChanged: (text) {
                        // password=text.toString();
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: textBoxbgColor,
                        hintText: "Type PAN Number",
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
                        "Upload Verification Document",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'GeneralSans-Medium',
                          color: textColorSecond,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 5.sp,
                        bottom: 0,
                        left: 0.sp,
                        right: 0.sp,
                      ),
                      child: Text(
                        "Please upload a copy of your business license or FSSAI certificate.",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: 'GeneralSans-Regular',
                          color: textColorSecond,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: borderColorvalue),
                        borderRadius: BorderRadius.circular(10.sp),
                        color: textBoxbgColor,
                      ),
                      child: uploadDoc('FSSAI Certificate', onTap: () {
                        signupController.cameraHelper.openAttachmentDialog(imageType: .fssaiDoc);
                      }),
                    ),
                    SizedBox(height: 15.sp),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: borderColorvalue),
                        borderRadius: BorderRadius.circular(10.sp),
                        color: textBoxbgColor,
                      ),
                      child: uploadDoc('Merchant Identity', onTap: () {
                         signupController.cameraHelper.openAttachmentDialog(imageType: .merchantDoc);
                      }),
                    ),
                    SizedBox(height: 15.sp),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: borderColorvalue),
                        borderRadius: BorderRadius.circular(10.sp),
                        color: textBoxbgColor,
                      ),
                      child: uploadDoc('PAN Card', onTap: () {
                         signupController.cameraHelper.openAttachmentDialog(imageType: .panCardDoc);
                      }),
                    ),
                    SizedBox(height: 15.sp),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: borderColorvalue),
                        borderRadius: BorderRadius.circular(10.sp),
                        color: textBoxbgColor,
                      ),
                      child: uploadDoc('Other Document', onTap: () {
                         signupController.cameraHelper.openAttachmentDialog(imageType: .otherDoc);
                      }),
                    ),
                    SizedBox(height: 20.sp),
                    SizedBox(
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
                          // Handle review and submit action
                          signupController.performMerchantSignup();
                        },
                        child: Text(
                          'Review & Submit',
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
      ),
    );
  }

  //upload doc
  Widget uploadDoc(String title, {required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.sp),
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: Icon(
              Icons.cloud_upload_outlined,
              size: 24.sp,
              color: textColor,
            ),
          ),
          SizedBox(width: 16.sp),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'GeneralSans-Medium',
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // CATEGORY CHECKBOX ITEM
  Widget categoryItem(
    String title, {
    bool isActive = false,
    required void Function(bool?)? onChanged,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.sp, vertical: 10.sp),
      /* decoration: BoxDecoration(
        border: Border.all(color: borderColorvalue),
        borderRadius: BorderRadius.circular(12),
        color: textBoxbgColor,
      ),*/
      child: Row(
        children: [
          Checkbox(
            value: isActive,
            onChanged: onChanged,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'GeneralSans-Regular',
              color: textColorSecond,
            ),
          ),
        ],
      ),
    );
  }

  // IMAGE UPLOAD BOX

  // REUSABLE TIMING ROW
  Widget timingRow(DayTiming data, int index) {
    return Obx(
      () => Column(
        children: [
          Row(
            children: [
              Checkbox(
                value: data.isOpen.value,
                onChanged: (v) => signupController.toggleDay(index, v!),
                activeColor: AppColor.greenColorPrimery,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              Text(
                "${data.day}:  Timing :",
                style: TextStyle(fontSize: 15.sp, color: textColorSecond),
              ),
            ],
          ),
          if (data.isOpen.value)
            Row(
              children: [
                Expanded(
                  child: timeBox(
                    data.startTime,
                    () => signupController.setTime(index, true),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.sp),
                  child: Text(
                    "to",
                    style: TextStyle(fontSize: 13.sp, color: textColor),
                  ),
                ),
                Expanded(
                  child: timeBox(
                    data.endTime,
                    () => signupController.setTime(index, false),
                  ),
                ),
                SizedBox(width: 8.sp),
              ],
            ).paddingSymmetric(horizontal: 20),
        ],
      ),
    );
  }

  Widget timeBox(RxString timeValue, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Obx(
        () => Container(
          width: 60.sp,
          height: 25.sp,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFFF5F6FA),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFE1E1E1)),
          ),
          child: Text(
            timeValue.value.isEmpty ? "-- : --" : timeValue.value,
            style: TextStyle(
              fontSize: 14.sp, // Small text size
              fontFamily: 'GeneralSans-Medium',
              color: AppColor.blackColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
