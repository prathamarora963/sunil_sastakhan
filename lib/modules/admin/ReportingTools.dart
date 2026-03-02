
import 'package:SastaKhana/controller/admin/revenue_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'dart:math' as math;
import '../../globalwidgets/base_scaffold_body.dart';
import '../../utils/color.dart';
import '../../utils/colornotifire.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../data/models/admin_models/monthly_revenue_model.dart';

class ReportingTools extends StatefulWidget {
  const ReportingTools({Key? key}) : super(key: key);

  @override
  _ReportingToolsState createState() => _ReportingToolsState();
}

class _ReportingToolsState extends State<ReportingTools> {
  final RevenueController _revenueController = Get.put(RevenueController());
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
              padding: EdgeInsets.symmetric(horizontal: 15.sp),
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child:Obx((){
                  final revenue = _revenueController.revenueData;
                  final quartlyRevenue = _revenueController.quartlyRevenueData;
                  return  Column(crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 15.sp),
                    _metricCard(
                      icon: Icons.credit_card,
                      title: "Total Revenue",
                      value: "Rs ${quartlyRevenue?.revenue?.current ?? '0'}",
                      subtitle: "Total earnings this month",
                      percentage: "${quartlyRevenue?.revenue?.growthPercent ?? '0'}%",
                      isPositive: (quartlyRevenue?.revenue?.growthPercent ?? 0) >= 0,
                    ),
                     SizedBox(height: 15.sp),
                    _metricUsersCard(
                      icon: Icons.people,
                      title: "Active Users",
                      value: quartlyRevenue?.activeUsers?.current ?? '0',
                      subtitle: "Users currently engaged",
                      percentage: "${quartlyRevenue?.activeUsers?.growthPercent ?? '0'}%",
                      isPositive: (quartlyRevenue?.activeUsers?.growthPercent ?? 0) >= 0,
                    ),
                    SizedBox(height: 15.sp),
                    _monthlyRevenueCard(revenue),
                    const SizedBox(height: 20),
                    _quarterlyUsersCard(quartlyRevenue),
                    SizedBox(height: 40.sp),
                  ],
                );
              
                })),
            ),
          ),),)

    );

  }
  // ================= Metric Card =================
  Widget _metricCard({
    required IconData icon,
    required String title,
    required String value,
    required String subtitle,
    required String percentage,
    required bool isPositive,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.sp),
      ),
      child: Container( padding: EdgeInsets.all(15.sp),
        child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: buttonColor),
              SizedBox(width: 10.sp),
              Text(
                  title,
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'GeneralSans-Semibold',
                      color: textColor)

              ),

            ],
          ),
           SizedBox(height: 10.sp),
          Text(
            value,
            style: TextStyle(
                fontSize: 22.sp,
                fontFamily: 'GeneralSans-Bold',
                color: buttonColor),
          ),
           SizedBox(height: 8.sp),
          Text(
            subtitle,
            style: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'GeneralSans-Medium',
                color: textColorSecond),
          ),
          SizedBox(height: 12.sp),
          Row(
            children: [
              Icon(
                isPositive ? Icons.trending_up : Icons.trending_down,
                size: 18.sp,
                color: isPositive ? Colors.green : Colors.red,
              ),
              SizedBox(width: 10.sp),
              Text(
                percentage,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'GeneralSans-Medium',
                  color: isPositive ? Colors.green : Colors.red,),
              ),
               SizedBox(width: 10.sp),
              Text(
                "vs last month",
                style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'GeneralSans-Medium',
                    color: textColorSecond),
              ),
            ],
          ),
        ],
      ),),
    );
  }
  Widget _metricUsersCard({
    required IconData icon,
    required String title,
    required String value,
    required String subtitle,
    required String percentage,
    required bool isPositive,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.sp),
      ),
      child: Container( padding: EdgeInsets.all(15.sp),
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: buttonColor),
                SizedBox(width: 10.sp),
                Text(
                    title,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'GeneralSans-Semibold',
                        color: textColor)

                ),

              ],
            ),
            SizedBox(height: 10.sp),
            Text(
              value,
              style: TextStyle(
                  fontSize: 22.sp,
                  fontFamily: 'GeneralSans-Bold',
                  color: buttonColor),
            ),
            SizedBox(height: 8.sp),
            Text(
              subtitle,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'GeneralSans-Medium',
                  color: textColorSecond),
            ),
            SizedBox(height: 12.sp),
            Row(
              children: [
                Icon(
                  isPositive ? Icons.trending_up : Icons.trending_down,
                  size: 18.sp,
                  color: isPositive ? Colors.green : Colors.red,
                ),
                SizedBox(width: 10.sp),
                Text(
                  percentage,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'GeneralSans-Medium',
                    color: isPositive ? Colors.green : Colors.red,),
                ),
                SizedBox(width: 10.sp),
                Text(
                  "vs last month",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'GeneralSans-Medium',
                      color: textColorSecond),
                ),
              ],
            ),
          ],
        ),),
    );
  }

  // ================= Monthly Revenue =================
  Widget _monthlyRevenueCard(MonthlyRevenueModel? revenueData) {
    const monthKeys = [
      "jan",
      "feb",
      "mar",
      "apr",
      "may",
      "jun",
      "jul",
      "aug",
      "sep",
      "oct",
      "nov",
      "dec",
    ];
    const monthLabels = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];

    final monthlyValues = monthKeys
        .map((key) => (revenueData?.monthlyRevenue[key] ?? 0).toDouble())
        .toList();
    final maxValue =
        monthlyValues.isEmpty ? 0.0 : monthlyValues.reduce(math.max);
    final maxY = maxValue <= 0 ? 100.0 : maxValue * 1.2;
    final interval = maxY <= 100 ? 20.0 : math.max(1.0, maxY / 5);
    final spots = List.generate(
      monthlyValues.length,
      (index) => FlSpot(index.toDouble(), monthlyValues[index]),
    );

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.sp)),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Monthly Revenue Trends",
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
                  titlesData:
                      _monthTitles(monthLabels: monthLabels, interval: interval),
                  minY: 0,
                  maxY: maxY,
                  lineBarsData: [
                    LineChartBarData(
                      spots: spots,
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
            SizedBox(height: 10.sp),
            Text(
              "Total: Rs ${revenueData?.totalRevenue ?? 0}",
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'GeneralSans-Medium',
                color: textColorSecond,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= Quarterly Users =================
  Widget _quarterlyUsersCard(QuartlyReportModel? quartlyRevenue) {
    final growthList = quartlyRevenue?.quarterlyGrowth ?? const [];
    final quarterLabels = growthList
        .map((item) => _formatQuarterLabel(item.label))
        .toList();
    final quarterValues = growthList
        .map((item) => double.tryParse(item.total ?? "0") ?? 0.0)
        .toList();
    final maxQuarterValue =
        quarterValues.isEmpty ? 0.0 : quarterValues.reduce(math.max);
    final maxY = maxQuarterValue <= 0 ? 10.0 : maxQuarterValue * 1.2;
    final interval = maxY <= 10 ? 2.0 : math.max(1.0, maxY / 5);
    final barGroups = List.generate(
      quarterValues.length,
      (index) => _barGroup(index, quarterValues[index]),
    );

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              "Quarterly User Growth",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: 'GeneralSans-Semibold',
                    color: textColor)
            ),
             SizedBox(height: 20.sp),
            SizedBox(
              height: 60.sp,
              child: BarChart(
                BarChartData(
                  borderData: FlBorderData(show: false),
                  gridData: FlGridData(show: true, drawVerticalLine: false),
                  titlesData: _quarterTitles(
                    quarterLabels: quarterLabels,
                    interval: interval,
                  ),
                  maxY: maxY,
                  barGroups: barGroups,
                ),
              ),
            ),
            SizedBox(height: 12.sp),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Icon(Icons.square, size: 14, color: buttonColor),
                SizedBox(width: 6),
                Text("Users",style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: 'GeneralSans-Medium',
                    color: textColor),),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ================= Helpers =================
  BarChartGroupData _barGroup(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          width: 24,
          borderRadius: BorderRadius.circular(6),
          color: Colors.green.shade300,
        ),
      ],
    );
  }

  FlTitlesData _monthTitles({
    required List<String> monthLabels,
    required double interval,
  }) {
    return FlTitlesData(
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: interval,
          reservedSize: 44,
          getTitlesWidget: (value, _) => Text(value.toInt().toString(),style: TextStyle(
              fontSize: 15.sp,
              fontFamily: 'GeneralSans-Medium',
              color: textColor)),
        ),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTitlesWidget: (value, _) {
            final index = value.toInt();
            if (index < 0 || index >= monthLabels.length) {
              return const SizedBox.shrink();
            }
            return Text(monthLabels[index],style: TextStyle(
                fontSize: 15.sp,
                fontFamily: 'GeneralSans-Medium',
                color: textColor));
          },
        ),
      ),
    );
  }

  String _formatQuarterLabel(String? rawLabel) {
    if (rawLabel == null || rawLabel.trim().isEmpty) return "N/A";
    final parts = rawLabel.split("-");
    if (parts.length == 2 &&
        parts[0].length == 4 &&
        RegExp(r"^\d{4}$").hasMatch(parts[0])) {
      final year = parts[0].substring(2);
      final quarter = parts[1];
      return "$quarter $year";
    }
    return rawLabel;
  }

  FlTitlesData _quarterTitles({
    required List<String> quarterLabels,
    required double interval,
  }) {
    return FlTitlesData(
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: interval,
          reservedSize: 44,
          getTitlesWidget: (value, _) => Text(value.toInt().toString(),style: TextStyle(
              fontSize: 15.sp,
              fontFamily: 'GeneralSans-Medium',
              color: textColor)),
        ),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTitlesWidget: (value, _) {
            final index = value.toInt();
            if (index < 0 || index >= quarterLabels.length) {
              return const SizedBox.shrink();
            }
            return Text(quarterLabels[index],style: TextStyle(
                fontSize: 15.sp,
                fontFamily: 'GeneralSans-Medium',
                color: textColor));
          },
        ),
      ),
    );
  }
}
