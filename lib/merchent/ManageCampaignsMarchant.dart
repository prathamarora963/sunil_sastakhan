
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../globalwidgets/base_scaffold_body.dart';
import '../utils/color.dart';
import '../utils/colornotifire.dart';
import 'AddCampaignMerchent.dart';
class ManageCampaignsMarchant extends StatefulWidget {
  const ManageCampaignsMarchant({Key? key}) : super(key: key);

  @override
  _ManageCampaignsMarchantState createState() => _ManageCampaignsMarchantState();
}

class _ManageCampaignsMarchantState extends State<ManageCampaignsMarchant> {

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
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
        backgroundColor: notifire.backgrounde,
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.sp),
          ),
          onPressed: () {
            AddCampaignMerchent().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Scale);
          },
          icon: Icon(Icons.add, color: Colors.white),
          label: Text(
            'Add Campaign',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'GeneralSans-Semibold',
                color: white),
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
                          "Manage Campaigns",
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontFamily: 'GeneralSans-Bold',
                              color: notifire.gettextcolor),
                        ),),
                    ]),
                    SizedBox(height:15.sp),
                    /* SizedBox(
                      width: double.infinity,
                      height: 28.sp,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor,
                          padding:  EdgeInsets.symmetric(vertical: 14.sp),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.sp),
                          ),
                        ),
                        icon: const Icon(Icons.add, color: Colors.white),
                        label: Text(
                          'Add New Item',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'GeneralSans-Semibold',
                              color: white),
                        ),
                        onPressed: () {
                          CreateItems().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Scale);
                        },
                      ),
                    ),
                    SizedBox(height:15.sp),*/
                    Container(
                      padding:  EdgeInsets.symmetric(
                        horizontal: 0.sp,
                        vertical: 0.sp,
                      ),
                      child: Text(
                        "Active Campaigns",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: 'GeneralSans-Semibold',
                            color: textColor),
                      ),
                    ),
                    SizedBox(height:10.sp),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.all(0),
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
                        );
                      },
                    ),



                    SizedBox(height: 40.sp),
                  ],
                ),
              ),
            ),
          ),),)

    );

  }

  Widget offerCard({
    required String image,
    required String title,
    required String subtitle,
    required String dateRange,
    required String price,
    required bool isActive,
    required bool isEnabled,
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
                        color: isActive
                            ? Colors.blue
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20.sp),
                      ),
                      child:  Text(
                        isActive ? 'Active' : 'Inactive',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'GeneralSans-Medium',
                          color: isActive ? Colors.white : Colors.grey,),
                      ),

                    ),
                  ],
                ),

                Divider(height: 18.sp,),
                /// Actions
                Row(
                  children: [
                    OutlinedButton.icon(
                      onPressed: () {
                        // ViewItem().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Scale);
                      },
                      icon:  Icon(Icons.edit, color: buttonboldColor),
                      label: Text(
                        "Edit",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'GeneralSans-Medium',
                            color: buttonboldColor),
                      ),

                      style: OutlinedButton.styleFrom(
                        side:  BorderSide(color: buttonboldColor),
                        padding:  EdgeInsets.symmetric(vertical: 6.sp,horizontal: 18.sp),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                      ),
                    ),
                    SizedBox(width: 15.sp),
                    ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding:  EdgeInsets.symmetric(vertical: 6.sp,horizontal: 18.sp),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                      ),
                      icon:  Icon(Icons.delete,color: Colors.white),
                      label:  Text(
                        "Delete",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'GeneralSans-Medium',
                            color: Colors.white),
                      ),
                    ),
                    const Spacer(),
                    Switch(
                      value: isEnabled,
                      activeColor: Colors.white,
                      activeTrackColor: Colors.green,
                      onChanged: (v) => setState(() => isEnabled = v),
                    ),
                    SizedBox(width: 10.sp),
                    Text(
                      "Enable",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'GeneralSans-Medium',
                          color: textColorSecond),
                    ),

                  ],
                ),
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