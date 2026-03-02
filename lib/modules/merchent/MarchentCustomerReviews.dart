
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart' hide whiteColor;
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../globalwidgets/base_scaffold_body.dart';
import '../../utils/color.dart';
import '../../utils/color.dart' as MyColors;
import '../../utils/colornotifire.dart';

class MarchentCustomerReviews extends StatefulWidget {
  const MarchentCustomerReviews({Key? key}) : super(key: key);

  @override
  _MarchentCustomerReviewsState createState() => _MarchentCustomerReviewsState();
}

class _MarchentCustomerReviewsState extends State<MarchentCustomerReviews> with SingleTickerProviderStateMixin {
  late ColorNotifire notifire;
  bool status = false;
  final number = TextEditingController();
  String? dropdownValue = "";
  final List<Map<String, dynamic>> reviews = [
    {
      "name": "Priya Sharma",
      "image": "https://randomuser.me/api/portraits/women/65.jpg",
      "rating": 5,
      "review":
      "Absolutely love their sourdough! Always fresh and delicious. And the initiative to reduce waste is fantastic. A must-visit for fresh bread.",
      "time": "2 days ago",
    },
    {
      "name": "Rahul Singh",
      "image": "https://randomuser.me/api/portraits/men/75.jpg",
      "rating": 4,
      "review":
      "Great pastries, especially the croissants. The staff is friendly and the aroma is inviting. A bit crowded sometimes but definitely worth the wait for quality.",
      "time": "1 week ago",
    },
    {
      "name": "Anjali Mehta",
      "image": "https://randomuser.me/api/portraits/women/44.jpg",
      "rating": 5,
      "review":
      "Found this gem through SastaKhana. The Surprise Bag was a delightful mix of breads and muffins. Will definitely come again! It's a fantastic value.",
      "time": "3 weeks ago",
    },
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
                      "Customer Reviews",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: 'GeneralSans-Bold',
                          color: notifire.gettextcolor),
                    ),),
                ]),
                SizedBox(height:10.sp),
                // Reviews List
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(
                        left: 15.sp, top: 0.sp,right: 15.sp),
                    itemCount: reviews.length,
                    itemBuilder: (context, index) {
                      final review = reviews[index];

                      return _reviewCard(
                        name: review["name"],
                        imageUrl: review["image"],
                        rating: review["rating"],
                        reviewText: review["review"],
                        time: review["time"],
                      );
                    },
                  ),
                ),

                SizedBox(height: 10.sp),
              ],
            )),)

    );

  }

  // ===== Review Card Widget =====
  Widget _reviewCard({
    required String name,
    required String imageUrl,
    required int rating,
    required String reviewText,
    required String time,
  }) {
    return Container(
      margin:  EdgeInsets.only(bottom: 16.sp),
      padding:  EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.sp),
        boxShadow:  [
          BoxShadow(
            color: BoxShadowColorValue,
            blurRadius: 10,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              _buildProfileImage(imageUrl),
               SizedBox(width: 12.sp),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontFamily:
                          'GeneralSans-Semibold',
                          color: notifire.gettextcolor),
                    ),
                     SizedBox(height: 5.sp),
                    Row(
                      children: [
                        ...List.generate(
                          5,
                              (index) => Icon(
                            index < rating
                                ? Icons.star
                                : Icons.star_border,
                            color: Colors.orange,
                            size: 18,
                          ),
                        ),
                         SizedBox(width: 8.sp),
                        Text(
                          rating.toStringAsFixed(1),
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 12.sp),

          // Review Text
          Text(
            reviewText,
            style: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'GeneralSans-Medium',
                color: textColor),
          ),
          SizedBox(height: 10.sp),
          // Time
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              time,
              style: TextStyle(
                  fontSize: 13.sp,
                  fontFamily: 'GeneralSans-Medium',
                  color: textColorSecond),
            ),
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
                      height:28.sp,
                      width: 28.sp,
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



