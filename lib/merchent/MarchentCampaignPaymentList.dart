
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


class MarchentCampaignPaymentList extends StatefulWidget {
  const MarchentCampaignPaymentList({Key? key}) : super(key: key);

  @override
  _MarchentCampaignPaymentListState createState() => _MarchentCampaignPaymentListState();
}

class _MarchentCampaignPaymentListState extends State<MarchentCampaignPaymentList> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ColorNotifire notifire;
  bool status = false;
  final number = TextEditingController();
  String? dropdownValue = "";
  final List<Offer> offers = [
    Offer(
      image: 'https://picsum.photos/200/300/?blur',
      title: 'Flower Freshness',
      subtitle: 'Flowers & Petals',
      dateRange: 'Oct 10 - Oct 25, 2025',
      price: '₹500.00',
      isActive: true,
      isEnabled: true,
    ),
    Offer(
      image: 'https://picsum.photos/seed/picsum/200/300',
      title: 'Diwali Festive Offer',
      subtitle: 'Festive World Store',
      dateRange: 'Oct 15 - Oct 25, 2025',
      price: '₹500.00',
      isActive: true,
      isEnabled: false,
    ),
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
                      "Campaign Payment",
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
                SizedBox(height:5.sp),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _MarchentCampaignPaymentList(tabSelect: true),
                      _MarchentCampaignPaymentList(tabSelect: false),
                    ],
                  ),
                ),

                SizedBox(height: 10.sp),
              ],
            )),)

    );

  }

  /// ================= ORDER LIST =================
  Widget _MarchentCampaignPaymentList({required bool tabSelect}) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      // physics: NeverScrollableScrollPhysics(),
      // shrinkWrap: true,
      padding: EdgeInsets.all(15.sp),
      itemCount: offers.length,
      itemBuilder: (context, index) {
        // return propertyListItem(propertyList![index]);
        final offer = offers[index];
        return offerCard(
          image: offer.image,
          title: offer.title,
          subtitle: offer.subtitle,
          dateRange: offer.dateRange,
          price: offer.price,
          isActive: offer.isActive,
          isEnabled: offer.isEnabled,
          tabSelect: tabSelect
        );
      },
    );
   /* return ListView.builder(
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
    );*/
  }
  Widget offerCard({
    required String image,
    required String title,
    required String subtitle,
    required String dateRange,
    required String price,
    required bool isActive,
    required bool isEnabled,
    required bool tabSelect
  }) {
    return Card(
      margin:  EdgeInsets.only(bottom: 15.sp),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.sp),
      ),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Image
          ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(15.sp), topRight: Radius.circular(15.sp)),
            child:   Container( height: 60.sp,
              margin: EdgeInsets.only(
                  bottom: 0, top: 0, left: 0, right: 0),
              child:CachedNetworkImage(
                // maxHeightDiskCache:100,
                // maxWidthDiskCache: 90,
                // memCacheHeight: 100,
                // memCacheWidth: 90,
                height: 60.sp,
                width: double.infinity,
                fit: BoxFit.fill,
                imageUrl:  image,//baseUrl!+"/"+propertyDetails!.image! ??'',
                placeholder: (context, url) => Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/logo.png"),
                        fit: BoxFit.fill,
                      )),),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),),

          Padding(
            padding:  EdgeInsets.all(12.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// Title
                Container(
                  padding:  EdgeInsets.symmetric(
                    horizontal: 0.sp,
                    vertical: 0.sp,
                  ),
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'GeneralSans-Semibold',
                        color: textColor),
                  ),
                ),


                SizedBox(height: 5.sp),
                Text(
                  subtitle,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'GeneralSans-Medium',
                      color: textColorSecond),
                ),

                Divider(height: 18.sp,),

                /// Date & Status
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Date Range:",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'GeneralSans-Medium',
                          color: textColorSecond),
                    ),
                    Text(
                      "$dateRange'",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'GeneralSans-Medium',
                          color: textColor),
                    ),
                  ],
                ),
                SizedBox(height: 10.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Price:",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'GeneralSans-Medium',
                          color: textColorSecond),
                    ),
                    Text(
                      "$price",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'GeneralSans-Medium',
                          color: textColor),
                    ),
                  ],
                ),
                SizedBox(height: 10.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Status:",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'GeneralSans-Medium',
                          color: textColorSecond),
                    ),
                    Container(
                      padding:  EdgeInsets.symmetric(
                        horizontal: 15.sp,
                        vertical: 8.sp,
                      ),
                      decoration: BoxDecoration(
                        color: tabSelect
                            ? redColorvalue
                            : Colors.blue,
                        borderRadius: BorderRadius.circular(20.sp),
                      ),
                      child:  Text(
                        tabSelect ? 'Pending' : 'Completed',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'GeneralSans-Medium',
                          color: Colors.white),
                      ),

                    ),
                  ],
                ),
                SizedBox(height: 12.sp),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class Offer {
  final String image;
  final String title;
  final String subtitle;
  final String dateRange;
  final String price;
  final bool isActive;
  final bool isEnabled;

  Offer({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.dateRange,
    required this.price,
    required this.isActive,
    required this.isEnabled,
  });
}

