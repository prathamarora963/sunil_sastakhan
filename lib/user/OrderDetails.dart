
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
import '../MerchentBottombar.dart';
import '../globalwidgets/base_scaffold_body.dart';
import '../main.dart';
import '../utils/color.dart';
import '../utils/colornotifire.dart';
import '../utils/commonutills.dart';
import 'MarchentDeatilsUser.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
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
        /// Bottom Buttons
        bottomNavigationBar: Padding(
          padding:EdgeInsets.only(
            left: 25.sp, top: 10.sp,right: 25.sp,bottom: 22.sp),
          child: OutlinedButton.icon(
            onPressed: () {},
            icon:  Icon(Icons.download,color: Colors.white,size: 18.sp,),
            label:  Text('Invoice',style: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'GeneralSans-Semibold',
                color: Colors.white),),
            style: OutlinedButton.styleFrom(
              backgroundColor: buttonColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
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
                          "Order Details",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'GeneralSans-Bold',
                              color: notifire.gettextcolor),
                        ),),
                    ]),
                    /// Order Status
                    _card(
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Color(0xFFE8F5E9),
                            child: Icon(Icons.shopping_bag, color: buttonColor),
                          ),
                          SizedBox(width: 15.sp),
                          Text(
                            'Order was delivered',
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: 'GeneralSans-Semibold',
                                color: textColor),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 15.sp),
                    _card(
                      child: SizedBox( width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              width: 50.sp,
                              margin: EdgeInsets.only(
                                  bottom: 10.sp, top: 10.sp, left: 0.sp, right: 0),
                              child:ClipRRect(borderRadius: BorderRadius.circular(10.0),
                                child: CachedNetworkImage(
                                  // maxHeightDiskCache:100,
                                  // maxWidthDiskCache: 90,
                                  // memCacheHeight: 100,
                                  // memCacheWidth: 90,
                                  height:50.sp,
                                  width: 50.sp,
                                  fit: BoxFit.fill,
                                  imageUrl: 'https://api.qrserver.com/v1/create-qr-code/?size=300x300&data=ORDER_7676070862',
                                  placeholder: (context, url) => Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("images/logo.png"),
                                          fit: BoxFit.fill,
                                        )),),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),)

                          ),
                          SizedBox(width: 18.sp),
                          Text(
                            'Order ID: SK123456789',
                            style: TextStyle(
                                fontSize: 17.sp,
                                fontFamily: 'GeneralSans-Semibold',
                                color: buttonColor),
                          ),
                          Container(alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 12.sp, bottom: 0, left: 0.sp, right: 0.sp),
                              child: Text(
                                textAlign: TextAlign.center,
                                'Please present this QR code to the store staff for validation.',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'GeneralSans-Medium',
                                    color: textColorSecond),
                              )),
                        ],
                      ),)

                    ),
                    SizedBox(height: 0.sp),
                    /// Restaurant & Order
                    _card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    bottom: 0, top: 0.sp, left: 0.sp, right: 0),
                                child:Card( color: Colors.white,
                                  elevation: 3,
                                  shadowColor:darkgrey_100,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                  child:   Container(
                                      margin: EdgeInsets.only(
                                          bottom: 0, top: 0.sp, left: 0.sp, right: 0),
                                      child:ClipRRect(borderRadius: BorderRadius.circular(10.0),
                                        child: CachedNetworkImage(
                                          // maxHeightDiskCache:100,
                                          // maxWidthDiskCache: 90,
                                          // memCacheHeight: 100,
                                          // memCacheWidth: 90,
                                          height:35.sp,
                                          width: 35.sp,
                                          fit: BoxFit.fill,
                                          imageUrl: 'https://picsum.photos/200',
                                          placeholder: (context, url) => Container(
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage("images/logo.png"),
                                                  fit: BoxFit.fill,
                                                )),),
                                          errorWidget: (context, url, error) => Icon(Icons.error),
                                        ),)

                                  ),),),
                               SizedBox(width: 12.sp),
                              Expanded(
                                child: InkWell(onTap: () {
                                  MarchentDeatilsUser().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Scale);
                                },
                                    child:  Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:  [
                                        Text(
                                          "The Daily Bread Bakery",
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              fontFamily: 'GeneralSans-Semibold',
                                              color: textColor),
                                        ),
                                        SizedBox(height: 4.sp),
                                        Container(margin: EdgeInsets.only(top: 0.sp, bottom: 0, left: 0.sp, right: 0.sp),
                                            child: Text(
                                              'Amrapali Dream Valley, Greater Noida',
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontFamily: 'GeneralSans-Medium',
                                                  color: textColorSecond),
                                            )),
                                      ],
                                    ),),
                              ),

                              Icon(Icons.call, color: buttonColor,size: 20.sp,)
                            ],
                          ),
                          Divider(height: 20.sp),

                          Row(
                            children: [
                              Text(
                                'Order ID: #7676070862',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'GeneralSans-Medium',
                                    color: textColorSecond),
                              ),
                              SizedBox(width: 10.sp),
                              Icon(Icons.copy, size: 16.sp, color: Colors.grey),
                            ],
                          ),
                          SizedBox(height: 12.sp),
                          Row(
                            children:  [
                              Icon(Icons.circle, size: 10, color: Colors.green),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text('1 x Kadhai Paneer\nMaharaja (Serves 4)',
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontFamily: 'GeneralSans-Medium',
                                      color: textColor),),
                              ),
                              Text(
                                '₹480',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'GeneralSans-Semibold',
                                    color: textColor),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 15.sp),

                    /// Bill Summary
                    _card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.receipt_long),
                              SizedBox(width: 8),
                              Text(
                                'Bill Summary',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontFamily: 'GeneralSans-Semibold',
                                    color: textColor),
                              ),
                              Spacer(),
                              Icon(Icons.download, color: buttonColor),
                            ],
                          ),

                          SizedBox(height: 16),

                          _billRow('Item total', '₹480.00'),
                          _billRow('GST & restaurant packaging', '₹50.13'),
                          _billRow('Delivery partner fee', '₹11.00',
                              oldPrice: '₹46.00'),
                          _billRow('Platform fee', '₹12.50'),

                          Divider(height: 32),

                          _billRow('Grand total', '₹553.63', bold: true),
                          _billRow('Coupon applied - GET175', '-₹175.00',
                              valueColor: Colors.blue),
                          _billRow('Paid', '₹378.63', bold: true),

                          SizedBox(height: 15.sp),

                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE3F2FD),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child:  Center(
                              child: Text(
                                '🎉 You saved ₹210.00 on this order!',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                    color: Colors.blue,
                                  fontFamily: 'GeneralSans-Semibold',),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 15.sp),

                    /// Customer Info
                    _card(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:  [
                          ListTile(
                            leading: _buildProfileImage("https://picsum.photos/200"),
                            title: Text('Neeraj Singh',
                                style: TextStyle(
                              fontSize: 14.sp,
                              color: textColor,
                              fontFamily: 'GeneralSans-Semibold',)),
                            subtitle: Text('959923XXXX',
                                style:TextStyle(
                              fontSize: 13.sp,
                              color: textColorSecond,
                              fontFamily: 'GeneralSans-Medium',)),
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.payment),
                            title: Text('Payment method',style: TextStyle(
                              fontSize: 14.sp,
                              color: textColor,
                              fontFamily: 'GeneralSans-Semibold',)),
                            subtitle: Text('Paid via: UPI', style:TextStyle(
                              fontSize: 13.sp,
                              color: textColorSecond,
                              fontFamily: 'GeneralSans-Medium',)),
                          ),
                          ListTile(
                            leading: Icon(Icons.calendar_today),
                            title: Text('Payment date',style: TextStyle(
                              fontSize: 14.sp,
                              color: textColor,
                              fontFamily: 'GeneralSans-Semibold',)),
                            subtitle: Text('January 10, 2026 at 6:34 PM', style:TextStyle(
                              fontSize: 13.sp,
                              color: textColorSecond,
                              fontFamily: 'GeneralSans-Medium',)),
                          ),
                          ListTile(
                            leading: Icon(Icons.location_on),
                            title: Text('Delivery address',style: TextStyle(
                              fontSize: 14.sp,
                              color: textColor,
                              fontFamily: 'GeneralSans-Semibold',)),
                            subtitle: Text('Greater Noida, Uttar Pradesh', style:TextStyle(
                              fontSize: 13.sp,
                              color: textColorSecond,
                              fontFamily: 'GeneralSans-Medium',)),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 90),



                    SizedBox(height: 40.sp),
                  ],
                ),
              ),
            ),
          ),),)

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

  Widget _billRow(String title, String value,
      {bool bold = false, String? oldPrice, Color? valueColor}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.sp),
      child: Row(
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 13.sp,
                  fontFamily: bold ? 'GeneralSans-Semibold' : 'GeneralSans-Medium',
                  color: textColor),),
          const Spacer(),
          if (oldPrice != null)
            Text(
              oldPrice,
              style:  TextStyle(
                fontSize: 14.sp,
                fontFamily: 'GeneralSans-Medium',
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
              ),
            ),
          if (oldPrice != null)  SizedBox(width: 10.sp),
          Text(
            value,
            style: TextStyle(fontSize: 13.sp,
              fontFamily: bold ? 'GeneralSans-Semibold' : 'GeneralSans-Medium',
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildProfileImage(String profileimage) {
    return Container(
      margin: EdgeInsets.only(
          bottom: 0, top: 0.sp, left: 0.sp, right: 0),
      child:Card( color: Colors.white,
        elevation: 3,
        shadowColor:darkgrey_100,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius
                .circular(100.0))),
        child:   Container(
            margin: EdgeInsets.only(
                bottom: 0, top: 0.sp, left: 0.sp, right: 0),
            child:ClipRRect(borderRadius: BorderRadius.circular(100.0),
              child: CachedNetworkImage(
                // maxHeightDiskCache:100,
                // maxWidthDiskCache: 90,
                // memCacheHeight: 100,
                // memCacheWidth: 90,
                height:28.sp,
                width: 28.sp,
                fit: BoxFit.fill,
                imageUrl: profileimage??'',
                placeholder: (context, url) => Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/profile.png"),
                        fit: BoxFit.fill,
                      )),),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),)

        ),),);
  }
}