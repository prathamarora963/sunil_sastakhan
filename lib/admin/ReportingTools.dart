
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../globalwidgets/base_scaffold_body.dart';
import '../utils/color.dart';
import '../utils/colornotifire.dart';
import 'package:fl_chart/fl_chart.dart';

class ReportingTools extends StatefulWidget {
  const ReportingTools({Key? key}) : super(key: key);

  @override
  _ReportingToolsState createState() => _ReportingToolsState();
}

class _ReportingToolsState extends State<ReportingTools> {
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
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 15.sp),
                    _metricCard(
                      icon: Icons.credit_card,
                      title: "Total Revenue",
                      value: "Rs 31,000",
                      subtitle: "Total earnings this month",
                      percentage: "+10.2%",
                      isPositive: true,
                    ),
                     SizedBox(height: 15.sp),
                    _metricUsersCard(
                      icon: Icons.people,
                      title: "Active Users",
                      value: "19,200",
                      subtitle: "Users currently engaged",
                      percentage: "-3.5%",
                      isPositive: false,
                    ),
                    SizedBox(height: 15.sp),
                    _monthlyRevenueCard(),
                    const SizedBox(height: 20),
                    _quarterlyUsersCard(),
                    SizedBox(height: 40.sp),
                  ],
                ),
              ),
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
              "Monthly Revenue Trends",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: 'GeneralSans-Semibold',
                    color: textColor)
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

                Text("Revenue", style: TextStyle(
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

  // ================= Quarterly Users =================
  Widget _quarterlyUsersCard() {
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
                  titlesData: _quarterTitles(),
                  maxY: 20000,
                  barGroups: [
                    _barGroup(0, 12000),
                    _barGroup(1, 15500),
                    _barGroup(2, 14800),
                    _barGroup(3, 19000),
                  ],
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

  FlTitlesData _monthTitles() {
    return FlTitlesData(
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: 8000,
          getTitlesWidget: (value, _) => Text("${value ~/ 1000}k",style: TextStyle(
              fontSize: 15.sp,
              fontFamily: 'GeneralSans-Medium',
              color: textColor)),
        ),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, _) {
            const months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"];
            return Text(months[value.toInt()],style: TextStyle(
                fontSize: 15.sp,
                fontFamily: 'GeneralSans-Medium',
                color: textColor));
          },
        ),
      ),
    );
  }

  FlTitlesData _quarterTitles() {
    return FlTitlesData(
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: 5000,
          getTitlesWidget: (value, _) => Text("${value ~/ 1000}k",style: TextStyle(
              fontSize: 15.sp,
              fontFamily: 'GeneralSans-Medium',
              color: textColor)),
        ),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, _) {
            const quarters = ["Q1", "Q2", "Q3", "Q4"];
            return Text(quarters[value.toInt()],style: TextStyle(
                fontSize: 15.sp,
                fontFamily: 'GeneralSans-Medium',
                color: textColor));
          },
        ),
      ),
    );
  }
}





