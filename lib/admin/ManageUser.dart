
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart' hide whiteColor;
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../globalwidgets/base_scaffold_body.dart';
import '../utils/color.dart';
import '../utils/color.dart' as MyColors;
import '../utils/colornotifire.dart';
import 'CustomerDetails.dart';

class ManageUser extends StatefulWidget {
  const ManageUser({Key? key}) : super(key: key);

  @override
  _ManageUserState createState() => _ManageUserState();
}

class _ManageUserState extends State<ManageUser> with SingleTickerProviderStateMixin {
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
                      "Manage User",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'GeneralSans-Bold',
                          color: notifire.gettextcolor),
                    ),),
                ]),
                SizedBox(height:10.sp),
                _buildSearchBar(),
                SizedBox(height:10.sp),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    // physics: NeverScrollableScrollPhysics(),
                    // shrinkWrap: true,
                    padding: EdgeInsets.all(15.sp),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      // return propertyListItem(propertyList![index]);
                      final offer = items[index];
                      return _merchantCard(
                        name: "Rahul Mehta",
                        email: "myrahulmehta@gmail.com",
                        phone: "+91-9000009999",
                        shop: "The Daily Bread Bakery",
                        address: "Shop No. 7, Sector 18, Chandigarh",
                        image: "https://randomuser.me/api/portraits/men/32.jpg",
                      );
                    },
                  )
                ),

                SizedBox(height: 10.sp),
              ],
            )),)

    );

  }

  Widget _merchantCard({
    required String name,
    required String email,
    required String phone,
    required String shop,
    required String address,
    required String image,
  }) {
    return Card( margin:  EdgeInsets.only(bottom: 15.sp),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.sp),
      ),
      elevation: 3,
      child: Container(
        padding:  EdgeInsets.all(14.sp),
        child: Column(
          children: [
            InkWell(onTap: () {
              CustomerDetails().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Scale);
            },
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        bottom: 0, top: 0.sp, left: 0.sp, right: 0),
                    child:Card( color: whiteColor,
                      elevation: 3,
                      shadowColor:darkgrey_100,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius
                              .circular(10.0))),
                      child:   Container(
                          margin: EdgeInsets.only(
                              bottom: 0, top: 0.sp, left: 0.sp, right: 0),
                          child:ClipRRect(borderRadius: BorderRadius.circular(10.0),
                            child: CachedNetworkImage(
                              // maxHeightDiskCache:100,
                              // maxWidthDiskCache: 90,
                              // memCacheHeight: 100,
                              // memCacheWidth: 90,
                              height:40.sp,
                              width: 40.sp,
                              fit: BoxFit.fill,
                              imageUrl: image??'',
                              placeholder: (context, url) => Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("images/profile.png"),
                                      fit: BoxFit.fill,
                                    )),),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),)

                      ),),),
                  SizedBox(width: 12.sp),
                  Expanded(
                    child: Column(
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
                          email,
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: 'GeneralSans-Medium',
                              color: textColorSecond),
                        ),
                        SizedBox(height: 10.sp),
                        Row(children: [
                          CircleAvatar(
                            radius: 16.sp,
                            backgroundColor: Colors.blue.shade50,
                            child: Icon(
                              Icons.call,
                              size: 16.sp,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(width: 10.sp),
                          Text(
                            phone,
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: 'GeneralSans-Medium',
                                color: textColorSecond),
                          ),
                          SizedBox(width: 10.sp),
                          CircleAvatar(
                            radius: 16.sp,
                            backgroundColor: Colors.blue.shade50,
                            child: Icon(
                              Icons.message,
                              size: 16.sp,
                              color: Colors.blue,
                            ),
                          ),
                        ],)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),);
  }
  // ===================== Search =====================
  Widget _buildSearchBar() {
    return Card( margin:  EdgeInsets.only(bottom: 0.sp, left: 15.sp,right: 15.sp,top: 10.sp),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.sp),
        ),
        elevation: 3,
        child:Padding(
          padding:  EdgeInsets.symmetric(horizontal: 0.sp),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              suffixIcon: const Icon(Icons.close),
              hintText: "Search with Merchant or Shop name",
              filled: true,
              fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.sp),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        )
    );
  }
}


