import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../loginsignup/login.dart';
import '../utils/globalwidgets.dart';
import 'color.dart';

class DrawerBar extends StatelessWidget {
  final  GlobalKey<ScaffoldState>? scaffoldKey;
  BuildContext? mainContext;
  var email;
  var fullname;
  var profileimage;
  DrawerBar({this.scaffoldKey,this.mainContext,this.fullname,this.email,this.profileimage});


  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: lightColor,
      width: screenWidth(context) / 1.8,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // DrawerHeader(
          //   child:SizedBox(height: 5.sp,)
          // ),
          SizedBox(
            height: 30.sp,
          ),

          Container(margin: EdgeInsets.only(
              bottom: 0.sp, top: 10.sp, left: 10.sp, right: 10.sp),
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    width: 30.sp,
                    height: 30.sp,
                    child:  CircleAvatar(
                      radius: 30.sp,
                      backgroundColor: Colors.transparent,
                      child: ClipOval(child: CachedNetworkImage(
                        // maxHeightDiskCache:100,
                        // maxWidthDiskCache: 90,
                        // memCacheHeight: 100,
                        // memCacheWidth: 90,
                        height:30.sp,
                        width: 30.sp,
                        fit: BoxFit.contain,
                        imageUrl: profileimage??'',
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
                    ),
                  ),
                  Expanded(child: Container( margin: EdgeInsets.only(
                      bottom: 0, top: 0, left: 10.sp, right: 0),
                    child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(
                              top: 0.sp,
                              bottom: 0,
                              left: 0,
                              right: 0),
                          child: Text(
                            fullname??'',
                            style: TextStyle(
                                color: textColor,
                                fontFamily: 'GeneralSans-Bold',
                                fontSize: 16.sp),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(
                              top: 10.sp,
                              bottom: 5.sp,
                              left: 0,
                              right: 0),
                          child: Text(
                            email??'',
                            style: TextStyle(
                                color: textColor,
                                fontFamily: 'GeneralSans-Medium',
                                fontSize: 14.sp),
                          ),
                        ),
                      ],),))
                ],)
          ),
          SizedBox(height: 15.sp,),
          Divider(height: 2.sp,color: darlgreyColor,),
          SizedBox(height: 15.sp,),
          ListTile(
            title: Row(children: [
              Container( margin: EdgeInsets.only(top: 0.sp, bottom: 0, left: 0.sp, right: 10.sp),
                alignment: Alignment.centerLeft,
                child:  IconButton(onPressed: (){
                  //_scaffoldKey.currentState!.openEndDrawer();
                }, icon:  Icon(Icons.bar_chart_rounded,color: darlgreyColor,size: 4.h,)),

              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 0.sp, bottom: 0, left: 0.sp, right: 0),
                child: Text(
                  "Select Industry",
                  style: TextStyle(
                      color: darlgreyColor,
                      fontFamily: 'GeneralSans-Medium',
                      fontSize: 16.sp),
                ),
              ),
            ]),
            onTap: () {
              scaffoldKey?.currentState?.closeDrawer();
              PersistentNavBarNavigator.pushNewScreen(
                scaffoldKey!.currentContext!,
                screen: Login(),
                withNavBar: false, // OPTIONAL VALUE. True by default.
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              ).whenComplete(() {
              },);
              // HomeCustom().launch(context, isNewTask: true, pageRouteAnimation: PageRouteAnimation.Slide);
            },
          ),
          ListTile(
            title: Row(children: [
              Container( margin: EdgeInsets.only(top: 0.sp, bottom: 0, left: 0.sp, right: 10.sp),
                alignment: Alignment.centerLeft,
                child:  IconButton(onPressed: (){
                  //_scaffoldKey.currentState!.openEndDrawer();
                }, icon:  Icon(Icons.account_circle_sharp,color: darlgreyColor,size: 4.h,)),

              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 0.sp, bottom: 0, left: 0.sp, right: 0),
                child: Text(
                  "Profile",
                  style: TextStyle(
                      color: darlgreyColor,
                      fontFamily: 'GeneralSans-Medium',
                      fontSize: 16.sp),
                ),
              ),
            ]),
            onTap: () {
              scaffoldKey?.currentState?.closeDrawer();
              PersistentNavBarNavigator.pushNewScreen(
                scaffoldKey!.currentContext!,
                screen: Login(),
                withNavBar: false, // OPTIONAL VALUE. True by default.
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              ).whenComplete(() {
              },);

            },
          ),
          ListTile(
            title:Row(children: [
              Container( margin: EdgeInsets.only(top: 0.sp, bottom: 0, left: 0.sp, right: 10.sp),
                alignment: Alignment.centerLeft,
                child:  IconButton(onPressed: (){
                  //_scaffoldKey.currentState!.openEndDrawer();
                }, icon:  Icon(Icons.settings,color: darlgreyColor,size: 4.h,)),

              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 0.sp, bottom: 0, left: 0.sp, right: 0),
                child: Text(
                  "Settings",
                  style: TextStyle(
                      color: darlgreyColor,
                      fontFamily: 'GeneralSans-Medium',
                      fontSize: 16.sp),
                ),
              ),
            ]),
            onTap: () {
              scaffoldKey?.currentState?.closeDrawer();
              PersistentNavBarNavigator.pushNewScreen(
                scaffoldKey!.currentContext!,
                screen: Login(),
                withNavBar: false, // OPTIONAL VALUE. True by default.
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              ).whenComplete(() {
              },);
            },
          ),
          SizedBox(height: 30.sp,),

        ],
      ),
    );
  }

}
