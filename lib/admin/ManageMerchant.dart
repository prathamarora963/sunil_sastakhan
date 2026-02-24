
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart' hide whiteColor;
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../globalwidgets/base_scaffold_body.dart';
import '../utils/color.dart';
import '../utils/colornotifire.dart';
import 'CustomerDetails.dart';
import 'MerchantDetails.dart';

class ManageMerchant extends StatefulWidget {
  final bool? navFlag;
  const ManageMerchant({Key? key,this.navFlag}) : super(key: key);
  @override
  _ManageMerchantState createState() => _ManageMerchantState();
}

class _ManageMerchantState extends State<ManageMerchant> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final tabs = [
    "New",
    "Verified",
    "Partial Verified",
    "Rejected",
  ];
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
  int currentTabIndex=0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }
  void _handleTabSelection() {
    if (!_tabController.indexIsChanging) {
      setState(() {}); // refresh UI
    }
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
                      "Manage Merchant",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'GeneralSans-Bold',
                          color: notifire.gettextcolor),
                    ),),
                ]),
                SizedBox(height:15.sp),

                /// TABS
                _buildTabs(),
                SizedBox(height:10.sp),
                _buildSearchBar(),
                SizedBox(height:10.sp),
                /// TAB CONTENT
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: List.generate(
                      tabs.length,
                          (index) => _buildListView(),
                    ),
                  ),
                ),


                SizedBox(height: 10.sp),
              ],
            )),)

    );

  }
  // ===================== Tabs =====================
  Widget _buildTabs() {
    return TabBar(
      controller: _tabController,
      isScrollable: true,
      indicatorColor: Colors.transparent,
      labelPadding: EdgeInsets.symmetric(horizontal: 8.sp),
      tabs: [
        _tab("New", darkcardColor,0),
        _tab("Verified", buttonColor,1),
        _tab("Partial Verified", buttonsColororange,2),
        _tab("Rejected", redColorvalue,3),
      ],
    );
  }
  Tab _tab(String title, Color color, int index) {
    final bool isSelected = _tabController.index == index;
     currentTabIndex = _tabController.index;
    return Tab(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 8.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.sp),
          border: Border.all(color: color),
          color: color
        ),
        child: Row(children: [
          if (isSelected) ...[
            const SizedBox(width: 6),
            Icon(Icons.check_circle_outline_sharp, size: 16.sp, color: Colors.white),
          ],
          SizedBox(width:8.sp),
          Text(
              title,
              style: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: 'GeneralSans-Semibold',
                  color: Colors.white
                /*color: _tabController.index == 0
                    ? buttonColor
                    : textColor*/
              )
          )
        ],),
      ),
    );
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
  // ===================== List =====================
  Widget _buildListView() {
    return ListView.builder(
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
    );
  }
  Color getTabColor(){
    if(currentTabIndex==1){
      return buttonColor;
    }else if(currentTabIndex==2){
      return buttonsColororange;
    }
    else if(currentTabIndex==3){
      return redColorvalue;
    }
    return darkcardColor;
  }
  // ===================== Card =====================
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
                              fontSize: 14.sp,
                              fontFamily: 'GeneralSans-Medium',
                              color: textColorSecond),
                        ),
                        Text(
                          phone,
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'GeneralSans-Medium',
                              color: textColorSecond),
                        ),
                      ],
                    ),
                  ),
                  Column(children: [
                    Icon(Icons.check_box_outlined, size: 20.sp, color: getTabColor()),
                    Icon(Icons.chevron_right,size: 20.sp),
                  ],)
                ],
              ),
          ),
          Divider(height: 20.sp),

         InkWell(onTap: () {
           MerchantDetails().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Scale);
         },
           child:  Row(
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
                         imageUrl: 'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
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
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(
                     shop,
                     style: TextStyle(
                         fontSize: 16.sp,
                         fontFamily: 'GeneralSans-Semibold',
                         color: notifire.gettextcolor),
                   ),
                   Text(
                     "(Restaurant)",
                     style: TextStyle(
                         fontSize: 14.sp,
                         fontFamily: 'GeneralSans-Medium',
                         color: textColorSecond),
                   ),
                   Text(
                     address,
                     style: TextStyle(
                         fontSize: 14.sp,
                         fontFamily: 'GeneralSans-Medium',
                         color: textColorSecond),
                   ),
                 ],
               ),
             ),
             Icon(Icons.chevron_right,size: 20.sp,),
           ],
         ),),
          SizedBox(height: 12.sp),
          if (currentTabIndex==0) ...[
            const SizedBox(width: 6),
            Row(
              children: [
                _actionButton("Verify", buttonColor, Icons.check_circle_outline_sharp),
                SizedBox(width: 10.sp),
                Expanded(child: _actionButton(
                    "Partial Verify", Colors.orange, Icons.check),),
                SizedBox(width: 10.sp),
                _actionButton("Reject", Colors.red, Icons.close),
              ],
            ),
          ],

        ],
      ),
    ),);
  }

  // ===================== Buttons =====================
  Widget _actionButton(String title, Color color, IconData icon) {
    return Expanded(
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: Icon(icon, size: 16.sp, color: color),
        label:  Text(
          maxLines: 1,
          title,
          style: TextStyle(
              fontSize: 13.sp,
              fontFamily: 'GeneralSans-Medium',
              color: color),
        ),
        style: OutlinedButton.styleFrom(
          side:  BorderSide(color: color),
          padding:  EdgeInsets.symmetric(vertical: 10.sp,horizontal: 15.sp),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.sp),
          ),
        ),
      ),
    );
  }
}




