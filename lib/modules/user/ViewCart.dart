
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../merchent/MerchentBottombar.dart';
import '../../globalwidgets/base_scaffold_body.dart';
import '../../main.dart';
import '../../utils/color.dart';
import '../../utils/colornotifire.dart';
import '../../utils/commonutills.dart';
import 'ChoosePaymentMethod.dart';

class ViewCart extends StatefulWidget {
  const ViewCart({Key? key}) : super(key: key);

  @override
  _ViewCartState createState() => _ViewCartState();
}

class _ViewCartState extends State<ViewCart> {
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
                          "Cart",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'GeneralSans-Bold',
                              color: notifire.gettextcolor),
                        ),),
                    ]),
                    _card(
                      child: SizedBox(
                        child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 2,
                        separatorBuilder: (_, __) =>  Divider(height: 20.sp),
                        itemBuilder: (context, index) {
                          final items = [
                            {
                              'title': 'Kadhai Paneer',
                              'subtitle': '300ml',
                              'oldPrice': '₹458',
                              'price': '₹229',
                            },
                            {
                              'title': 'Paneer Lababdar',
                              'subtitle': '300ml',
                              'oldPrice': '₹398',
                              'price': '₹199',
                            },
                            {
                              'title': 'Veg Thali With Dal Makhni',
                              'oldPrice': '₹478',
                              'price': '₹239',
                            },
                          ];
                          final item = items[index];
                          return _cartItem(
                            title: item['title']!,
                            subtitle: item['subtitle'],
                            oldPrice: item['oldPrice']!,
                            price: item['price']!,
                          );
                        },
                      ),),
                    ),
                    _offersCard(),
                     SizedBox(height: 15.sp),
                    _deliveryInfoCard(),
                    SizedBox(height: 15.sp),
                    _totalBillCard(),
                    SizedBox(height: 15.sp),
                    _cancellationPolicy(),
                    SizedBox(height: 20.sp),
                    bottomBar(),
                    SizedBox(height: 40.sp),
                  ],
                ),
              ),
            ),
          ),),)

    );

  }
  /// Cart Item Row
  Widget _cartItem({
    required String title,
    String? subtitle,
    required String oldPrice,
    required String price,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Icon(Icons.crop_square, color: buttonColor, size: 15.sp),
         SizedBox(width: 8.sp),
        /// Item Info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'GeneralSans-Semibold',
                    color: textColor),
              ),
              if (subtitle != null) ...[
                SizedBox(height: 5.sp),
                Text(subtitle, style: TextStyle(
                    fontSize: 13.sp,
                    fontFamily: 'GeneralSans-Medium',
                    color: textColorSecond),),
              ],
            ],
          ),
        ),
        /// Quantity + Price
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
             SizedBox(height: 8),
            Row(
              children: [
                Text(
                  oldPrice,
                  style:  TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey,
                    fontFamily: 'GeneralSans-Medium',
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                SizedBox(width: 10.sp),
                Text(
                  price,
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: 'GeneralSans-Semibold',
                      color: textColor),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
  Widget _card({required Widget child}) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.sp)),
        elevation: 2,
        child:  Container(
          padding:  EdgeInsets.all(12.sp),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.sp),
          ),
          child: child,
        ));
  }

  Widget _deliveryInfoCard() {
    return _card(
      child: Column(
        children: [
          _iconRow(
            Icons.timer,
            'Delivery in 30–35 mins',
            'Want this later? Schedule it',
          ),
          Divider(height: 20.sp),

          /*_iconRow(
            Icons.location_on,
            'Delivery at Home',
            'Flat No 103 Nirala Aspire, Tower A6',
          ),
           Divider(height: 20.sp),
          */

          _iconRow(
            Icons.call,
            'Neeraj Singh',
            '+91-9599230702',
          ),
        ],
      ),
    );
  }

  Widget _offersCard() {
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _successRow(
            title: 'FLAT 50% OFF applied!',
            value: '- ₹667',
          ),
          Divider(height: 20.sp),

          _infoRow(
            title: 'You saved ₹36 on online payment',
            subtitle: 'Auto-applied on your order',
          ),
           Divider(height: 20.sp),

          _arrowRow('View all coupons'),
        ],
      ),
    );
  }
  Widget _successRow({required String title, required String value}) {
    return Row(
      children: [
         Icon(Icons.check_circle, color: buttonColor),
         SizedBox(width: 12.sp),
        Expanded(child: Text(title,style: TextStyle(
            fontSize: 14.sp,
            fontFamily: 'GeneralSans-Medium',
            color: textColor),),),
        Text(value,
            style:  TextStyle(
                fontSize: 14.sp,
                fontFamily: 'GeneralSans-Semibold',
                color: Colors.blue)),
      ],
    );
  }

  Widget _infoRow({required String title, required String subtitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children:  [
            Icon(Icons.check_circle, color: buttonColor),
            SizedBox(width: 10.sp),
            Text('You saved ₹36 on delivery',style: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'GeneralSans-Medium',
                color: textColor),),
          ],
        ),
         Padding(
          padding: EdgeInsets.only(left: 22.sp),
          child: Text('Auto-applied on your order',
              style:  TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'GeneralSans-Medium',
                  color: Colors.blue)),
        )
      ],
    );
  }

  Widget _arrowRow(String title) {
    return Row(
      children: [
        const Icon(Icons.local_offer),
        SizedBox(width: 12.sp),
        Expanded(child: Text(title,style: TextStyle(
            fontSize: 14.sp,
            fontFamily: 'GeneralSans-Medium',
            color: textColor),)),
        const Icon(Icons.arrow_forward_ios, size: 16),
      ],
    );
  }

  Widget _iconRow(IconData icon, String title, String subtitle) {
    return Row(
      children: [
        Icon(icon),
         SizedBox(width: 12.sp),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'GeneralSans-Semibold',
                  color: textColor)),
              Text(subtitle, style: TextStyle(
                  fontSize: 13.sp,
                  fontFamily: 'GeneralSans-Medium',
                  color: textColorSecond)),
            ],
          ),
        ),
        const Icon(Icons.arrow_forward_ios, size: 16),
      ],
    );
  }
  Widget _totalBillCard() {
    return _card(
      child: Row(
        children: [
          const Icon(Icons.receipt_long),
           SizedBox(width: 12.sp),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
                  'Total Bill ₹763.10',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'GeneralSans-Semibold',
                      color: textColor)
                ),
                SizedBox(height: 4),
                Text('Incl. taxes and charges',
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontFamily: 'GeneralSans-Medium',
                        color: textColorSecond)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child:  Text('You saved ₹703',
                style: TextStyle(fontSize: 14.sp,
                  color: Colors.blue, fontFamily: 'GeneralSans-Medium',)),
          ),
          const Icon(Icons.arrow_forward_ios, size: 14),
        ],
      ),
    );
  }
  Widget _cancellationPolicy() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Text('CANCELLATION POLICY',
              style: TextStyle(
                  fontFamily: 'GeneralSans-Medium',
                  color: Colors.grey,
                  letterSpacing: 1,
                  fontSize: 14.sp)),
          SizedBox(height: 10.sp),
          Text(
            'Help us reduce food waste by avoiding cancellations after placing your order. '
                'A 100% cancellation fee will be applied.',
            style: TextStyle(fontSize: 13.sp,color: Colors.grey,fontFamily: 'GeneralSans-Medium'),
          )
        ],
      ),
    );
  }

  Widget bottomBar() {
    return Container(
      padding: EdgeInsets.all(15.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 10),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('PAY USING',
                    style: TextStyle(fontFamily: 'GeneralSans-Medium',color: textColorSecond, fontSize: 14.sp)),
                SizedBox(height: 4),
                Text('Google Pay UPI',
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'GeneralSans-Semibold',
                      color: textColor),),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              ChoosePaymentMethod().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Scale);
            },
            child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 14.sp),
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
                '₹763.10  Place Order',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'GeneralSans-Semibold',
                    color: Colors.white)
            ),
          ),)
        ],
      ),
    );
  }

}

