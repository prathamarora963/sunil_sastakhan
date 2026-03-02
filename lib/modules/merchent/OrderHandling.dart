
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../globalwidgets/base_scaffold_body.dart';
import '../../utils/color.dart';
import '../../utils/colornotifire.dart';
import 'MobileScannerAdvanced.dart';

class OrderHandling extends StatefulWidget {
  const OrderHandling({Key? key}) : super(key: key);

  @override
  _OrderHandlingState createState() => _OrderHandlingState();
}

class _OrderHandlingState extends State<OrderHandling> {
  late ColorNotifire notifire;
  bool status = false;
  final number = TextEditingController();
  String? dropdownValue = "";
  int quantity = 2;
  @override
  void initState() {
    super.initState();


  }

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
                          "Order Handling",
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontFamily: 'GeneralSans-Bold',
                              color: notifire.gettextcolor),
                        ),),
                    ]),
                    Center(
                      child: Padding(
                        padding:  EdgeInsets.all(10.sp),
                        child: Container(
                          padding:  EdgeInsets.all(20.sp),
                          decoration: BoxDecoration(
                            color:  Color(0xfff3f7f1),
                            borderRadius: BorderRadius.circular(20.sp),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              /// TITLE
                              Text(
                                  "Scan for Quick Pickup",
                                  style: TextStyle(
                                    fontFamily:
                                    'GeneralSans-Semibold',
                                    color: notifire.textcolor,
                                    fontSize: 18.sp,)),

                               SizedBox(height: 20.sp),
                              /// DOTTED SCAN AREA
                              DottedBorder(
                                options: RectDottedBorderOptions(
                                  dashPattern: [6, 4],
                                  strokeWidth: 2,
                                  padding: EdgeInsets.all(30.sp),
                                  color: Colors.black54,
                                  // radius: const Radius.circular(16),
                                ),
                                child: Container(
                                  height: 55.sp,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffe1e5e0),
                                    borderRadius: BorderRadius.circular(16.sp),
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: 120,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: const Icon(
                                        Icons.qr_code_2_sharp,
                                        size: 70,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: 18.sp),
                              /// DESCRIPTION
                              Text(
                                  textAlign: TextAlign.center,
                                  "Scan the customer's QR code to validate their reservation quickly and accurately.",
                                  style: TextStyle(
                                    fontFamily:
                                    'GeneralSans-Medium',
                                    color: textColorSecond,
                                    fontSize: 14.sp,)),
                               SizedBox(height: 20.sp),
                              /// ACTIVATE SCANNER BUTTON
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: buttonColor,
                                    padding:  EdgeInsets.symmetric(vertical: 14.sp),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.sp),
                                    ),
                                  ),
                                  onPressed: () {
                                    MobileScannerAdvanced().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Scale);
                                  },
                                  child: Text(
                                      textAlign: TextAlign.center,
                                      "Activate QR Scanner",
                                      style: TextStyle(
                                        fontFamily:
                                        'GeneralSans-Medium',
                                        color: Colors.white,
                                        fontSize: 16.sp,)),

                                ),
                              ),

                              SizedBox(height: 15.sp),

                              /// OR TEXT
                              Text(
                                  textAlign: TextAlign.center,
                                  "or continue with Code",
                                  style: TextStyle(
                                    fontFamily:
                                    'GeneralSans-Medium',
                                    color: textColorSecond,
                                    fontSize: 14.sp,)),

                               SizedBox(height: 15.sp),

                              /// CODE BUTTON
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: buttonColor,
                                    padding:  EdgeInsets.symmetric(vertical: 14.sp),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.sp),
                                    ),
                                  ),
                                  onPressed: () {
                                    // MobileScannerAdvanced().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Scale);
                                  },
                                  child: Text(
                                      textAlign: TextAlign.center,
                                      "AXCD451387DFV",
                                      style: TextStyle(
                                        fontFamily:
                                        'GeneralSans-Medium',
                                        color: Colors.white,
                                        fontSize: 16.sp,)),

                                ),
                              ),
                            ],
                          ),
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

