
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart' hide whiteColor;
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../globalwidgets/base_scaffold_body.dart';
import '../utils/color.dart';
import '../utils/colornotifire.dart';
import 'ViewCart.dart';

class ItemsList extends StatefulWidget {
  const ItemsList({Key? key}) : super(key: key);

  @override
  _ItemsListState createState() => _ItemsListState();
}

class _ItemsListState extends State<ItemsList> {
  late ColorNotifire notifire;
  bool status = false;
  final number = TextEditingController();
  String? dropdownValue = "";
  int quantity = 0;
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
        backgroundColor: notifire.backgrounde,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.sp),
          ),
          onPressed: () {
            ViewCart().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Scale);
          },
          icon: Icon(Icons.shopping_cart, color: Colors.white),
          label: Text(
            'View Cart',
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
                          "Items",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'GeneralSans-Bold',
                              color: notifire.gettextcolor),
                        ),),
                    ]),
                    SizedBox(height:15.sp),
                    Expanded(child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.all(0),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        // return propertyListItem(propertyList![index]);
                        // final offer = offers[index];
                        return Card(
                            margin:  EdgeInsets.only(bottom: 15.sp),
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.sp),
                        ),
                        elevation: 3,
                        child:Container(
                          margin: EdgeInsets.only(top: 0.sp, bottom: 0, left: 0.sp, right: 0.sp),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.sp),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15.sp),
                                    topRight: Radius.circular(15.sp),
                                  ),
                                    child: CachedNetworkImage(
                                      // maxHeightDiskCache:100,
                                      // maxWidthDiskCache: 90,
                                      // memCacheHeight: 100,
                                      // memCacheWidth: 90,
                                      height:50.sp,
                                      width: double.infinity,
                                      fit: BoxFit.fill,
                                      imageUrl:"https://picsum.photos/300?random=${index + 5}",
                                      placeholder: (context, url) => Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage("images/logo.png"),
                                              fit: BoxFit.fill,
                                            )),),
                                      errorWidget: (context, url, error) => Icon(Icons.error),
                                    ),),
                                  Positioned(
                                    top: 8,
                                    right: 8,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.sp, vertical: 8.sp),
                                      decoration: BoxDecoration(
                                        color: buttonsColororange,
                                        borderRadius: BorderRadius.circular(15.sp),
                                      ),
                                      child:  Text(
                                        "30 %",
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            fontFamily: 'GeneralSans-Medium',
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:  [
                                    Text(
                                      "Royal Sweets Corner",
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontFamily: 'GeneralSans-Semibold',
                                          color: textColor),
                                    ),
                                    SizedBox(height: 5.sp),
                                    Text(
                                      "Traditional Mithai Box",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: 'GeneralSans-Medium',
                                          color: textColorSecond),
                                    ),
                                    SizedBox(height: 10.sp),
                                    Row(children: [
                                      Expanded(child: Row(children: [
                                        Text(
                                          "315 Rs",
                                          style: TextStyle(
                                              fontSize: 16 .sp,
                                              fontFamily: 'GeneralSans-Semibold',
                                              color: buttonColor),
                                        ),
                                        Container(margin: EdgeInsets.only(top: 0.sp, bottom: 0, left: 15.sp, right: 0.sp),
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "450 Rs",
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontFamily: 'GeneralSans-Semibold',
                                                decoration: TextDecoration.lineThrough,
                                                decorationThickness: 2,
                                                color: textColorSecond),
                                          ),),
                                      ],),),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: buttonColor,
                                          border: Border.all(color: buttonColor),
                                          borderRadius: BorderRadius.circular(10.sp),
                                        ),
                                        child: Row(
                                          children: [
                                            _qtyButton(
                                              icon: Icons.remove,
                                              onTap: () {
                                                if (quantity > 1) {
                                                  setState(() => quantity--);
                                                }
                                              },
                                            ),
                                            Padding(
                                              padding:  EdgeInsets.symmetric(horizontal: 12.sp),
                                              child: Text(
                                                  quantity.toString(),
                                                  style: TextStyle(
                                                    fontFamily:
                                                    'GeneralSans-Medium',
                                                    color: Colors.white,
                                                    fontSize: 15.sp,)),
                                            ),
                                            _qtyButton(
                                              icon: Icons.add,
                                              onTap: () {
                                                setState(() => quantity++);
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],),
                                    SizedBox(height: 10.sp),
                                    Row(
                                      children: [
                                        Icon(Icons.location_on_outlined, size: 15.sp),
                                        SizedBox(width: 8.sp),
                                        Text("1.2 km",style: TextStyle(
                                            fontSize: 14.sp,
                                            fontFamily: 'GeneralSans-Medium',
                                            color: textColorSecond),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                        );
                      },
                    ),),
                    SizedBox(height: 20.sp),
                  ],
                )
            )),)

    );

  }
  Widget _qtyButton({required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(5.sp),
        height: 20.sp,
        child: Icon(icon, size: 18.sp,color: Colors.white,),
      ),
    );
  }
}


