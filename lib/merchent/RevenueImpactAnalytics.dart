import 'package:SastaKhana/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../globalwidgets/base_scaffold_body.dart';
import '../utils/colornotifire.dart';
import 'PayoutSummary.dart';


class RevenueImpactAnalytics extends StatefulWidget {
  const RevenueImpactAnalytics({Key? key}) : super(key: key);

  @override
  RevenueImpactAnalyticsState createState() => RevenueImpactAnalyticsState();
}

class RevenueImpactAnalyticsState extends State<RevenueImpactAnalytics> with SingleTickerProviderStateMixin {
  // final MarchentCustomerReviews = Get.put(AuthController());
  late ColorNotifire notifire;
  bool status = false;
  final number = TextEditingController();
  String? dropdownValue = "";

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
            child: Container(margin: EdgeInsets.only(top: 0.sp, bottom: 0, left: 15.sp, right: 15.sp),
              child: Column(
              children: [
                // Top Filter
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.calendar_month, size: 18),
                        SizedBox(width: 8),
                        Text("Last 30 Days"),
                        SizedBox(width: 6),
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                Expanded(
                  child: ListView(
                    children: [
                      // Revenue Trends
                      _card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _cardHeader("Revenue Trends"),
                            const SizedBox(height: 12),
                            SizedBox(
                              height: 180,
                              child: CustomPaint(
                                painter: _RevenueLinePainter(),
                                child: const Padding(
                                  padding: EdgeInsets.only(bottom: 16),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Jan"),
                                        Text("Feb"),
                                        Text("Mar"),
                                        Text("Apr"),
                                        Text("May"),
                                        Text("Jun"),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              "Total Revenue this period: ₹26,000",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Environmental Impact
                      _card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _cardHeader("Environmental Impact"),
                            const SizedBox(height: 16),
                            GridView.count(
                              crossAxisCount: 2,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              children: [
                                _impactTile(
                                    Icons.eco, "500 kg", "Food Saved",
                                    Colors.green),
                                _impactTile(
                                    Icons.bolt, "1,200 kWh", "Energy Saved",
                                    Colors.orange),
                                _impactTile(
                                    Icons.cloud, "300 kg", "CO₂ Reduced",
                                    Colors.green),
                                _impactTile(
                                    Icons.restaurant, "15 Meals", "Families Fed",
                                    Colors.black),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20.sp),

                      // CTA Button
                      SizedBox(
                        height: 28.sp,
                        child: ElevatedButton(
                          onPressed: () {
                            PayoutSummary().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Scale);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'View Payout Summary',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: 'GeneralSans-Semibold',
                                    color: white),
                              ),
                              SizedBox(width: 10.sp),
                              Icon(Icons.arrow_forward, color: white,size: 18.sp,),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 25.sp),
                    ],
                  ),
                ),
              ],
            ),)
        ),)

    );

  }
  // ================= Helpers =================

  Widget _card({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 10,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _cardHeader(String title) {
    return Row(
      children: [
        Text(title,
            style:
            const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const Spacer(),
        const Icon(Icons.info_outline, size: 18),
      ],
    );
  }

  Widget _impactTile(
      IconData icon, String value, String label, Color color) {
    return Column(
      children: [
        Icon(icon, size: 32, color: color),
        const SizedBox(height: 8),
        Text(value,
            style:
            const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(label,
            style: TextStyle(fontSize: 13, color: Colors.grey.shade600)),
      ],
    );
  }
}

/// ===== Private Painter (required by Flutter) =====
class _RevenueLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final solid = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final dashed = Paint()
      ..color = Colors.black54
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(0, size.height * 0.5)
      ..lineTo(size.width * .2, size.height * .65)
      ..lineTo(size.width * .4, size.height * .35)
      ..lineTo(size.width * .6, size.height * .45)
      ..lineTo(size.width * .8, size.height * .2)
      ..lineTo(size.width, size.height * .3);

    final path2 = Path()
      ..moveTo(0, size.height * .45)
      ..lineTo(size.width * .2, size.height * .6)
      ..lineTo(size.width * .4, size.height * .4)
      ..lineTo(size.width * .6, size.height * .5)
      ..lineTo(size.width * .8, size.height * .3)
      ..lineTo(size.width, size.height * .4);

    canvas.drawPath(path, solid);
    canvas.drawPath(path2, dashed);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
