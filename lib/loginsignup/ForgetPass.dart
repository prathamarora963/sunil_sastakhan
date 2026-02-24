// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Global/Config.dart';
import '../globalwidgets/base_scaffold_body.dart';
import '../utils/botton.dart';
import '../utils/colornotifire.dart';
import '../utils/itextfield.dart';
import 'login.dart';

class PasswordsetPage extends StatefulWidget {
  final String? number;
  const PasswordsetPage({Key? key, this.number}) : super(key: key);

  @override
  _PasswordsetPageState createState() => _PasswordsetPageState();
}

class _PasswordsetPageState extends State<PasswordsetPage> {
  late ColorNotifire notifire;
  final auth = '';

  final fpassword = TextEditingController();
  final spassword = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  bool _obscureText = true;
  bool _obscureText1 = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggle2() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.backgrounde,
      body: Body(child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 20),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width / 20),
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
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Resset Password".tr,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Gilroy Medium',
                        color: notifire.getwhitecolor),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Please enter your email address to".tr,
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Gilroy Medium',
                            color: notifire.getwhitecolor),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 400),
                      Text(
                        "request a password reset".tr,
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Gilroy Medium',
                            color: notifire.getwhitecolor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Customtextfild2.textField(
                fpassword,
                _obscureText,
                "New Password".tr,
                Colors.grey,
                notifire.getwhitecolor,
                "image/Lock.png",
                GestureDetector(
                    onTap: () {
                      _toggle();
                    },
                    child: _obscureText
                        ? Image.asset("image/Hide.png", height: 22)
                        : Image.asset("image/Show.png", height: 22)),
                context: context,
              ),
            ),
            SizedBox(height:20.sp),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Customtextfild2.textField(
                spassword,
                _obscureText1,
                "confirm Password".tr,
                Colors.grey,
                notifire.getwhitecolor,
                "image/Lock.png",
                GestureDetector(
                    onTap: () {
                      _toggle2();
                    },
                    child: _obscureText1
                        ? Image.asset("image/Hide.png", height: 22)
                        : Image.asset("image/Show.png", height: 22)),
                context: context,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 20),
            GestureDetector(
              onTap: () {

              },
              child: SizedBox(
                height: 45,
                child: Custombutton.button1(
                  notifire.getbuttonscolor,
                  "SEND".tr,
                  30.sp,
                  double.infinity,
                ),
              ),
            ),
          ],
        ),
      ),)
    );
  }
}
