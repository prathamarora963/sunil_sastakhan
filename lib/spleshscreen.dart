import 'dart:async';
import 'package:SastaKhana/utils/color.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'loginsignup/login.dart';
import 'utils/colornotifire.dart';

class Spleshscreen extends StatefulWidget {
  const Spleshscreen({Key? key}) : super(key: key);

  @override
  _SpleshscreenState createState() => _SpleshscreenState();
}

class _SpleshscreenState extends State<Spleshscreen> {
  final hData = '';

  final x = '';
  bool servicestatus = false;

  late StreamSubscription<Position> positionStream;
  openPage() async {
    Login().launch(context, isNewTask: true, pageRouteAnimation: PageRouteAnimation.Fade);
  }
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) => openPage());
  /*  Timer(
        const Duration(seconds: 3),
            () => userId == null && userId.isEmpty
            ? Login().launch(context, isNewTask: true, pageRouteAnimation: PageRouteAnimation.Fade)
            : Bottombar().launch(context, isNewTask: true, pageRouteAnimation: PageRouteAnimation.Fade));*/

  }

  late ColorNotifire notifire;


  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: buttonColor,
      body: Center(
        child: Container(
          color: buttonColor,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height /3.5),
              Container(
                  color: Colors.transparent,
                  height: 35.h,
                  child: Image.asset("images/logo.png")),
              SizedBox(height: 0.h),
              /*Container(child: Text(
                "SastaKhana",
                style: TextStyle(
                    fontSize: 28.sp,
                    fontFamily: 'GeneralSans-Bold',
                    color: primeryColor),
              ),),
              SizedBox(height: 1.h),
              Container(child: Text(
                "EAT SMILE SAVE",
                style: TextStyle(
                    fontSize: 22.sp,
                    fontFamily: 'GeneralSans-Semibold',
                    color: buttonsColororange),
              ),),*/
               SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}



