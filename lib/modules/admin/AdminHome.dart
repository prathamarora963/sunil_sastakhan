import 'dart:async';
import 'dart:ui';
import 'package:SastaKhana/controller/admin/today_sales_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:upgrader/upgrader.dart';
import 'ManageMerchant.dart';
import 'ManageUser.dart';
import 'SupportCenter.dart';
import '../../globalwidgets/base_scaffold_body.dart';
import '../merchent/MarchentFinance.dart';
import '../shared_ui/OrdersList.dart';
import '../../utils/color.dart';
import '../../utils/globalwidgets.dart';
import '../../utils/colornotifire.dart';
import 'package:provider/provider.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome>
    with SingleTickerProviderStateMixin {
  final TodaySalesController todaySalesController = Get.put(
    TodaySalesController(),
  );
  late ColorNotifire notifire;
  PackageInfo? packageInfo;
  String? appName;
  String? packageName;
  bool isChecked = false;
  String code = "0";
  String networkimage = '';
  var topItems = ['Buy', 'Rent', 'New Launch'];

  String? baseUrl = '';

  @override
  void initState() {
    super.initState();
  }

  Future<void> _pullRefresh() async {
   todaySalesController.fetchTodaySales();
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
          child: RefreshIndicator(
            onRefresh: _pullRefresh,
            child: SizedBox(
              height: screenHeight(context),
              width: screenWidth(context),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                child: Container(
                  margin: EdgeInsets.only(
                    top: 0.sp,
                    bottom: 0,
                    left: 15.sp,
                    right: 15.sp,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //! ----- Top topItem List ------
                      SizedBox(height: 15.sp),
                      Padding(
                        padding: EdgeInsets.only(left: 0.sp, top: 0.sp),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Welcome, SastaKhana!",
                            style: TextStyle(
                              fontFamily: 'GeneralSans-Bold',
                              color: notifire.textcolor,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 0.sp, top: 10.sp),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Here's your dashboard overview.",
                            style: TextStyle(
                              fontFamily: 'GeneralSans-Regular',
                              color: notifire.textcolor,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.sp),

                      /// ------------------ TOP CARDS ------------------
                      Obx(
                        () => SizedBox(
                          height: 50.sp,
                          child: Row(
                            children: [
                              Expanded(
                                child: top(
                                  title: "Today's Sales",
                                  value: "₹${todaySalesController.todaySales.value?.todaySale ?? '0'}",
                                  icon: Icons.receipt_long,
                                  background: const Color(0xffeef7e8),
                                  border: false,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: top(
                                  title: "Food Saved",
                                  value: "350",
                                  subtitle: "kg this week",
                                  icon: Icons.home_outlined,
                                  background: Colors.white,
                                  border: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15.sp),
                      Padding(
                        padding: EdgeInsets.only(left: 0.sp, right: 0.sp),
                        child: Text(
                          "Quick Actions",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: 'GeneralSans-Semibold',
                            color: notifire.gettextcolor,
                          ),
                        ),
                      ),
                      SizedBox(height: 15.sp),
                      InkWell(
                        onTap: () {
                          /* final result = await Get.to(() => MobileScannerAdvanced());
                            if (result != null) {
                              await auth.getCustomerDetailsOnTap(
                                  id: result
                              ).then((userData) {
                                // userDetails= userData;
                                setState(() {

                                });

                              });
                            }*/

                          ManageMerchant(navFlag: false).launch(
                            context,
                            isNewTask: false,
                            pageRouteAnimation: PageRouteAnimation.Scale,
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 0,
                            vertical: 0,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: borderColorvalue),
                            borderRadius: BorderRadius.circular(10.sp),
                            color: textBoxbgColor,
                          ),
                          child: quickAction(
                            'Manage Merchant',
                            Icons.store_outlined,
                            onTap: () {},
                          ),
                        ),
                      ),
                      SizedBox(height: 15.sp),
                      InkWell(
                        onTap: () {
                          ManageUser().launch(
                            context,
                            isNewTask: false,
                            pageRouteAnimation: PageRouteAnimation.Scale,
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 0,
                            vertical: 0,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: borderColorvalue),
                            borderRadius: BorderRadius.circular(10.sp),
                            color: textBoxbgColor,
                          ),
                          child: quickAction(
                            'Manage User',
                            Icons.supervisor_account_sharp,
                            onTap: () {},
                          ),
                        ),
                      ),
                      SizedBox(height: 15.sp),
                      InkWell(
                        onTap: () {
                          SupportCenter().launch(
                            context,
                            isNewTask: false,
                            pageRouteAnimation: PageRouteAnimation.Scale,
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 0,
                            vertical: 0,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: borderColorvalue),
                            borderRadius: BorderRadius.circular(10.sp),
                            color: textBoxbgColor,
                          ),
                          child: quickAction(
                            'Support Center',
                            Icons.support_agent,
                            onTap: () {},
                          ),
                        ),
                      ),

                      SizedBox(height: 15.sp),
                      InkWell(
                        onTap: () {
                          OrdersList(navFlag: false).launch(
                            context,
                            isNewTask: false,
                            pageRouteAnimation: PageRouteAnimation.Scale,
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 0,
                            vertical: 0,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: borderColorvalue),
                            borderRadius: BorderRadius.circular(10.sp),
                            color: textBoxbgColor,
                          ),
                          child: quickAction(
                            'Track Orders',
                            Icons.track_changes_sharp,
                            onTap: () {},
                          ),
                        ),
                      ),

                      SizedBox(height: 15.sp),
                      InkWell(
                        onTap: () {
                          MarchentFinance().launch(
                            context,
                            isNewTask: false,
                            pageRouteAnimation: PageRouteAnimation.Scale,
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 0,
                            vertical: 0,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: borderColorvalue),
                            borderRadius: BorderRadius.circular(10.sp),
                            color: textBoxbgColor,
                          ),
                          child: quickAction(
                            'Manage Finance',
                            Icons.account_balance_sharp,
                            onTap: () {},
                          ),
                        ),
                      ),

                      SizedBox(height: 15.sp),
                      _monthlyRevenueCard(),

                      //! ----------- Trending Projects List -------------
                      SizedBox(height: 10.sp),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ================= Monthly Revenue =================
  Widget _monthlyRevenueCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.sp)),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Daily Sales Trends",
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'GeneralSans-Semibold',
                color: textColor,
              ),
            ),
            SizedBox(height: 20.sp),
            SizedBox(
              height: 60.sp,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: true, drawVerticalLine: false),
                  borderData: FlBorderData(show: false),
                  titlesData: _monthTitles(),
                  minY: 0,
                  maxY: 32000,
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 18000),
                        FlSpot(1, 23000),
                        FlSpot(2, 21000),
                        FlSpot(3, 27000),
                        FlSpot(4, 23000),
                        FlSpot(5, 31000),
                        FlSpot(6, 32000),
                      ],
                      isCurved: true,
                      color: buttonColor,
                      barWidth: 3,
                      dotData: FlDotData(show: true),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.sp),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.square, size: 14.sp, color: buttonColor),
                SizedBox(width: 10.sp),

                Text(
                  "Revenue",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: 'GeneralSans-Medium',
                    color: textColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  FlTitlesData _monthTitles() {
    return FlTitlesData(
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: 8000,
          getTitlesWidget: (value, _) => Text(
            "${value ~/ 1000}k",
            style: TextStyle(
              fontSize: 15.sp,
              fontFamily: 'GeneralSans-Medium',
              color: textColor,
            ),
          ),
        ),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, _) {
            const months = ["Mon", "Tue", "Wed", "Th", "Fr", "Sa", "Su"];
            return Text(
              months[value.toInt()],
              style: TextStyle(
                fontSize: 15.sp,
                fontFamily: 'GeneralSans-Medium',
                color: textColor,
              ),
            );
          },
        ),
      ),
    );
  }

  //upload doc
  Widget quickAction(
    String title,
    IconData icon, {
    required VoidCallback onTap,
  }) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(13.sp),
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: Icon(icon, size: 22.sp, color: textColor),
        ),
        SizedBox(width: 16.sp),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 15.sp,
              fontFamily: 'GeneralSans-Medium',
              color: textColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget quickActionqq(String title, IconData icon) {
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
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget top({
    String? title,
    String? value,
    String? subtitle,
    IconData? icon,
    Color? background,
    required bool border,
  }) {
    return Container(
      padding: EdgeInsets.all(18.sp),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(18),
        border: border ? Border.all(color: Colors.black12) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(icon, size: 18.sp, color: notifire.textcolor),
              Container(
                margin: EdgeInsets.only(
                  bottom: 0,
                  top: 0,
                  left: 10.sp,
                  right: 0,
                ),
                child: Text(
                  title ?? '',
                  style: TextStyle(
                    fontFamily: 'GeneralSans-Medium',
                    color: notifire.textcolor,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.sp),
          Text(
            value ?? '',
            style: TextStyle(
              fontFamily: 'GeneralSans-Bold',
              color: notifire.textcolor,
              fontSize: 22.sp,
            ),
          ),
          if (subtitle != null) ...[
            SizedBox(height: 4.sp),
            Text(
              subtitle!,
              style: TextStyle(
                fontFamily: 'GeneralSans-Medium',
                color: notifire.textcolor2,
                fontSize: 14.sp,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
