import 'package:SastaKhana/controller/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../globalwidgets/base_scaffold_body.dart';
import '../utils/color.dart';
import '../utils/colornotifire.dart';
import '../utils/validators.dart';
import 'SignupWelcome.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final controller = Get.put(LoginController());
  late ColorNotifire notifire;
  bool status = false;
  final number = TextEditingController();
  String? dropdownValue = "";
  final Validators _validators = Validators();
  bool _isObscure = true;

  String? fcmToken;
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: buttonColor,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                     SizedBox(height: 40.sp),
                    // Container(
                    //   margin: EdgeInsets.only(
                    //     top: 30.sp,
                    //     bottom: 0,
                    //     left: 0.sp,
                    //     right: 0.sp,
                    //   ),
                    //   alignment: Alignment.topLeft,
                    //   child: IconButton(
                    //     onPressed: () {
                    //       finish(context);
                    //     },
                    //     icon: Icon(
                    //       Icons.arrow_back_ios_new_outlined,
                    //       color: white,
                    //       size: 4.h,
                    //     ),
                    //   ),
                    // ),
                    Center(child: Image.asset("images/logo.png", height: 30.h)),

                    SizedBox(height: 0.sp),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 5.sp),
                      padding: EdgeInsets.all(20.sp),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.sp),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'GeneralSans-Semibold',
                              color: notifire.gettextcolor,
                            ),
                          ),
                          SizedBox(height: 15.sp),
                          TextField(
                            controller: controller.emailController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: 'Enter your mail id',
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
                              contentPadding: EdgeInsets.fromLTRB(
                                10,
                                15,
                                10,
                                15,
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

                          SizedBox(height: 17.sp),
                          Text(
                            'Password',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'GeneralSans-Semibold',
                              color: notifire.gettextcolor,
                            ),
                          ),
                          SizedBox(height: 15.sp),
                          TextField(
                            controller: controller.passwordController,
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
                              contentPadding: EdgeInsets.fromLTRB(
                                10,
                                15,
                                10,
                                15,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  size: 22,
                                  color: textColor,
                                  _isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
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
                                controller.signIn();
                              },
                              child: Text(
                                'Log In',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: 'GeneralSans-Semibold',
                                  color: white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 18.sp),

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
                                SignupWelcome().launch(
                                  context,
                                  isNewTask: false,
                                  pageRouteAnimation: PageRouteAnimation.Fade,
                                );
                              },
                              child: Text(
                                'Sign Up',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: 'GeneralSans-Semibold',
                                  color: white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.sp),
                        ],
                      ),
                    ),

                    SizedBox(height: 20.sp),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
