
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../globalwidgets/base_scaffold_body.dart';
import '../utils/color.dart';
import '../utils/colornotifire.dart';
import 'ViewCart.dart';

class SuperDiscountItemDetails extends StatefulWidget {
  const SuperDiscountItemDetails({Key? key}) : super(key: key);

  @override
  _SuperDiscountItemDetailsState createState() => _SuperDiscountItemDetailsState();
}

class _SuperDiscountItemDetailsState extends State<SuperDiscountItemDetails> {
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
        /// BOTTOM ADD BUTTON
        bottomNavigationBar: Container(
          padding:  EdgeInsets.all(16.sp),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              padding:  EdgeInsets.symmetric(vertical: 15.sp),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.sp),
              ),
            ),
            onPressed: () {
              ViewCart().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Scale);
            },
            icon: const Icon(Icons.add, color: Colors.white),
            label:  Text(
              "Order Now",
              style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'GeneralSans-Medium',
                  color: Colors.white),
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
                          "Super Discount Details",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'GeneralSans-Bold',
                              color: notifire.gettextcolor),
                        ),),
                    ]),
                    SizedBox(height:15.sp),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.sp),
                      child:  Container( height: 60.sp,
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
                          imageUrl:  "https://picsum.photos/200/300",//baseUrl!+"/"+property.image! ??'',
                          placeholder: (context, url) => Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/logo.png"),
                                  fit: BoxFit.fill,
                                )),),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.sp),
                    SizedBox(
                      // height: 70,
                      child: GridView.builder(
                        padding:  EdgeInsets.symmetric(horizontal: 0.sp),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,        // 4 items in a row
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1,      // square items
                        ),
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return  ClipRRect(borderRadius: BorderRadius.circular(12.sp),
                            child:   Container( height: 60.sp,
                              margin: EdgeInsets.only(
                                  bottom: 0, top: 0, left: 0, right: 0),
                              child:CachedNetworkImage(
                                // maxHeightDiskCache:100,
                                // maxWidthDiskCache: 90,
                                // memCacheHeight: 100,
                                // memCacheWidth: 90,
                                height: 30.sp,
                                width: double.infinity,
                                fit: BoxFit.fill,
                                imageUrl:  "https://picsum.photos/200/300",//baseUrl!+"/"+propertyDetails!.image! ??'',
                                placeholder: (context, url) => Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("images/logo.png"),
                                        fit: BoxFit.fill,
                                      )),),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                              ),
                            ),);
                        },
                      ),
                    ),

                    SizedBox(height:15.sp),

                    /// Title
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                          "Zero Maida Bread",
                          style: TextStyle(
                            fontFamily:
                            'GeneralSans-Semibold',
                            color: notifire.textcolor,
                            fontSize: 20.sp,)),
                    ),
                    SizedBox(height: 15.sp),
                    /// Description
                    Text(
                        "The Health Factory Zero Maida Whole Wheat Bread is a healthy, low-fat, high-fiber option made without maida, preservatives, or palm oil.",
                        style: TextStyle(
                          fontFamily:
                          'GeneralSans-Medium',
                          color: textColorSecond,
                          fontSize: 14.sp,)),
                    SizedBox(height: 12.sp),
                    /// SUPER DISCOUNT ROW
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "Super Discount",
                            style: TextStyle(
                              fontFamily:
                              'GeneralSans-Semibold',
                              color: textColorSecond,
                              fontSize: 14.sp,)),
                        Container(
                          padding:  EdgeInsets.symmetric(
                              horizontal: 12.sp, vertical: 10.sp),
                          decoration: BoxDecoration(
                            color: buttonColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                              "Available",
                              style: TextStyle(
                                fontFamily:
                                'GeneralSans-Semibold',
                                color: Colors.white,
                                fontSize: 14.sp,)),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.sp),
                    /// Price Row
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                         Text(
                          '₹250.00',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                         SizedBox(width: 15.sp),
                         Text(
                          '₹99.50',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: buttonColor,
                          ),
                        ),
                        Spacer(),
                        Container(
                          padding:  EdgeInsets.symmetric(
                              horizontal: 14.sp, vertical: 10.sp),
                          decoration: BoxDecoration(
                            color: buttonsColororange,
                            borderRadius: BorderRadius.circular(20.sp),
                          ),
                          child:  Text(
                            'Save Rs 150.50',
                              style: TextStyle(
                                fontFamily:
                                'GeneralSans-Medium',
                                color: Colors.white,
                                fontSize: 14.sp,)
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 18.sp),

                    /// Store Card
                    _infoCard(
                      child: Row(
                        children: [
                           Icon(Icons.store,
                              color: buttonColor, size: 20.sp),
                          SizedBox(width: 12.sp),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                Text(
                                  'Green Harvest Mart',
                                    style: TextStyle(
                                      fontFamily:
                                      'GeneralSans-Semibold',
                                      color: textColor,
                                      fontSize: 15.sp,)
                                ),
                                SizedBox(height: 4),
                                Text(
                                  '123 Market Street, Delhi',
                                    style: TextStyle(
                                      fontFamily:
                                      'GeneralSans-Medium',
                                      color: textColorSecond,
                                      fontSize: 13.sp,)
                                ),
                              ],
                            ),
                          ),
                          Icon(Icons.chevron_right,
                              color: Colors.grey,size: 20.sp,),
                        ],
                      ),
                    ),
                     SizedBox(height: 15.sp),

                    /// Time & Instructions
                    _infoCard(
                      child: Column(
                        children:  [
                          Row(
                            children: [
                              Icon(Icons.access_time,
                                  color: buttonColor,size: 18.sp),
                              SizedBox(width: 12.sp),
                              Text(
                                'Today: 6:00 PM - 7:30 PM',
                                  style: TextStyle(
                                    fontFamily:
                                    'GeneralSans-Medium',
                                    color: textColor,
                                    fontSize: 14.sp,)
                              ),
                            ],
                          ),
                          SizedBox(height: 12.sp),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.location_on,
                                  color: buttonColor,size: 18.sp),
                              SizedBox(width: 12.sp),
                              Expanded(
                                child: Text(
                                  'Collect from the rear entrance, present your QR code.',
                                    style: TextStyle(
                                      fontFamily:
                                      'GeneralSans-Medium',
                                      color: textColor,
                                      fontSize: 14.sp,)
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),


                    SizedBox(height: 40.sp),
                  ],
                ),
              ),
            ),
          ),),)

    );

  }
  /// Reusable info card
  Widget _infoCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: child,
    );
  }
}

