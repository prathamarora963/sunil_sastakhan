import 'dart:io';
import 'package:SastaKhana/controller/merchant/merchant_auth_controller.dart';
import 'package:SastaKhana/utils/color.dart' as AppColor;
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../MerchentBottombar.dart';
import '../globalwidgets/base_scaffold_body.dart';
import '../main.dart';
import '../utils/botton.dart';
import '../utils/color.dart';
import '../utils/colornotifire.dart';
import '../utils/commonutills.dart';
import '../utils/ctextfield.dart';
import '../utils/globalwidgets.dart';
import '../utils/itextfield.dart';

class MerchentSignup extends StatefulWidget {
  const MerchentSignup({Key? key}) : super(key: key);

  @override
  _MerchentSignupState createState() => _MerchentSignupState();
}

class _MerchentSignupState extends State<MerchentSignup> {
  final controller = Get.put(MerchantAuthController());
  late ColorNotifire notifire;
  bool status = false;
  final number = TextEditingController();
  String? dropdownValue = "";
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
                      onChanged: (text) {
                        // password=text.toString();
                      },
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
                      onChanged: (text) {
                        // password=text.toString();
                      },
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
                        controller.uploadStoreLogo.value = true;
                        controller.cameraHelper.openImagePicker();
                      },
                      child: Obx(
                        () => controller.logoPic.value == ""
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
                                      File(controller.logoPic.value),
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
                      height: 70.sp,
                      padding: EdgeInsets.all(15.sp),
                      decoration: BoxDecoration(
                        color: textBoxbgColor,
                        borderRadius: BorderRadius.circular(15.sp),
                      ),
                      child: Obx(
                        () => GridView.builder(
                          shrinkWrap: true,
                          itemCount: controller.shopImageList.length,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 15.sp,
                                mainAxisSpacing: 15.sp,
                              ),
                          itemBuilder: (_, index) {
                            var data = controller.shopImageList[index];
                            return GestureDetector(
                              onTap: () {
                                controller.selectShopImageIndex.value = index;
                                controller.uploadStoreLogo.value = false;
                                controller.cameraHelper.openImagePicker();
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
                      child: Row(
                        children: [
                          Expanded(child: categoryItem("Restaurants")),
                          categoryItem("Bakery"),
                          Expanded(child: categoryItem("Home Chef")),
                        ],
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
                            ...controller.timings.asMap().entries.map((entry) {
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
                      onChanged: (text) {
                        // password=text.toString();
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
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
                      onChanged: (text) {
                        // password=text.toString();
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
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
                      onChanged: (text) {
                        // password=text.toString();
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
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
                    GestureDetector(
                      onTap: () {
                        controller.cameraHelper.openAttachmentDialog();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: 0,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: borderColorvalue),
                          borderRadius: BorderRadius.circular(10.sp),
                          color: textBoxbgColor,
                        ),
                        child: uploadDoc('FSSAI Certificate', onTap: () {}),
                      ),
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
                      child: uploadDoc('Merchant Identity', onTap: () {}),
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
                      child: uploadDoc('PAN Card', onTap: () {}),
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
                      child: uploadDoc('Other Document', onTap: () {}),
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
                          MerchentBottombar().launch(
                            context,
                            isNewTask: true,
                            pageRouteAnimation: PageRouteAnimation.Fade,
                          );
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
    return Row(
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
    );
  }

  // CATEGORY CHECKBOX ITEM
  Widget categoryItem(String title) {
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
            value: false,
            onChanged: (v) {},
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
                onChanged: (v) => controller.toggleDay(index, v!),
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
                    () => controller.setTime(index, true),
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
                    () => controller.setTime(index, false),
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
