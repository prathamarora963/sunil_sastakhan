import 'package:SastaKhana/controller/admin/supports_center_controller.dart';
import 'package:SastaKhana/utils/color.dart';
import 'package:SastaKhana/utils/extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart' hide whiteColor;
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../data/models/admin_models/support_model.dart';
import '../../globalwidgets/base_scaffold_body.dart';
import '../../utils/colornotifire.dart';

class SupportCenter extends StatefulWidget {
  final bool? navFlag;
  const SupportCenter({Key? key, this.navFlag}) : super(key: key);

  @override
  _SupportCenterState createState() => _SupportCenterState();
}

class _SupportCenterState extends State<SupportCenter>
    with SingleTickerProviderStateMixin {
  final _SupportCenter = Get.put(SupportsCenterController());
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
    _tabController = TabController(length: 2, vsync: this);
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
                            "Support Center",
                            style: TextStyle(
                              fontSize: 16.sp,
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
                    "Customer",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'GeneralSans-Semibold',
                      color: _tabController.index == 0
                          ? buttonColor
                          : textColor,
                    ),
                  ),
                  Text(
                    "Merchant",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'GeneralSans-Semibold',
                      color: _tabController.index == 1
                          ? buttonColor
                          : textColor,
                    ),
                  ),
                ],
                onTap: (index){

                  _SupportCenter.filterByUserType(index == 0 ? "1" : "2");
                },
              ),

              /// TAB CONTENT
              Expanded(
                child: Obx(
                  () => TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    children: [
                      _userSupportCenter(isActive: true),
                           _userSupportCenter(isActive: true),
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

  /// ================= user LIST =================
  Widget _userSupportCenter({required bool isActive}) {
    final supportData=_SupportCenter.supports;
    if(supportData.isEmpty){
      return Center(
        child: Text(
          "No support requests found.",
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
      itemCount: supportData.length,
      itemBuilder: (context, index) {
        // return propertyListItem(propertyList![index]);
        final item = supportData[index];
        return userCard(
          support: item,
          isActive: isActive,
        );
      },
    );
  }

  // Widget _merchantSupportCenter({required bool isActive}) {
  //   return ListView.builder(
  //     scrollDirection: Axis.vertical,
  //     padding: EdgeInsets.all(15.sp),
  //     itemCount: items?.length,
  //     itemBuilder: (context, index) {
  //       // return propertyListItem(propertyList![index]);
  //       final item = items[index];
  //       return merchantCard(
  //         name: "Aarav Sharma",
  //         orderId: "SKM-ORD-78901",
  //         product: "1 x Fresh Delight Bread",
  //         image: "https://picsum.photos/200",
  //         accepted: true,
  //         isActive: isActive,
  //       );
  //     },
  //   );
  // }

  /// ================= user CARD =================
  Widget userCard({
    required SupportModel support,
    required bool isActive,
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
             support.agent=='1'? _buildProfileImage(support.image.toImageUrl()):
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
                        // maxHeightDiskCache:100,
                        // maxWidthDiskCache: 90,
                        // memCacheHeight: 100,
                        // memCacheWidth: 90,
                        height: 35.sp,
                        width: 35.sp,
                        fit: BoxFit.fill,
                        imageUrl: support.image.toImageUrl() ,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    support.fName ?? "Unknown",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'GeneralSans-Semibold',
                      color: notifire.gettextcolor,
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  Row(
                    children: [
                      Icon(Icons.support_sharp, size: 17.sp, color: iconColor),
                      SizedBox(width: 10.sp),
                      Container(
                        margin: EdgeInsets.only(
                          top: 0.sp,
                          bottom: 0,
                          left: 0.sp,
                          right: 0.sp,
                        ),
                        child: Text(
                          "Support ID: N/A",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'GeneralSans-Medium',
                            color: textColorSecond,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 7.sp),
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
                          support.mobile ?? "N/A",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'GeneralSans-Medium',
                            color: textColorSecond,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 7.sp),
                  Row(
                    children: [
                      Icon(
                        Icons.mail_outline_sharp,
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
                          support.email ?? "N/A",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'GeneralSans-Medium',
                            color: textColorSecond,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.sp),
          Row(
            children: [
              Icon(Icons.message, size: 17.sp, color: iconColor),
              SizedBox(width: 10.sp),
              Container(
                margin: EdgeInsets.only(
                  top: 0.sp,
                  bottom: 0,
                  left: 0.sp,
                  right: 0.sp,
                ),
                child: Text(
                  support.message ?? "N/A",
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Status:",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'GeneralSans-Medium',
                  color: textColorSecond,
                ),
              ),
              SizedBox(width: 10.sp),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.sp,
                  vertical: 8.sp,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20.sp),
                ),
                child: Text(
                 support.status=="0"? 'Pending':'Resolved',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'GeneralSans-Medium',
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15.sp),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton.icon(
                onPressed: () {
                  // ViewItem().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Scale);
                },
                icon: Icon(Icons.call, color: buttonboldColor),
                label: Text(
                  "Call",
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
              SizedBox(width: 15.sp),
              OutlinedButton.icon(
                onPressed: () {
                  // ViewItem().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Scale);
                },
                icon: Icon(Icons.message_sharp, color: buttonboldColor),
                label: Text(
                  "Message",
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
              SizedBox(width: 15.sp),
              OutlinedButton.icon(
                onPressed: () {
                  // ViewItem().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Scale);
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
          ),
        ],
      ),
    );
  }

  Widget merchantCard({
    required String name,
    required String orderId,
    required String product,
    required String image,
    required bool accepted,
    required bool isActive,
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
                        // maxHeightDiskCache:100,
                        // maxWidthDiskCache: 90,
                        // memCacheHeight: 100,
                        // memCacheWidth: 90,
                        height: 35.sp,
                        width: 35.sp,
                        fit: BoxFit.fill,
                        imageUrl: image ?? '',
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 12.sp,
                        bottom: 0,
                        left: 0.sp,
                        right: 0.sp,
                      ),
                      child: Text(
                        product,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: 'GeneralSans-Semibold',
                          color: textColorSecond,
                        ),
                      ),
                    ),
                    SizedBox(height: 7.sp),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 17.sp,
                          color: iconColor,
                        ),
                        SizedBox(width: 8.sp),
                        Container(
                          margin: EdgeInsets.only(
                            top: 0.sp,
                            bottom: 0,
                            left: 0.sp,
                            right: 0.sp,
                          ),
                          child: Text(
                            "Noida sector 5",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'GeneralSans-Medium',
                              color: textColorSecond,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 7.sp),
                    Row(
                      children: [
                        Icon(Icons.call, size: 17.sp, color: iconColor),
                        SizedBox(width: 8.sp),
                        Container(
                          margin: EdgeInsets.only(
                            top: 0.sp,
                            bottom: 0,
                            left: 0.sp,
                            right: 0.sp,
                          ),
                          child: Text(
                            "9999999999",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'GeneralSans-Medium',
                              color: textColorSecond,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.sp),
          Row(
            children: [
              Icon(Icons.message, size: 17.sp, color: iconColor),
              SizedBox(width: 10.sp),
              Container(
                margin: EdgeInsets.only(
                  top: 0.sp,
                  bottom: 0,
                  left: 0.sp,
                  right: 0.sp,
                ),
                child: Text(
                  "My app is not working",
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Status:",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'GeneralSans-Medium',
                  color: textColorSecond,
                ),
              ),
              SizedBox(width: 10.sp),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.sp,
                  vertical: 8.sp,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20.sp),
                ),
                child: Text(
                  'Pending',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'GeneralSans-Medium',
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15.sp),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton.icon(
                onPressed: () {
                  // ViewItem().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Scale);
                },
                icon: Icon(Icons.call, color: buttonboldColor),
                label: Text(
                  "Call",
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
              SizedBox(width: 15.sp),
              OutlinedButton.icon(
                onPressed: () {
                  // ViewItem().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Scale);
                },
                icon: Icon(Icons.message_sharp, color: buttonboldColor),
                label: Text(
                  "Message",
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
              SizedBox(width: 15.sp),
              OutlinedButton.icon(
                onPressed: () {
                  // ViewItem().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Scale);
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
          ),
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
                    height: 35.sp,
                    width: 35.sp,
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
