import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:upgrader/upgrader.dart';
import '../../globalwidgets/base_scaffold_body.dart';
import '../../utils/color.dart';
import '../../utils/globalwidgets.dart';
import '../../utils/colornotifire.dart';
import 'package:provider/provider.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'MarchentCampaignPaymentList.dart';
import 'MarchentOrderPaymentList.dart';

class MarchentFinance extends StatefulWidget {
  const MarchentFinance({Key? key}) : super(key: key);

  @override
  State<MarchentFinance> createState() => _MarchentFinanceState();
}

class _MarchentFinanceState extends State<MarchentFinance> with SingleTickerProviderStateMixin {
  late ColorNotifire notifire;
  PackageInfo? packageInfo;
  String? appName;
  String? packageName;
  bool isChecked = false;
  String code = "0";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 0), () {
      setState(() {});
    });
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return UpgradeAlert(
        child: Scaffold(
            backgroundColor: notifire.backgrounde,
            body: Body(
                child:SizedBox(
                    height: screenHeight(context),
                    width: screenWidth(context),
                    child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(
                            parent: BouncingScrollPhysics()),
                        child: Container(margin: EdgeInsets.only(top: 0.sp, bottom: 0, left: 15.sp, right: 15.sp),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
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
                                      "Manage Finance",
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontFamily: 'GeneralSans-Bold',
                                          color: notifire.gettextcolor),
                                    ),),
                                ]),
                                /*Padding(
                                    padding: EdgeInsets.only(
                                        left: 0.sp, top: 0.sp),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          "Welcome, SastaKhana!",
                                          style: TextStyle(
                                            fontFamily:
                                            'GeneralSans-Bold',
                                            color: notifire.textcolor,
                                            fontSize: 18.sp,)),
                                    )),*/

                                /// ------------------ TOP CARDS ------------------
                                SizedBox(height:15.sp),
                                SizedBox(height: 50.sp,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: _statCard(
                                          title: "Orders Payment",
                                          amount: "₹12,450",
                                          subtitle: "This Week",
                                          gradient: const [Color(0xFF00B7B5), Color(0xff045e46)],
                                          icon: Icons.receipt_long,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: _statCard(
                                          title: "Campaign Payment",
                                          amount: "₹16,450",
                                          subtitle: "Total",
                                          gradient: const [Color(0xFF9FA8FF), Color(0xFF5C6BC0)],
                                          icon: Icons.campaign,
                                        ),
                                      ),
                                    ],
                                  ),),
                                SizedBox(height:15.sp),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 0.sp, right: 0.sp),
                                  child: Text(
                                    "Quick Actions",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontFamily:
                                        'GeneralSans-Semibold',
                                        color: notifire.gettextcolor),
                                  ),
                                ),
                                SizedBox(height:15.sp),
                                // Order List
                                _actionCard(
                                  icon: Icons.list_alt,
                                  title: "Orders Payment",
                                  subtitle: "View all customer orders payment",
                                  onTap: () {
                                    MarchentOrderPaymentList().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Scale);
                                  },
                                ),
                                 SizedBox(height: 16.sp),
                                // Campaign List
                                _actionCard(
                                  icon: Icons.grid_view_rounded,
                                  title: "Campaign Payment",
                                  subtitle: "View all campaigns payment",
                                  onTap: () {
                                    MarchentCampaignPaymentList().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Scale);
                                  },
                                ),

                                SizedBox(height:15.sp),


                                //! ----------- Trending Projects List -------------
                                SizedBox(height: 10.sp),

                              ],
                            ))))
            )
        ));
  }

  //upload doc
  Widget quickAction(String title,IconData icon, {required VoidCallback onTap}){
    return Row(
      children: [
        Container(
          padding:  EdgeInsets.all(13.sp),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child:  Icon(
            icon,
            size: 22.sp,
            color: textColor,
          ),
        ),
        SizedBox(width: 16.sp),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 15.sp,
                fontFamily: 'GeneralSans-Medium',
                color: textColor),
          ),
        ),
      ],
    );
  }
  // ====== ACTION CARD ======
  Widget _actionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(18.sp),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(18.sp),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.sp),
          boxShadow:  [
            BoxShadow(
              color: BoxShadowColorValue,
              blurRadius: 10.sp,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(14.sp),
              decoration: BoxDecoration(
                color: const Color(0xFFF0F2F8),
                borderRadius: BorderRadius.circular(14.sp),
              ),
              child: Icon(icon, size: 20.sp),
            ),
             SizedBox(width: 15.sp),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'GeneralSans-Semibold',
                        color: textColor),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'GeneralSans-Medium',
                        color: textColorSecond),
                  ),

                ],
              ),
            ),
             Icon(Icons.arrow_forward_ios, size: 16.sp),
          ],
        ),
      ),
    );
  }
  Widget quickActionqq(String title,IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: const Color(0xfff7f7f9),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Icon(icon, size: 26, color: Colors.black87),
          const SizedBox(width: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }

  // ====== STAT CARD ======
  Widget _statCard({
    required String title,
    required String amount,
    required String subtitle,
    required List<Color> gradient,
    required IconData icon,
  }) {
    return Expanded(
      child: Container(
        height: 100.sp,
        padding:  EdgeInsets.all(15.sp),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16.sp),
          boxShadow: [
            BoxShadow(
              color: gradient.last.withOpacity(0.35),
              blurRadius: 12.sp,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 16.sp,
              backgroundColor: Colors.white.withOpacity(0.25),
              child: Icon(icon, color: Colors.white),
            ),
            Container(margin: EdgeInsets.only(
                bottom: 0, top: 5.sp, left: 0.sp, right: 0),
              child:  Text(
                  title,
                  style: TextStyle(
                    fontFamily:
                    'GeneralSans-Medium',
                    color: Colors.white70,
                    fontSize: 16.sp,
                  )),),
             SizedBox(height: 4.sp),
            Text(
                amount,
                style: TextStyle(
                  fontFamily:
                  'GeneralSans-Bold',
                  color: Colors.white,
                  fontSize: 21.sp,)),
            Text(
                subtitle,
                style: TextStyle(
                  fontFamily:
                  'GeneralSans-Medium',
                  color: Colors.white70,
                  fontSize: 14.sp,
                )),

          ],
        ),
      ),
    );
  }
}