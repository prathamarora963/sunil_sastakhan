
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart' hide whiteColor;
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../globalwidgets/base_scaffold_body.dart';
import '../utils/color.dart';
import '../utils/color.dart' as MyColors;
import '../utils/colornotifire.dart';
import 'ViewItem.dart';

class MarchentOrderPaymentList extends StatefulWidget {
  const MarchentOrderPaymentList({Key? key}) : super(key: key);

  @override
  _MarchentOrderPaymentListState createState() => _MarchentOrderPaymentListState();
}

class _MarchentOrderPaymentListState extends State<MarchentOrderPaymentList> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ColorNotifire notifire;
  bool status = false;
  final number = TextEditingController();
  String? dropdownValue = "";
  final List<Map<String, dynamic>> items = [
    {
      "name": "Breakfast Combo",
      "status": "Active",
      "img": "images/logo.png",
      "desc": "A delightful mix of pastries, fruits, and juice.",
      "available": 5,
      "price": 120.00,
      "statusColor": Colors.orange,
    },
    {
      "name": "Lunch Special",
      "status": "Sold Out",
      "img": "images/logo.png",
      "desc": "Hearty Indian thali with rice, dal, sabzi, and roti.",
      "available": 0,
      "price": 180.50,
      "statusColor": Colors.red,
    },
    {
      "name": "Evening Snacks",
      "status": "Draft",
      "img": "images/logo.png",
      "desc": "Assortment of pakoras, samosas, and chai.",
      "available": 10,
      "price": 80.00,
      "statusColor": Colors.grey,
    },
    {
      "name": "Dinner Delight",
      "status": "Active",
      "img": "images/logo.png",
      "desc": "Generous portion of biryani with raita and salad.",
      "available": 3,
      "price": 250.00,
      "statusColor": Colors.orange,
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }
  void _handleTabSelection() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
        backgroundColor: notifire.backgrounde,
        body: Body(child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
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
                      "Orders Payment",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: 'GeneralSans-Bold',
                          color: notifire.gettextcolor),
                    ),),
                ]),
                SizedBox(height:15.sp),
                /// TABS
                TabBar(
                  controller: _tabController,
                  indicatorColor: buttonColor,
                  labelColor: buttonColor,
                  unselectedLabelColor: textColor,
                  tabs:  [
                    Text(
                        "Pending",
                        style: TextStyle(
                            fontSize: 17.sp,
                            fontFamily: 'GeneralSans-Semibold',
                            color: _tabController.index == 0
                                ? buttonColor
                                : textColor)

                    ),
                    Text(
                      "Completed",
                      style: TextStyle(
                          fontSize: 17.sp,
                          fontFamily: 'GeneralSans-Semibold',
                          color: _tabController.index == 1
                              ? buttonColor
                              : textColor),
                    ),
                  ],
                ),
                /// TAB CONTENT
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _MarchentOrderPaymentList(isActive: true),
                      _MarchentOrderPaymentList(isActive: false),
                    ],
                  ),
                ),

                SizedBox(height: 10.sp),
              ],
            )),)

    );

  }

  /// ================= ORDER LIST =================
  Widget _MarchentOrderPaymentList({required bool isActive}) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(15.sp),
      itemCount: items?.length,
      itemBuilder: (context, index) {
        // return propertyListItem(propertyList![index]);
        final item = items[index];
        return _orderCard(
            name: "Aarav Sharma",
            orderId: "SKM-ORD-78901",
            product: "1 x Fresh Delight Bread",
            image: "https://picsum.photos/200",
            accepted: true,
            isActive: isActive
        );
      },
    );
  }

  /// ================= ORDER CARD =================
  Widget _orderCard({
    required String name,
    required String orderId,
    required String product,
    required String image,
    required bool accepted,
    required bool isActive
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.sp),
      padding:  EdgeInsets.all(15.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.sp),
        border: Border.all(color: borderColorvalue),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// USER HEADER
          Row(
            children: [
              _buildProfileImage("https://picsum.photos/200"),
              SizedBox(width: 10.sp),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'GeneralSans-Semibold',
                        color: notifire.gettextcolor),
                  ),
                  Text(
                    "Order ID: $orderId",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'GeneralSans-Medium',
                        color: textColorSecond),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 15.sp),

          /// PRODUCT ROW
          Row( crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    bottom: 0, top: 0.sp, left: 0.sp, right: 0),
                child:Card( color: whiteColor,
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
                          imageUrl: image??'',
                          placeholder: (context, url) => Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/logo.png"),
                                  fit: BoxFit.fill,
                                )),),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),)

                  ),),),
              SizedBox(width: 10.sp),
              Expanded(
                child: Container(margin: EdgeInsets.only(top: 12.sp, bottom: 0, left: 0.sp, right: 0.sp),
                    child: Text(
                      product,
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: 'GeneralSans-Semibold',
                          color: textColorSecond),
                    )),

              ),
            ],
          ),

          SizedBox(height: 14.sp),

          /// PICKUP TIME
          Row(
            children:  [
              Icon(Icons.access_time, size: 17.sp, color: iconColor),
              SizedBox(width: 10.sp),
              Container(margin: EdgeInsets.only(top: 0.sp, bottom: 0, left: 0.sp, right: 0.sp),
                child: Text(
                  "Pickup: Today, 3:00 PM - 3:30 PM",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'GeneralSans-Medium',
                      color: textColorSecond),
                ),),
            ],
          ),
          SizedBox(height: 10.sp),

          /// CONTACT
          Row(
            children:  [
              Icon(Icons.call, size: 17.sp, color: iconColor),
              SizedBox(width: 10.sp),
              Container(margin: EdgeInsets.only(top: 0.sp, bottom: 0, left: 0.sp, right: 0.sp),
                child: Text(
                  "Contact No - 9999999999",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'GeneralSans-Medium',
                      color: textColorSecond),
                ),),
            ],
          ),
          SizedBox(height: 10.sp),
          Row(
            children:  [
              Icon(Icons.check_circle_outline_sharp, size: 17.sp, color: iconColor),
              SizedBox(width: 10.sp),
              Container(margin: EdgeInsets.only(top: 0.sp, bottom: 0, left: 0.sp, right: 0.sp),
                child: Text(
                  "Order Status - ",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'GeneralSans-Medium',
                      color: textColorSecond),
                ),),
              Container(margin: EdgeInsets.only(top: 0.sp, bottom: 0, left: 0.sp, right: 0.sp),
                child: Text(
                  "Completed",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'GeneralSans-Medium',
                      color: buttonColor),
                ),),
            ],
          ),
          SizedBox(height: 10.sp),
          /// ACTION BUTTONS
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: isActive? redColorvalue: buttonColor,
                  padding:  EdgeInsets.symmetric(vertical: 10.sp,horizontal: 15.sp),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                ),
                // icon:  Icon(Icons.edit,color: Colors.white),
                label:  Text(
                  isActive ? "Pending" : "Completed",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'GeneralSans-Medium',
                      color: Colors.white),
                ),
              ),
              SizedBox(width: 15.sp),
              OutlinedButton.icon(
                onPressed: () {
                  ViewItem().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Scale);
                },
                icon:  Icon(Icons.remove_red_eye_outlined, color: buttonboldColor),
                label: Text(
                  "View Item",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'GeneralSans-Medium',
                      color: buttonboldColor),
                ),

                style: OutlinedButton.styleFrom(
                  side:  BorderSide(color: buttonboldColor),
                  padding:  EdgeInsets.symmetric(vertical: 10.sp,horizontal: 15.sp),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                ),
              ),

            ],
          ),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.sp),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x14000000),
                  blurRadius: 10,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header
                InkWell(
                  borderRadius: BorderRadius.circular(18.sp),
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: Padding(
                    padding:  EdgeInsets.symmetric(
                      horizontal: 15.sp,
                      vertical: 14.sp,
                    ),
                    child: Row(
                      children: [
                         Text(
                          "Payment Details",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'GeneralSans-Semibold',
                          ),
                        ),
                        const Spacer(),
                        AnimatedRotation(
                          turns: isExpanded ? 0.5 : 0,
                          duration: const Duration(milliseconds: 250),
                          child: const Icon(Icons.keyboard_arrow_down),
                        ),
                      ],
                    ),
                  ),
                ),

                // Expandable Content
                AnimatedCrossFade(
                  duration: const Duration(milliseconds: 300),
                  crossFadeState: isExpanded
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  firstChild: Padding(
                    padding: EdgeInsets.fromLTRB(16.sp, 8.sp, 16.sp, 16.sp),
                    child: Column(
                      children: [
                        _row("Payment Status", "Awaiting"),
                        _row("Price", "₹ 250.00"),
                        _row("Tax", "₹ 23.00"),
                        _row("Discount", "₹ 25.00"),
                        _row("GST / Other Taxes", "₹ 23.00"),
                        _row("Delivery Charges", "₹ 00.00"),
                         Divider(height: 20.sp),
                        _row(
                          "Total Payable Amount",
                          "₹ 321.00",
                          isBold: true,
                        ),
                         SizedBox(height: 12.sp),
                        _row("Payment Type", "UPI"),
                        _row("Transaction ID", "UPITRXSTV4B"),
                        _row(
                          "Payment Reference Number",
                          "123485UJHGBD",
                        ),
                      ],
                    ),
                  ),
                  secondChild: const SizedBox.shrink(),
                ),

                /*ListTile(
                  title: const Text("Order Details"),
                  trailing: Icon(
                    expanded ? Icons.remove : Icons.add,
                  ),
                  onTap: () {
                    setState(() {
                      expanded = !expanded;
                    });
                  },
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: expanded
                      ? Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text("Extra order information here"),
                  )
                      : const SizedBox(),
                ),*/
              ],
            ),
          )
        ],
      ),
    );
  }
  bool isExpanded = false;
  bool expanded = false;
  // Reusable Row Widget (inside same class)
  Widget _row(String title, String value, {bool isBold = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7.sp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'GeneralSans-Medium',
                  color: textColorSecond,),
            ),
          ),
           SizedBox(width: 12.sp),
          Text(
            value,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: isBold ? 'GeneralSans-Semibold' : 'GeneralSans-Medium',
              color: textColor,),
          ),
        ],
      ),
    );
  }
  Widget _buildProfileImage(String profileimage) {
    return Container( margin: EdgeInsets.only(
        top: 0.sp,
        bottom: 0,
        left: 0.sp,
        right: 0),
      child:Stack(
        alignment: Alignment.bottomRight,
        children: [
          // Profile Image
          Container(
            margin: EdgeInsets.only(
                bottom: 0, top: 0.sp, left: 0.sp, right: 0),
            child:Card( color: whiteColor,
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
                      height:30.sp,
                      width: 30.sp,
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

              ),),),
          /*CircleAvatar(
            radius: 30.sp,
            backgroundColor: Colors.white,
            child: ClipOval(child:  CachedNetworkImage(
              // maxHeightDiskCache:100,
              // maxWidthDiskCache: 90,
              // memCacheHeight: 100,
              // memCacheWidth: 90,
              height:45.sp,
              width: 45.sp,
              fit: BoxFit.fill,
              imageUrl: "profileimage"??'',
              placeholder: (context, url) => Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/logo.png"),
                      fit: BoxFit.fill,
                    )),),
              errorWidget: (context, url, error) => Container(decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/logo.png"),
                    fit: BoxFit.fill,
                  ))),
            ),),
          ),*/
          // Camera Icon
        ],
      ),
    );
  }
}


