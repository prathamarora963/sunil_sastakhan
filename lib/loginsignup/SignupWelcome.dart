
import 'package:SastaKhana/controller/signup_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../modules/admin/AdminSignUp.dart';
import '../modules/merchent/MerchentSignup.dart';
import '../modules/user/UserSignUp.dart';
import '../utils/color.dart';
import '../utils/colornotifire.dart';

class SignupWelcome extends StatefulWidget {
  const SignupWelcome({Key? key}) : super(key: key);

  @override
  _SignupWelcomeState createState() => _SignupWelcomeState();
}

class _SignupWelcomeState extends State<SignupWelcome> {
  late ColorNotifire notifire;
  bool status = false;
  final number = TextEditingController();
  final password = TextEditingController();
  List<String> _countryCodes = [];
  String? dropdownValue = "";

  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    super.initState();
    dropdownValue = '91';//login.countryCode.first;
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return ResponsiveSizer(builder: (BuildContext , Orientation , ScreenType ) {
      return Scaffold(
        backgroundColor: buttonColor,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.sp),
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // SizedBox(height: MediaQuery.of(context).size.height / 11),
                    Container( margin: EdgeInsets.only(top: 30.sp, bottom: 0, left: 0.sp, right: 0.sp),
                      alignment: Alignment.topLeft,
                      child:  IconButton(onPressed: (){
                        finish(context);
                      }, icon:  Icon(Icons.arrow_back_ios_new_outlined,color: white,size: 4.h,)),

                    ),
                    Center(
                        child:
                        Image.asset("images/logo.png", height: MediaQuery.of(context).size.height / 3.5)),

                    SizedBox(height: 0.sp),
                    Container(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome !",
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontFamily: 'GeneralSans-Semibold',
                                color: Colors.white),
                          ),
                          SizedBox(height: 5.sp),
                          Text(
                            "Sign Up to your account.",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: 'GeneralSans-Medium',
                                color: Colors.white),
                          ),
                          SizedBox(height: 20.sp),

                           Center(
                            child: Text(
                              "Signup",
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontFamily: 'GeneralSans-Semibold',
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(height: 20.sp),
                          /// BUTTONS
                          _buildButton("CUSTOMER", () {
                            Get.to(() => UserSignUp(), binding: SignupBinding());
                            // UserSignUp().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Scale);
                          }),
                           SizedBox(height: 18.sp),
                          _buildButton("MERCHANT", () {
                            Get.to(() => MerchentSignup(), binding: SignupBinding());
                            // MerchentSignup().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Scale);
                          }),
                           SizedBox(height: 18.sp),
                          _buildButton("ADMIN", () {
                            Get.to(() => AdminSignUp(), binding: SignupBinding());
                            // AdminSignUp().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Scale);
                          }),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),)
      );
    },);

  }
  // Custom Button Widget
  Widget _buildButton(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: Colors.white.withOpacity(0.6), width: 1.5),
        ),
        child: Center(
          child: Text(
              text,
            style: TextStyle(
                fontSize: 18.sp,
                fontFamily: 'GeneralSans-Semibold',
                color: buttonsColororange),
          ),
        ),
      ),
    );
  }

}

