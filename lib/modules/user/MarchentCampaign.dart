
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart' hide whiteColor;
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../globalwidgets/base_scaffold_body.dart';
import '../../utils/color.dart';
import '../../utils/colornotifire.dart';
import 'MarchentDeatilsUser.dart';

class MarchentCampaign extends StatefulWidget {
  const MarchentCampaign({Key? key}) : super(key: key);

  @override
  _MarchentCampaignState createState() => _MarchentCampaignState();
}

class _MarchentCampaignState extends State<MarchentCampaign> {
  late ColorNotifire notifire;
  bool status = false;
  final number = TextEditingController();
  String? dropdownValue = "";
  int quantity = 2;
  @override
  void initState() {
    super.initState();

  }
  bool _isObscure = true;
  String? password;
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
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
        backgroundColor: notifire.backgrounde,
        body: Body(child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15.sp),
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
                          "Store Campaign",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'GeneralSans-Bold',
                              color: notifire.gettextcolor),
                        ),),
                    ]),
                    SizedBox(height:15.sp),
                    Padding(
                      padding: EdgeInsets.all(0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 5.sp),
                          _profileImage(),
                          SizedBox(height: 12.sp),
                          Text(
                              "The Daily Bread Bakery",
                              textAlign: TextAlign.center,
                              style:TextStyle(
                                  fontSize: 20.sp,
                                  fontFamily: 'GeneralSans-Semibold',
                                  color: textColor
                              )
                          ),
                          SizedBox(height: 10.sp),
                          _ratingSection(),
                          SizedBox(height: 8.sp),
                          _addressText(),
                          SizedBox(height: 10.sp),
                          OutlinedButton.icon(
                            onPressed: () {
                              MarchentDeatilsUser().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Scale);
                            },
                            icon:  Icon(Icons.remove_red_eye_outlined, color: buttonboldColor),
                            label: Text(
                              "View Store",
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
                    ),
                    SizedBox(height: 15.sp),
                    Text(
                        "Active Campaign",
                        textAlign: TextAlign.left,
                        style:TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'GeneralSans-Semibold',
                            color: textColor
                        )
                    ),
                    SizedBox(height: 15.sp),
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
                    SizedBox(height: 20.sp),
                  ],
                )
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
                SizedBox(height: 10.sp),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // =================== Top Image ===================
  Widget _profileImage() {
    return Container(
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
                height:50.sp,
                width: 50.sp,
                fit: BoxFit.fill,
                imageUrl: "https://images.unsplash.com/photo-1509440159596-0249088772ff"??'',
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

  // =================== Rating ===================
  Widget _ratingSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          4,
              (index) =>  Icon(Icons.star, color: buttonsColororange, size: 18.sp),
        ),
        Icon(Icons.star_border, size: 18.sp, color: buttonsColororange),
        SizedBox(width: 10.sp),
        Text(
          "4.5 (120 reviews)",
          style: TextStyle(
              fontSize: 14.sp,
              fontFamily: 'GeneralSans-Medium',
              color: textColorSecond),
        ),
      ],
    );
  }

  // =================== Address ===================
  Widget _addressText() {
    return Text(
      "Shop No. 7, Sector 18, Chandigarh",
      style: TextStyle(
          fontSize: 15.sp,
          fontFamily: 'GeneralSans-Medium',
          color: textColorSecond),
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


