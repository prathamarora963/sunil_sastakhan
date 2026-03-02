
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../globalwidgets/base_scaffold_body.dart';
import '../../utils/color.dart';
import '../../utils/colornotifire.dart';

class ReferralProgram extends StatefulWidget {
  const ReferralProgram({Key? key}) : super(key: key);

  @override
  _ReferralProgramState createState() => _ReferralProgramState();
}

class _ReferralProgramState extends State<ReferralProgram> {
  late ColorNotifire notifire;
  bool status = false;
  final number = TextEditingController();
  String? dropdownValue = "";
  int quantity = 2;
  @override
  void initState() {
    super.initState();

  }
  final String referralCode = 'SASTAKHANA123';
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
                          "Referrals & Rewards",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'GeneralSans-Bold',
                              color: notifire.gettextcolor),
                        ),),
                    ]),
                     SizedBox(height: 20.sp),
                    Container(
                        padding:  EdgeInsets.symmetric(horizontal: 15.sp,vertical: 15.sp),
                        width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF2E6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(
                          'Your Referral Code',
                            style: TextStyle(
                              fontFamily:
                              'GeneralSans-Bold',
                              color: notifire.gettextcolor,
                              fontSize: 17.sp,)
                        ),
                          SizedBox(height: 15.sp),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  referralCode,
                            style: TextStyle(
                              fontFamily:
                              'GeneralSans-Semibold',
                              color: notifire.gettextcolor,
                              letterSpacing: 1,
                              fontSize: 16.sp,)
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.share),
                                onPressed: () {
                                  Clipboard.setData(
                                      ClipboardData(text: referralCode));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Code copied')),
                                  );
                                },
                              )
                            ],
                          ),
                          SizedBox(height: 15.sp),
                          Text(
                            'Share this code with your friends to give them a discount on their first Surprise Bag and earn rewards!',
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontFamily: 'GeneralSans-Medium',
                                color: textColorSecond),
                          ),
                          SizedBox(height: 20.sp),
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
                                'Share',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: 'GeneralSans-Semibold',
                                    color: white),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.sp),
                      ],)
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


