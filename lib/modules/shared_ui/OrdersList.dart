import 'package:SastaKhana/controller/admin/track_orders_controller.dart';
import 'package:SastaKhana/data/models/admin_models/track_orders_model.dart';
import 'package:SastaKhana/utils/extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart' hide whiteColor;
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../merchent/MerchentBottombar.dart';
import '../../globalwidgets/base_scaffold_body.dart';
import '../../main.dart';
import '../../utils/color.dart';
import '../../utils/color.dart' as MyColors;
import '../../utils/colornotifire.dart';
import '../../utils/commonutills.dart';
import '../merchent/CreateItems.dart';
import 'ViewItem.dart';

class OrdersList extends StatefulWidget {
  final bool? navFlag;
  const OrdersList({Key? key, this.navFlag}) : super(key: key);

  @override
  _OrdersListState createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList>
    with SingleTickerProviderStateMixin {
  final TrackOrdersController _controller = Get.put(TrackOrdersController());

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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.backgrounde,
      body: Body(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              widget.navFlag == true ? SizedBox() : SizedBox(height: 28.sp),
              widget.navFlag == true
                  ? SizedBox()
                  : Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 0.sp,
                            bottom: 0,
                            left: 0.sp,
                            right: 0.sp,
                          ),
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            onPressed: () {
                              finish(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: textColor,
                              size: 3.h,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Orders",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontFamily: 'GeneralSans-Bold',
                              color: notifire.gettextcolor,
                            ),
                          ),
                        ),
                      ],
                    ),
              SizedBox(height: 15.sp),

              /// TABS
              TabBar(
                controller: _tabController,
                indicatorColor: buttonColor,
                labelColor: buttonColor,
                unselectedLabelColor: textColor,
                tabs: [
                  Text(
                    "Active",
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontFamily: 'GeneralSans-Semibold',
                      color: _tabController.index == 0
                          ? buttonColor
                          : textColor,
                    ),
                  ),
                  Text(
                    "Completed",
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontFamily: 'GeneralSans-Semibold',
                      color: _tabController.index == 1
                          ? buttonColor
                          : textColor,
                    ),
                  ),
                  Text(
                    "Cancelled",
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontFamily: 'GeneralSans-Semibold',
                      color: _tabController.index == 2
                          ? buttonColor
                          : textColor,
                    ),
                  ),
                ],
                onTap: (index) {
                  String orderStatus = '';
                  switch (index) {
                    case 0:
                      orderStatus = '3';
                      break;
                    case 1:
                      orderStatus = '4';
                      break;
                    case 2:
                      orderStatus = '5';
                      break;
                  }
                  _controller.filterByOrderStatus(orderStatus);
                },
              ),

              /// TAB CONTENT
              Expanded(
                child: Obx(
                  () => TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    children: [
                      _ordersList(isActive: true),
                      _ordersList(isActive: false),
                      _ordersList(isActive: false),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10.sp),
            ],
          ),
        ),
      ),
    );
  }

  /// ================= ORDER LIST =================
  Widget _ordersList({required bool isActive}) {
    final orderData=_controller.orders;
    if(orderData!=null&&orderData.isEmpty){
      return Center(
        child: Text(
          "No orders found.",
          style: TextStyle(
            fontSize: 16.sp,
            fontFamily: 'GeneralSans-Medium',
            color: textColorSecond,
          ),
        ),
      );
    }
    return ListView.builder(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(15.sp),
      itemCount: orderData.length,
      itemBuilder: (context, index) {
        // return propertyListItem(propertyList![index]);
        final item = orderData[index];
        return _orderCard(
          order: item
        );
      },
    );
  }

  /// ================= ORDER CARD =================
  Widget _orderCard({
    required TrackOrdersModel order,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.sp),
      padding: EdgeInsets.all(15.sp),
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
              _buildProfileImage(order.image.toImageUrl()),
              SizedBox(width: 10.sp),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order.customerName ?? "Customer Name",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'GeneralSans-Semibold',
                      color: notifire.gettextcolor,
                    ),
                  ),
                  Text(
                    "Order ID: ${order.uniqueOrderId ?? "SKM-ORD-78901"}",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'GeneralSans-Medium',
                      color: textColorSecond,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 15.sp),

          /// PRODUCT ROW
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                  bottom: 0,
                  top: 0.sp,
                  left: 0.sp,
                  right: 0,
                ),
                child: Card(
                  color: whiteColor,
                  elevation: 3,
                  shadowColor: darkgrey_100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 0,
                      top: 0.sp,
                      left: 0.sp,
                      right: 0,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: CachedNetworkImage(
                        maxHeightDiskCache:100,
                        maxWidthDiskCache: 90,
                        memCacheHeight: 100,
                        memCacheWidth: 90,
                        height: 35.sp,
                        width: 35.sp,
                        fit: BoxFit.fill,
                        imageUrl:  '',
                        placeholder: (context, url) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/logo.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.sp),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    top: 12.sp,
                    bottom: 0,
                    left: 0.sp,
                    right: 0.sp,
                  ),
                  child: Text(
                    order.items.first.itemsName??'',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: 'GeneralSans-Semibold',
                      color: textColorSecond,
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 14.sp),

          /// PICKUP TIME
          Row(
            children: [
              Icon(Icons.access_time, size: 17.sp, color: iconColor),
              SizedBox(width: 10.sp),
              Container(
                margin: EdgeInsets.only(
                  top: 0.sp,
                  bottom: 0,
                  left: 0.sp,
                  right: 0.sp,
                ),
                child: Text(
                  "Pickup: Today, 3:00 PM - 3:30 PM",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'GeneralSans-Medium',
                    color: textColorSecond,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.sp),

          /// CONTACT
          Row(
            children: [
              Icon(Icons.call, size: 17.sp, color: iconColor),
              SizedBox(width: 10.sp),
              Container(
                margin: EdgeInsets.only(
                  top: 0.sp,
                  bottom: 0,
                  left: 0.sp,
                  right: 0.sp,
                ),
                child: Text(
                  "Contact No - 9999999999",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'GeneralSans-Medium',
                    color: textColorSecond,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.sp),
          Row(
            children: [
              Icon(
                Icons.check_circle_outline_sharp,
                size: 17.sp,
                color: iconColor,
              ),
              SizedBox(width: 10.sp),
              Container(
                margin: EdgeInsets.only(
                  top: 0.sp,
                  bottom: 0,
                  left: 0.sp,
                  right: 0.sp,
                ),
                child: Text(
                  "Order Status - ",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'GeneralSans-Medium',
                    color: textColorSecond,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 0.sp,
                  bottom: 0,
                  left: 0.sp,
                  right: 0.sp,
                ),
                child: Text(
                  "Completed",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'GeneralSans-Medium',
                    color: buttonColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.sp),

          /// ACTION BUTTONS
          order.orderStatus == '3'
              ? Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        padding: EdgeInsets.symmetric(
                          vertical: 10.sp,
                          horizontal: 15.sp,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                      ),
                      // icon:  Icon(Icons.edit,color: Colors.white),
                      label: Text(
                        order.orderStatus == '3' ? "In-Progress" : "Accept",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'GeneralSans-Medium',
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 15.sp),
                    OutlinedButton.icon(
                      onPressed: () {},
                      // icon: const Icon(Icons.delete, color: Colors.red),
                      label: Text(
                        order.orderStatus == '3' ? "Reject" : "Rejected",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'GeneralSans-Medium',
                          color: buttonColor,
                        ),
                      ),

                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: buttonColor),
                        padding: EdgeInsets.symmetric(
                          vertical: 10.sp,
                          horizontal: 15.sp,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                      ),
                    ),
                    SizedBox(width: 15.sp),
                    OutlinedButton.icon(
                      onPressed: () {
                        ViewItem().launch(
                          context,
                          isNewTask: false,
                          pageRouteAnimation: PageRouteAnimation.Scale,
                        );
                      },
                      icon: Icon(
                        Icons.remove_red_eye_outlined,
                        color: buttonboldColor,
                      ),
                      label: Text(
                        "View",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'GeneralSans-Medium',
                          color: buttonboldColor,
                        ),
                      ),

                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: buttonboldColor),
                        padding: EdgeInsets.symmetric(
                          vertical: 10.sp,
                          horizontal: 15.sp,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                      ),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }

  Widget _buildProfileImage(String profileimage) {
    return Container(
      margin: EdgeInsets.only(top: 0.sp, bottom: 0, left: 0.sp, right: 0),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          // Profile Image
          Container(
            margin: EdgeInsets.only(bottom: 0, top: 0.sp, left: 0.sp, right: 0),
            child: Card(
              color: whiteColor,
              elevation: 3,
              shadowColor: darkgrey_100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(100.0)),
              ),
              child: Container(
                margin: EdgeInsets.only(
                  bottom: 0,
                  top: 0.sp,
                  left: 0.sp,
                  right: 0,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: CachedNetworkImage(
                    // maxHeightDiskCache:100,
                    // maxWidthDiskCache: 90,
                    // memCacheHeight: 100,
                    // memCacheWidth: 90,
                    height: 30.sp,
                    width: 30.sp,
                    fit: BoxFit.fill,
                    imageUrl: profileimage ?? '',
                    placeholder: (context, url) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/profile.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
            ),
          ),
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
