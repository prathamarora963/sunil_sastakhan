
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../globalwidgets/base_scaffold_body.dart';
import '../utils/botton.dart';
import '../utils/color.dart';
import '../utils/colornotifire.dart';

class Verification extends StatefulWidget {
  final String? number;
  const Verification({Key? key,this.number})
      : super(key: key);

  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final auth = '';//FirebaseAuth.instance;
  final otpController = TextEditingController();


  bool resendotp = false;
  String otpPin = " ";

  late ColorNotifire notifire;
  Timer? _timer;
  int _start = 40;

  @override
  void dispose() {
    super.dispose();
    _timer!.cancel();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            resendotp = true;
            timer.cancel();
          });
        } else {
          setState(() {});
          _start--;
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  String durationToString(int minutes) {
    var d = Duration(minutes: minutes);
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.backgrounde,
      body:Body(child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child:  SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height  / 15.sp),
              Container(margin: EdgeInsets.only(
                  bottom: 0, top: 0, left: 10.sp, right: 0.sp),
                child:  Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width  / 25.sp),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back, color: notifire.getwhitecolor,size: 23.sp,),
                    ),
                  ],
                ),),
              SizedBox(height: 30.sp),
              Center(
                  child:
                  Image.asset("images/enterprise.png", height: MediaQuery.of(context).size.height  / 5)),
              SizedBox(height: 20.sp),
              Text(
                "OTP Verification",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'GeneralSans-Bold',
                    color: notifire.gettextcolor),
              ),
              SizedBox(height: 10.sp),
              Text(
                textAlign: TextAlign.center,
                "Enter the OTP sent to "+ widget.number!?? '',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: 'GeneralSans-Medium',
                    color: darlgreyColor),
              ),
              SizedBox(height: 20.sp),
              Container(margin: EdgeInsets.only(
                  bottom: 0, top: 0, left: 25.sp, right: 25.sp),
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
              SizedBox(height: 20.sp),
              GestureDetector(
                onTap: () {

                },
                child: Container(
                  margin: EdgeInsets.only(
                      bottom: 0, top: 0, left: 15.sp, right: 15.sp),
                  height: 25.sp,
                  child: Custombutton.button2(
                    notifire.getbuttonscolor,
                    "Verify",
                    25.sp,
                    double.infinity,
                  ),
                ),
              ),

              SizedBox(height: 30.sp),
              resendotp
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      otpController.clear();
                    },
                    child: Text(
                      textAlign: TextAlign.center,
                      "Re-send OTP",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'GeneralSans-Regular',
                          color: notifire.gettext1color),
                    ),
                  )
                ],
              )
                  : SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        "Re-send code in ",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'GeneralSans-Medium',
                            color: notifire.gettext1color),
                      ),
                      Text(durationToString(_start).toString(),
                        style: TextStyle(fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: notifire.textcolor),),
                    ],
                  )),
            ],
          ),
        ),),)
    );
  }
}




