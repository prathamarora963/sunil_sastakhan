
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart' hide whiteColor;
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../globalwidgets/base_scaffold_body.dart';
import '../utils/color.dart';
import '../utils/colornotifire.dart';
import 'MarchentDeatilsUser.dart';
import 'OrderDetails.dart';


class UserOrders extends StatefulWidget {
  final bool? navFlag;
  const UserOrders({Key? key,this.navFlag}) : super(key: key);

  @override
  _UserOrdersState createState() => _UserOrdersState();
}

class _UserOrdersState extends State<UserOrders> with SingleTickerProviderStateMixin {
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
  @override
  void dispose() {
    feedbackController.dispose();
    super.dispose();
  }
  void _handleTabSelection() {
    setState(() {
    });
  }
  int selectedRating = 0;
  final TextEditingController feedbackController = TextEditingController();
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
                widget.navFlag==true ?SizedBox(): SizedBox(height:28.sp),
                widget.navFlag==true ? SizedBox(): Row(children: [
                  Container( margin: EdgeInsets.only(top: 0.sp, bottom: 0, left: 0.sp, right: 0.sp),
                    alignment: Alignment.topLeft,
                    child:  IconButton(onPressed: (){
                      finish(context);
                    }, icon:  Icon(Icons.arrow_back_ios_new_outlined,color: textColor,size: 3.h,)),
                  ),
                  Container(alignment: Alignment.centerLeft,
                    child: Text(
                      "your Orders",
                      style: TextStyle(
                          fontSize: 16.sp,
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
                        "Active",
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
                    Text(
                      "Cancelled",
                      style: TextStyle(
                          fontSize: 17.sp,
                          fontFamily: 'GeneralSans-Semibold',
                          color: _tabController.index == 2
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
                      _UserOrders(isActive: true),
                      _UserOrders(isActive: false),
                      _UserOrders(isActive: false),
                    ],
                  ),
                ),

                SizedBox(height: 10.sp),
              ],
            )),)

    );

  }

  /// ================= ORDER LIST =================
  Widget _UserOrders({required bool isActive}) {
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
          /// PRODUCT ROW
          InkWell(onTap: () {
            MarchentDeatilsUser().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Scale);
          },
            child: Row( crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
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
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.sp),
                      Text(
                        "The Daily Bread Bakery",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: 'GeneralSans-Semibold',
                            color: textColor),
                      ),
                      SizedBox(height: 5.sp),
                      Container(margin: EdgeInsets.only(top: 0.sp, bottom: 0, left: 0.sp, right: 0.sp),
                          child: Text(
                            product,
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'GeneralSans-Medium',
                                color: textColor),
                          )),

                    ],)


              ),
            ],
          ),),

          SizedBox(height: 14.sp),
          InkWell(onTap: () {
            OrderDetails().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Scale);
          },child: Column(children: [
            Row(
              children:  [
                Icon(Icons.receipt_long, size: 17.sp, color: iconColor),
                SizedBox(width: 10.sp),
                Container(margin: EdgeInsets.only(top: 0.sp, bottom: 0, left: 0.sp, right: 0.sp),
                  child: Text(
                    "Order ID: $orderId",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'GeneralSans-Medium',
                        color: textColorSecond),
                  ),),
              ],
            ),
            SizedBox(height: 10.sp),
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
                    "Active",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'GeneralSans-Medium',
                        color: buttonColor),
                  ),),
              ],
            ),
          ],),),
          /// Star Rating
          Row(children: [
            Expanded(child: Container(margin: EdgeInsets.only(top: 0.sp, bottom: 0, left: 0.sp, right: 0.sp),
              child: Text(
                "Rate",
                style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: 'GeneralSans-Medium',
                    color: textColorSecond),
              ),),),
            Container(
              child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  iconSize: 18.sp,
                  onPressed: () {
                    setState(() {
                      selectedRating = index + 1;
                    });
                  },
                  icon: Icon(
                    Icons.star,
                    color: index < selectedRating
                        ? buttonsColororange
                        : Colors.grey.shade300,
                  ),
                );
              }),
            ),)
          ],),
          SizedBox(height: 10.sp),
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
  /// Rating text helper
  String _ratingText(int rating) {
    switch (rating) {
      case 1:
        return 'Very Bad';
      case 2:
        return 'Bad';
      case 3:
        return 'Okay';
      case 4:
        return 'Good';
      case 5:
        return 'Excellent';
      default:
        return 'Tap a star to rate';
    }
  }
}


