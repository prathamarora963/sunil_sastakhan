
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../globalwidgets/base_scaffold_body.dart';
import '../utils/botton.dart';
import '../utils/colornotifire.dart';
import '../utils/ctextfield.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool termStatus = false;
  final auth = '';//FirebaseAuth.instance;
  late ColorNotifire notifire;
  final name = TextEditingController();
  final number = TextEditingController();
  final email = TextEditingController();
  String? agentvalue = '1';

  bool _obscureText = true;
  bool obscureText_ = true;

  void toggle() {
    setState(() {
      obscureText_ = !obscureText_;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
        backgroundColor: notifire.backgrounde,
        body:Body(child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height / 15),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                                color: notifire.getprimerycolor,
                                child: Icon(Icons.arrow_back,
                                    color: notifire.getwhitecolor)),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.sp),
                      Text(
                        textAlign: TextAlign.center,
                        "CREATE ACCOUNT",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'GeneralSans-Bold',
                            color: notifire.getprimetextcolor),
                      ),
                      SizedBox(height: 10.sp),
                      Text(
                        "Please fill in your details",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'GeneralSans-Bold',
                            color: notifire.gettextcolor),
                      ),
                      SizedBox(height: 30.sp),
                      Customtextfild.textField1(
                        controller: name,
                        name1: "Full Name",
                        labelclr: Colors.grey,
                        textcolor: notifire.getwhitecolor,
                        keyboardType: TextInputType.text, context: context,
                        fieldBg: notifire.getfieldbg,
                      ),
                      SizedBox(height: 15.sp),
                      Customtextfild.textField1(
                        controller: email,
                        name1: "Email",
                        labelclr: Colors.grey,
                        textcolor: notifire.getwhitecolor,
                        keyboardType: TextInputType.emailAddress, context: context,
                        fieldBg: notifire.getfieldbg,
                      ),
                      SizedBox(height: 15.sp),
                      Customtextfild.textField1(
                        controller: number,
                        name1: "Phone Number",
                        labelclr: Colors.grey,
                        textcolor: notifire.getwhitecolor,
                        keyboardType: TextInputType.number, context: context,
                        fieldBg: notifire.getfieldbg,
                      ),
                      SizedBox(height: 20.sp),
                      Row(
                        children: [
                          Text(
                            "Are you a Real Estate Agent?",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: 'GeneralSans-Medium',
                                color: notifire.gettextcolor),
                          ),
                          SizedBox(width: 10.sp),
                          Container(
                              color: notifire.getprimerycolor,
                              child: Icon(Icons.info_outlined,
                                  color: notifire.gettext1color))
                        ],
                      ),

                      SizedBox(height: 20.sp),
                      Row(children: [
                        GestureDetector(
                          onTap: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            if(agentvalue=='2'){
                              agentvalue='1';
                              setState(() {

                              });
                            }

                          },
                          child: SizedBox(
                            height: 45,
                            width: 40.sp,
                            child: agentvalue=='1'?
                            Custombutton.button2(
                              notifire.getbuttonscolor,
                              "Yes",
                              30.sp,
                              50.sp,
                            ):Custombutton.button3(
                              notifire.getbuttonscolor,
                              "Yes",
                              30.sp,
                              50.sp,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.sp),
                        GestureDetector(
                          onTap: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            if(agentvalue=='1'){
                              agentvalue='2';
                              setState(() {

                              });
                            }
                          },
                          child: SizedBox(
                            height: 45,
                            width: 40.sp,
                            child: agentvalue=='2'?Custombutton.button2(
                              notifire.getbuttonscolor,
                              "No",
                              30.sp,
                              50.sp,
                            )
                                :Custombutton.button3(
                              notifire.getbuttonscolor,
                              "No",
                              30.sp,
                              50.sp,
                            ) ,
                          ),
                        ),
                      ],),
                      SizedBox(height: 20.sp),
                      Row(
                        children: [
                          Ink(
                            width: 20.sp,
                            child: Transform.scale(
                              scale: 0.7,
                              child: CupertinoSwitch(
                                activeColor: notifire.getbuttonscolor,
                                value: termStatus,
                                onChanged: (value) {
                                  setState(() {});
                                  termStatus = value;
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 20.sp),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                  text: "By continuing, ",
                                  style: TextStyle(
                                      color: notifire.getwhitecolor,
                                      fontSize: 15.sp),
                                  children: <TextSpan>[
                                    TextSpan(text: "You agree to NewKey's \n"),
                                    TextSpan(
                                        text: 'Terms of Use ',
                                        style: const TextStyle(
                                            decoration: TextDecoration
                                                .underline,
                                            decorationThickness: 2.5),
                                        recognizer:
                                        TapGestureRecognizer()
                                          ..onTap = () {
                                            // TermsandConditions().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Fade);
                                            // WebPage("Terms & Conditions").launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Fade);
                                          }),
                                    const TextSpan(text: "and "),
                                    TextSpan(
                                        text: 'Privacy Policy.'.tr,
                                        style: const TextStyle(
                                            decoration: TextDecoration
                                                .underline,
                                            decorationThickness: 2.5),
                                        recognizer:
                                        TapGestureRecognizer()
                                          ..onTap = () {
                                            // PrivacyPolicy().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Fade);
                                          }),
                                  ]),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 30.sp),
                      GestureDetector(
                        onTap: () {
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              bottom: 0, top: 0, left: 15.sp, right: 15.sp),
                          height: 25.sp,
                          child: Custombutton.button2(
                            notifire.getbuttonscolor,
                            "Save",
                            25.sp,
                            double.infinity,
                          ),
                        ),
                      ),
                      SizedBox(height: 30.sp),
                    ],
                  ),
                ),
              ),),
          ),))

    );
  }

}



