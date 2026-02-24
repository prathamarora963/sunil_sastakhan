import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart' hide whiteColor;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../AdminBottombar.dart';
import '../globalwidgets/base_scaffold_body.dart';
import '../utils/color.dart';
import '../utils/colornotifire.dart';
import 'Category.dart';

class PhoneVerification extends StatefulWidget {
  const PhoneVerification({Key? key}) : super(key: key);

  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  late ColorNotifire notifire;
  bool status = false;
  final number = TextEditingController();
  String? dropdownValue = "";
  int quantity = 2;
  final otpController = TextEditingController();
  @override
  void initState() {
    super.initState();

  }
  String? password;
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
        backgroundColor: notifire.backgrounde,
        body: Body(child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.sp),
              child:  Column(crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height:28.sp),
                  Row(children: [
                    Container( margin: EdgeInsets.only(top: 0.sp, bottom: 0, left: 0.sp, right: 0.sp),
                      alignment: Alignment.topLeft,
                      child:  IconButton(onPressed: (){
                        finish(context);
                      }, icon:  Icon(Icons.arrow_back_ios_new_outlined,color: textColor,size: 3.h,)),
                    ),
                    Container(alignment: Alignment.centerLeft,
                      child: Text(
                        "Verification",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'GeneralSans-Bold',
                            color: notifire.gettextcolor),
                      ),),
                  ]),
                  SizedBox(height:15.sp),
                  Text(
                    "Verify Phone Number",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: 'GeneralSans-Semibold',
                        color: textColor),
                  ),
                   SizedBox(height: 15.sp),
                  /// Description
                   Text(
                    "We have sent you a 6 digit code. Please enter here to Verify you Phone Number.",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'GeneralSans-Medium',
                      color: textColorSecond),
                  ),

                   SizedBox(height: 20.sp),

                  /// Phone Number with Edit Icon
                  Row(
                    children: [
                      Container(
                        padding:  EdgeInsets.symmetric(
                          horizontal: 16.sp,
                          vertical: 15.sp,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(30.sp),
                        ),
                        child:  Text(
                          "+91  |  9000099999",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'GeneralSans-Medium',
                              color: textColor),
                        ),
                      ),
                      SizedBox(width: 12.sp),
                      InkWell(onTap: () {

                      },child: CircleAvatar(
                        radius: 17.sp,
                        backgroundColor: Colors.orange.shade100,
                        child:  Icon(
                          Icons.edit,
                          size: 18.sp,
                          color: Colors.orange,
                        ),
                      ),)
                    ],
                  ),
                  SizedBox(height: 20.sp),

                  /// OTP Fields
                  Container(margin: EdgeInsets.only(
                      bottom: 0, top: 0, left: 15.sp, right: 15.sp),
                    child: PinCodeTextField(
                      appContext: context,
                      length: 6,
                      controller: otpController,
                      keyboardType: TextInputType.number,
                      animationType: AnimationType.fade,
                      animationDuration: Duration(milliseconds: 300),
                      backgroundColor: notifire.backgrounde,
                      // enableActiveFill: true,
                      mainAxisAlignment : MainAxisAlignment.spaceBetween,

                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 27.sp,
                          fieldWidth: 27.sp,
                          activeFillColor: Colors.white,
                          selectedColor:darktextColor,
                          inactiveColor:iconColor
                      ),
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          // currentText = value;
                        });
                      },
                      onCompleted: (v) {
                        print("Completed");
                      },
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    ),),
                  const SizedBox(height: 20),

                  /// Resend Code
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Didn’t Receive Code? ",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'GeneralSans-Medium',
                            color: textColorSecond),
                        children: [
                          TextSpan(
                            text: " Get a New Code",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.orange.shade700,
                              fontFamily: 'GeneralSans-Medium',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(margin: EdgeInsets.only(top: 0.sp, bottom: 0, left: 15.sp, right: 15.sp),
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
                        Category().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Scale);
                      },
                      child:  Text(
                        'Verify and Continue',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'GeneralSans-Semibold',
                            color: white),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.sp),
                ],
              ),
            ),
          ),),)

    );

  }
}


