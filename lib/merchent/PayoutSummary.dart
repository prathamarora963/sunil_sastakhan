

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../globalwidgets/base_scaffold_body.dart';
import '../utils/color.dart';
import '../utils/colornotifire.dart';

class PayoutSummary extends StatefulWidget {
  const PayoutSummary({Key? key}) : super(key: key);

  @override
  _PayoutSummaryState createState() => _PayoutSummaryState();
}

class _PayoutSummaryState extends State<PayoutSummary> {
  // final PayoutSummary = Get.put(AuthController());
  late ColorNotifire notifire;
  bool status = false;
  final number = TextEditingController();
  // final password = TextEditingController();
  List<String> _countryCodes = [];
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
                          "Payout Summary",
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontFamily: 'GeneralSans-Bold',
                              color: notifire.gettextcolor),
                        ),),
                    ]),
                    SizedBox(height: 15.sp),
                    /// TOTAL PAYOUT CARD
                    Container(
                      width: double.infinity,
                      padding:  EdgeInsets.all(20.sp),
                      decoration: BoxDecoration(
                        color: const Color(0xfff2f6ef),
                        borderRadius: BorderRadius.circular(15.sp),
                      ),
                      child: Column(
                        children:  [
                          Text(
                              "Total Payouts",
                              style: TextStyle(
                                fontFamily:
                                'GeneralSans-Semibold',
                                color: notifire.textcolor,
                                fontSize: 18.sp,)),

                          SizedBox(height: 10.sp),
                          Icon(Icons.account_balance_wallet_outlined, size: 22.sp),
                          SizedBox(height: 15.sp),
                          Text(
                            "Rs 24,500.00",
                            style: TextStyle(
                                fontSize: 22.sp,
                                fontFamily: 'GeneralSans-Bold',
                                color: notifire.gettextcolor),
                          ),
                          SizedBox(height: 6.sp),
                          Text(
                              textAlign: TextAlign.center,
                              "Last 30 days (July 1 - July 31)",
                              style: TextStyle(
                                fontFamily:
                                'GeneralSans-Medium',
                                color: textColorSecond,
                                fontSize: 15.sp,)),

                        ],
                      ),
                    ),

                    SizedBox(height: 15.sp),

                    /// FILTER ROW
                    Row(
                      children: [
                        OutlinedButton.icon(
                          onPressed: () {},
                          icon:  Icon(Icons.calendar_month, size: 18.sp,color: textColorSecond,),
                          label: Text(
                              textAlign: TextAlign.center,
                              "Filter by Date",
                              style: TextStyle(
                                fontFamily:
                                'GeneralSans-Medium',
                                color: textColorSecond,
                                fontSize: 15.sp,)),
                          style: OutlinedButton.styleFrom(
                            padding:  EdgeInsets.symmetric(
                              horizontal: 14.sp,
                              vertical: 12.sp,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                          ),
                        ),
                        const Spacer(),
                         Text(
                            textAlign: TextAlign.center,
                            "Aug 1 - Aug 31",
                            style: TextStyle(
                              fontFamily:
                              'GeneralSans-Medium',
                              color: textColorSecond,
                              fontSize: 16.sp,)),
                      ],
                    ),
                     SizedBox(height: 0.sp),
                    /// PAYOUT HISTORY
                    Container(
                      width: double.infinity,
                      padding:  EdgeInsets.all(10.sp),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Payout History",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 15.sp),
                          _tableHeader(),
                          const Divider(),
                          ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.all(0),
                            itemCount: 8,
                            itemBuilder: (context, index) {
                              // return propertyListItem(propertyList![index]);
                              // final item = items[index];
                              return _payoutRow("xxx33xx33","Aug 20, 2024", "₹ 5,200.00", true);
                            },
                          ),
                         /* _payoutRow("xxx33xx33","Aug 20, 2024", "₹ 5,200.00", true),
                          _payoutRow("xxx33xx34","Aug 15, 2024", "₹ 8,100.00", true),
                          _payoutRow("xxx33xx35","Aug 10, 2024", "₹ 6,000.00", false),
                          _payoutRow("xxx33xx36","Aug 05, 2024", "₹ 5,200.00", true),
                          _payoutRow("xxx33xx37","Jul 31, 2024", "₹ 7,500.00", true),
                          _payoutRow("xxx33xx38","Jul 25, 2024", "₹ 4,900.00", false),*/
                        ],
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
  /// TABLE HEADER
  static Widget _tableHeader() {
    return Row(
      children:  [
        Expanded(
          flex: 3,
          child: Text(
            // textAlign: TextAlign.center,
              "Order Id",
              style: TextStyle(
                fontFamily:
                'GeneralSans-Medium',
                color: textColor,
                fontSize: 15.sp,)),
        ),
        Expanded(
          flex: 2,
          child: Text(
              // textAlign: TextAlign.center,
              "Date",
              style: TextStyle(
                fontFamily:
                'GeneralSans-Medium',
                color: textColor,
                fontSize: 15.sp,)),
        ),
        Expanded(
          flex: 2,
          child: Text(
            textAlign: TextAlign.center,
              "Amount",
              style: TextStyle(
                fontFamily:
                'GeneralSans-Medium',
                color: textColor,
                fontSize: 15.sp,)),

        ),
        Expanded(
          flex: 2,
          child: Text(
            textAlign: TextAlign.center,
              "Status",
              style: TextStyle(
                fontFamily:
                'GeneralSans-Medium',
                color: textColor,
                fontSize: 15.sp,)),
        ),
      ],
    );
  }

  /// PAYOUT ROW
  static Widget _payoutRow(String orderId, String date, String amount, bool isPaid) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(flex: 3, child:
          Text(
              orderId,
              style: TextStyle(
                fontFamily:
                'GeneralSans-Medium',
                color: textColorSecond,
                fontSize: 15.sp,)),),
          Expanded(flex: 3, child: Text(
              date,
              style: TextStyle(
                fontFamily:
                'GeneralSans-Medium',
                color: textColorSecond,
                fontSize: 15.sp,)),),
          Expanded(flex: 2, child: Text(
              amount,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily:
                'GeneralSans-Medium',
                color: textColorSecond,
                fontSize: 15.sp,)),
        ),
          Expanded(
            flex: 2,
            child: Text(
                textAlign: TextAlign.center,
                isPaid ? "Paid" : "Pending",
                style: TextStyle(
                  fontFamily:
                  'GeneralSans-Medium',
                  color: isPaid ? buttonColor : Colors.orange,
                  fontSize: 15.sp,)),
          ),
        ],
      ),
    );
  }
}



