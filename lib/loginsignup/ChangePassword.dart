
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../globalwidgets/base_scaffold_body.dart';
import '../utils/color.dart';
import '../utils/colornotifire.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  late ColorNotifire notifire;
  bool status = false;
  final number = TextEditingController();

  String? dropdownValue = "";
  int quantity = 2;
  @override
  void initState() {
    super.initState();

  }
  final _formKey = GlobalKey<FormState>();

  bool _oldObscure = true;
  bool _newObscure = true;
  bool _confirmObscure = true;
  String? password;
  String? newPassword;
  String? confirmPassword;
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
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
                          "Change Password",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'GeneralSans-Bold',
                              color: notifire.gettextcolor),
                        ),),
                    ]),
                    const SizedBox(height: 24),
                    Container(margin: EdgeInsets.only(top: 15.sp, bottom: 0, left: 0.sp, right: 0.sp),
                      child: Text(
                        "Old Password",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'GeneralSans-Medium',
                            color: textColorSecond),
                      ),),
                    SizedBox(height:10.sp),
                    TextField(
                      onChanged: (text) {
                        password=text.toString();
                      },
                      obscureText: _oldObscure,

                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Enter your old password',
                        hintStyle: TextStyle(
                            color: PlaceholderColor),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide: BorderSide(color: greenColorPrimery, width: 4.sp),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide:  BorderSide(color: PlaceholderColor, width: 4.sp),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide:  BorderSide(color: redColorvalue, width: 4.sp),
                        ),
                        disabledBorder: InputBorder.none,
                        isDense: false,
                        // Added this
                        contentPadding: EdgeInsets.fromLTRB(
                            10, 15, 10, 15),
                        // this button is used to toggle the password visibility
                        suffixIcon: IconButton(
                            icon: Icon(
                                size: 22,
                                color: textColor,
                                _oldObscure ? Icons.visibility : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _oldObscure = !_oldObscure;
                              });
                            }),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                        ),

                      ),
                      cursorColor: notifire.gettextcolor,
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: notifire.gettextcolor),
                    ),

                    Container(margin: EdgeInsets.only(top: 15.sp, bottom: 0, left: 0.sp, right: 0.sp),
                      child: Text(
                        "New Password",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'GeneralSans-Medium',
                            color: textColorSecond),
                      ),),
                    SizedBox(height:10.sp),
                    TextField(
                      onChanged: (text) {
                        password=text.toString();
                      },
                      obscureText: _newObscure,

                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Enter your new password',
                        hintStyle: TextStyle(
                            color: PlaceholderColor),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide: BorderSide(color: greenColorPrimery, width: 4.sp),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide:  BorderSide(color: PlaceholderColor, width: 4.sp),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide:  BorderSide(color: redColorvalue, width: 4.sp),
                        ),
                        disabledBorder: InputBorder.none,
                        isDense: false,
                        // Added this
                        contentPadding: EdgeInsets.fromLTRB(
                            10, 15, 10, 15),
                        // this button is used to toggle the password visibility
                        suffixIcon: IconButton(
                            icon: Icon(
                                size: 22,
                                color: textColor,
                                _newObscure ? Icons.visibility : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _newObscure = !_newObscure;
                              });
                            }),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                        ),

                      ),
                      cursorColor: notifire.gettextcolor,
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: notifire.gettextcolor),
                    ),

                    Container(margin: EdgeInsets.only(top: 15.sp, bottom: 0, left: 0.sp, right: 0.sp),
                      child: Text(
                        "Confirm Password",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'GeneralSans-Medium',
                            color: textColorSecond),
                      ),),
                    SizedBox(height:10.sp),
                    TextField(
                      onChanged: (text) {
                        confirmPassword=text.toString();
                      },
                      obscureText: _confirmObscure,

                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Enter confirm password',
                        hintStyle: TextStyle(
                            color: PlaceholderColor),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide: BorderSide(color: greenColorPrimery, width: 4.sp),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide:  BorderSide(color: PlaceholderColor, width: 4.sp),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide:  BorderSide(color: redColorvalue, width: 4.sp),
                        ),
                        disabledBorder: InputBorder.none,
                        isDense: false,
                        // Added this
                        contentPadding: EdgeInsets.fromLTRB(
                            10, 15, 10, 15),
                        // this button is used to toggle the password visibility
                        suffixIcon: IconButton(
                            icon: Icon(
                                size: 22,
                                color: textColor,
                                _confirmObscure ? Icons.visibility : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _confirmObscure = !_confirmObscure;
                              });
                            }),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                        ),

                      ),
                      cursorColor: notifire.gettextcolor,
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: notifire.gettextcolor),
                    ),

                    SizedBox(height: 25.sp),

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
                          // AdminBottombar().launch(context, isNewTask: true, pageRouteAnimation: PageRouteAnimation.Fade);
                        },
                        child:  Text(
                          'Submit',
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
            ),
          ),),)

    );

  }
}

