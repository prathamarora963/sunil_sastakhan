import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart' hide whiteColor;
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'UserBottombar.dart';
import '../../globalwidgets/base_scaffold_body.dart';
import '../../utils/color.dart';
import '../../utils/colornotifire.dart';


class Category extends StatefulWidget {
  final bool? navFlag;
  const Category({Key? key,this.navFlag}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> with SingleTickerProviderStateMixin {

  late ColorNotifire notifire;
  bool status = false;
  final number = TextEditingController();
  String? dropdownValue = "";

  @override
  void initState() {
    super.initState();
  }
  final List<Map<String, String>> categories = const [
    {
      "title": "Restaurants",
      "image":
      "http://picsum.photos/800/500",
    },
    {
      "title": "Bakery",
      "image":
      "https://images.unsplash.com/photo-1509440159596-0249088772ff",
    },
    {
      "title": "Home Chef",
      "image":
      "https://images.unsplash.com/photo-1600891964599-f61ba0e24092",
    },
  ];
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
                      "Category",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'GeneralSans-Bold',
                          color: notifire.gettextcolor),
                    ),),
                ]),
                SizedBox(height:10.sp),
                Padding(
                  padding: EdgeInsets.only(
                      left: 15.sp, right: 15.sp),
                  child: Text(
                    "Select Your Preferred Category",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily:
                        'GeneralSans-Semibold',
                        color: textColorSecond),
                  ),
                ),
                SizedBox(height:10.sp),
                Expanded(child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(15.sp),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    // return propertyListItem(propertyList![index]);
                    final item = categories[index];
                    return catItem(
                        name: item["title"]!,
                        image: item["image"]!,
                    );

                  },
                ),),

                SizedBox(height: 10.sp),
              ],
            )),)

    );

  }
  Widget catItem({required String name,required String image}){
    return InkWell(onTap: () {
      UserBottombar().launch(context, isNewTask: true, pageRouteAnimation: PageRouteAnimation.Scale);
    },
        child: Container(
      margin:  EdgeInsets.only(bottom: 16.sp),
      height: 58.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.sp),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.sp),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(0.6),
              Colors.transparent,
            ],
          ),
        ),
        padding: EdgeInsets.all(10.sp),
        alignment: Alignment.bottomCenter,
        child: Text(
          name,
          textAlign: TextAlign.center,
          style:  TextStyle(
            color: Colors.white,
            fontSize: 27.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ));
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
}

