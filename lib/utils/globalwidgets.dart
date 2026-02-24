import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:expandable/expandable.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../AdminBottombar.dart';
import '../MerchentBottombar.dart';
import '../Global/GlobalConstants.dart';
import '../UserBottombar.dart';
import '../loginsignup/login.dart';
import '../main.dart';
import '../merchent/MarchentNotification.dart';
import '../model/scanner_detial.dart';
import 'CropAspectRatioPresetCustom.dart';
import 'botton.dart';
import 'cached_network_image.dart';
import 'color.dart';
import 'color.dart' as MyColors;
import 'colornotifire.dart';
import 'package:in_app_review/in_app_review.dart';

import 'commonutills.dart';


screenHeight(context) {
  return MediaQuery.of(context).size.height;
}

screenWidth(context) {
  return MediaQuery.of(context).size.width;
}

statusBarHeight(context) {
  return MediaQuery.of(context).viewPadding.top;
}

gradientBoxDecoration() {
  return BoxDecoration(
      gradient: LinearGradient(
    begin: Alignment.topLeft,

    end: Alignment.bottomRight,
    // 10% of the width, so there are ten blinds.
    colors: [
      Colors.black.withOpacity(0.6),
      Colors.blueAccent.withOpacity(0.6),
      Colors.black.withOpacity(0.6),
    ],
  ));
}

containerWithImageBackground(String imgName) {
  return BoxDecoration(
    image: new DecorationImage(
      fit: BoxFit.fill,
      image: ExactAssetImage(imgName),
    ),
  );

}

expandableCard(
    BuildContext context, String title, Widget collapsed, Widget expanded) {
  return Card(
    color: Colors.white,
    elevation: 8,
    child: ExpandableNotifier(
        initialExpanded: true,
        child: ExpandablePanel(
            header: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  title,
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.black, fontSize: 19.sp),
                )),
            collapsed: collapsed,
            expanded: expanded)),
  );
}

customCarosulSlider({List<TagImage>? images, double? height, double? width}) {
  return CarouselSlider(
    options: CarouselOptions(
      height: height,
      viewportFraction: 0.95,
      initialPage: 0,
      enableInfiniteScroll: false,
      reverse: false,
      autoPlay: true,
      aspectRatio: 2.0,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: false,
      scrollDirection: Axis.horizontal,
    ),
    items: images!.map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
              width: width,
              height: height,
              margin: EdgeInsets.symmetric(horizontal: 2.0),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: cachedImage(i.url,
                  width: width, height: height, fit: BoxFit.cover));
        },
      );
    }).toList(),
  );
}

customElevatedButtonGridView(
    List buttonItem, int crossAxisCount, BuildContext context,
    {Function(String)? onTap}) {
  return GridView.builder(
      itemCount: buttonItem.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: screenHeight(context) / screenWidth(context) * 1.15,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 10.h,
          child: ElevatedButton(
              style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
              onPressed: () {
                onTap!(buttonItem[index]);
              },
              child: Text(
                buttonItem[index],
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: Colors.white),
              )),
        );
      });
}

redButton(String title, Function? onDelete) {
  return OutlinedButton(
      style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.red)),
      onPressed: () {
        onDelete!.call();
      },
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp),
          ),
          //8.width,
          //Icon(Icons.delete,color: Colors.red,)
        ],
      ));
}

outLinedSubmitButton(String? title, Function? onReassign) {
  return OutlinedButton(
      style: OutlinedButton.styleFrom(
          side: BorderSide(color: buttonsColor)),
      onPressed: () {
        onReassign!.call();
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title!,
              style: TextStyle(
                  color: buttonsColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp),
              textAlign: TextAlign.center),
          //8.width,
          // Icon(Icons.send,color: primaryColor,)
        ],
      ));
}


elevatedButtnStandardSize(BuildContext context) {
  return Size(screenWidth(context) / 2.2, screenHeight(context) / 17.5);
}

elevatedButtnLargeSize(BuildContext context) {
  return Size(screenWidth(context) / 1.1, screenHeight(context) / 17.5);
}

elevatedButtnSmallSize(BuildContext context) {
  return Size(screenWidth(context) / 2.2, screenHeight(context) / 17.5);
}


buttonshape() {
  return new RoundedRectangleBorder(
    borderRadius: new BorderRadius.circular(10.0),
  );
}

ElevatedButtonstyle() {
  ElevatedButton.styleFrom(
    //onPrimary: Colors.black,
    animationDuration: Duration(milliseconds: 1000),
    //primary: Colors.red,
    //shadowColor: Colors.redAccent,
    elevation: 10,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  );
}

editTextBoxDecoration() {
  return new BoxDecoration(
    color: lightgreyColor,
    borderRadius: new BorderRadius.circular(10.0),
  );
}

editTextBoxBoundryDecoration(String hinttext) {
  return new InputDecoration(
    contentPadding: EdgeInsets.only(top: -15, bottom: 10, left: 10, right: 5),
    fillColor: Colors.white,
    border: new OutlineInputBorder(
      borderSide: BorderSide(color: lightgreyColor, width: 2),
      borderRadius: const BorderRadius.all(
        const Radius.circular(6.0),
      ),
    ),
    focusedBorder: new OutlineInputBorder(
      borderSide: BorderSide(color: buttonsColor, width: 1),
      borderRadius: const BorderRadius.all(
        const Radius.circular(6.0),
      ),
    ),
    errorBorder: InputBorder.none,
    hintText: hinttext,
  );
}

snackbar(String message) {
  return SnackBar(
    content: Text(
      message,
      style: TextStyle(color: buttonsColor),
    ),
    backgroundColor: Colors.white,
  );
}
Future<File?> selectImageBySource(
    BuildContext context, ImageSource source) async {
  File? croppedImage = await getImagefromPhone(source, context);
  return croppedImage;
}
Future<File?> selectProfileImage(BuildContext context) async {
  File? croppedImage= await getImagefromPhone(ImageSource.camera, context);
  return croppedImage;
}
cropImage(String imagePath) async {
  try {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: imagePath,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: buttonsColor,
              toolbarWidgetColor: Colors.white,
              cropStyle: CropStyle.circle,
              initAspectRatio: CropAspectRatioPreset.original,
              aspectRatioPresets: [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ],
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
            aspectRatioPresets: [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPresetCustom(), // IMPORTANT: iOS supports only one custom aspect ratio in preset list
            ],
          ),
          IOSUiSettings(
            title: 'Cropper',
            minimumAspectRatio: 1.0,
          )]
    );
    final File? file = File(croppedFile!.path);
    return file;
  } catch (e) {
    print(e.toString());
  }
}

Future<File?> getImagefromPhone(ImageSource source, BuildContext context) async {
  File? croppedImage;
  try {
    if (Platform.isIOS) {
      bool isValid = await checkMediaPermission(context);
      if (!isValid) {
        return null;
      }
    }
    /*PickedFile image = await ImagePicker().pickImage(source: source,
          preferredCameraDevice: CameraDevice.front) as PickedFile;*/
    final XFile? pickedFile = await ImagePicker().pickImage(source: source,
        preferredCameraDevice: CameraDevice.front) as XFile;

    if (pickedFile != null && pickedFile.path != null) {
      croppedImage = await cropImage(pickedFile.path) as File;
    }
    // Get.back(result: croppedImage);
    return croppedImage;
  } catch (e) {
    print(e.toString());
  }
}

Future<DateTime> selectDate(BuildContext context) async {
  DateTime currentDate = DateTime.now();
  final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(1947),
      lastDate: DateTime(2090));
  if (pickedDate != null && pickedDate != currentDate) {
    currentDate = pickedDate;
  }
  return currentDate;
}
Future<bool> checkMediaPermission(context) async {
  try {
    var status = await Permission.photos.status;
    if (status.isDenied) {
      enableServicePopUp(context, Constants.mediaTitle, Constants.mediaDesc);
      return false;
    } else {
      return true;
    }
  } catch (e) {
    enableServicePopUp(context, Constants.mediaTitle, Constants.mediaDesc);
    return false;
  }
}

Future<Null> enableServicePopUp(context, title, desc) async {
  return showCupertinoDialog<Null>(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.transparent,
        content: Container(
          padding: EdgeInsets.only(top: 25, bottom: 15, left: 15, right: 15),
          width: 300,
          height: 200,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // SvgPicture.asset(
              //   'assets/images/logout.svg',
              //   height: 140.0,
              //   width: 140.0,
              // ),
              // SizedBox(
              //   height: 10.0,
              // ),
              Text(
                title,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 22,

                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                desc,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),

              !Platform.isIOS
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    child: const Text(
                      'Cancel',
                      style:
                      TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    onPressed: () async {
                      Navigator.of(context).pop();

                      // Navigator.of(context).pop();
                      //  bool isEnabled = await location.requestService();
                    },
                  ),
                ],
              )
                  : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  TextButton(
                    child: const Text(
                      'Cancel',
                      style:
                      TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();

                      // Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text(
                      'Settings',
                      style: TextStyle(
                          fontSize: 16, color: Color(0xffFF4401)),
                    ),
                    onPressed: () async {
                      try {
                        if (await Permission.speech.isPermanentlyDenied) {
                          // The user opted to never again see the permission request dialog for this
                          // app. The only way to change the permission's status now is to let the
                          // user manually enable it in the system settings.
                          openAppSettings();
                        }
                        Navigator.of(context).pop();

                        // Navigator.of(context).pop();
                      } catch (e) {
                        Navigator.of(context).pop();

                        // Navigator.of(context).pop();
                      }

                      // Navigator.pushReplacementNamed(
                      //     context, Constants.logout);
                    },
                  )
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}

otherHeader(BuildContext context, String? name) {
  return AppBar(
      toolbarHeight: 35.sp,
      backgroundColor: buttonsColor,
      automaticallyImplyLeading: false,
      actions: <Widget>[Container()],
      elevation: 0,
      title: Container(
        padding:
            EdgeInsets.only(left: 0.sp, bottom: 0.sp, top: 0.sp, right: 0.sp),
        child: Row(
          children: [
            /*Container(
              margin: EdgeInsets.only(
                  top: 0.sp, bottom: 0.sp, left: 0, right: 0),
              height:47.sp , width: 30.sp,
              alignment: Alignment.centerLeft,
              child:
              Image.asset('images/logoicon.png',fit: BoxFit.contain),

            ),*/
            Container(
              alignment: Alignment.centerRight,
              child: IconButton(
                  onPressed: () {
                    // finish(context);
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    } else {
                      SystemNavigator.pop();
                    }
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 4.h,
                  )),
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin:
                        EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 0),
                    child: Text(
                      name ?? '',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'GeneralSans-Medium',
                          fontSize: 16.sp),
                    ),
                  ),
                )
              ],
            )),
           /* Container(
              alignment: Alignment.centerRight,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.white,
                    size: 4.h,
                  )),
            ),*/
          ],
        ),
      ));
}


final getData = GetStorage();
homeAppbar(GlobalKey<ScaffoldState> _scaffoldKey, BuildContext context,ColorNotifire notifire,String? name,String? email,String? phone,String? profileimage,bool loginflag,double barHeight, int screenFlag) {
  return PreferredSize(  preferredSize:  Size(double.infinity, barHeight),
    child: Container(
      // color:notifire.backgrounde,
      decoration: BoxDecoration(
          color: notifire.backgrounde,
          // border: Border.all(color: darlgreyColor, width: 1),
          border: Border(bottom:BorderSide( //                   <--- left side
            color: borderColorvalue,
            width: 1.0,
          ),),
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(0),
              bottomLeft: Radius.circular(0))),
      height: MediaQuery.of(context).size.height * 0.19,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.055),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                InkWell(onTap: () {
                  // navBottomsheet(_scaffoldKey,context,notifire,name,email,phone,profileimage,loginflag,screenFlag);
                },
                  child: Container(
                    alignment: Alignment.center,
                    child: Icon(Icons.menu_sharp, color: textColor,size: 25.sp),),),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Current Location",
                        style: TextStyle(
                            color: notifire.textcolor,
                            fontSize: 12,
                            fontFamily: 'GeneralSans-Medium',
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        getData.read("CurentAdd") ?? "",
                        style: TextStyle(
                            color: notifire.textcolor,
                            fontSize: 12,
                            fontFamily: 'GeneralSans-Medium',
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //! ------ Notification Page -----
                    MarchentNotification().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Scale);
                    /*PersistentNavBarNavigator.pushNewScreen(
                    _scaffoldKey!.currentContext!,
                    screen: PrivacyPolicy(),
                    withNavBar: false, // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  ).whenComplete(() {
                    getUserinfo();
                  },);*/
                    // HomeCustom().launch(context, isNewTask: true, pageRouteAnimation: PageRouteAnimation.Slide);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Icon(Icons.notifications_none_sharp, color: textColor,size: 23.sp),)
                ),

              ],
            ),
          ),
          SizedBox(height: 15.sp),
          // Expanded(child: Divider(height: 2.sp,color: darlgreyColor,),)
         /* Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: InkWell(
              onTap: () {
              },
              child: Row(
                children: [
                  Image.asset("images/search.png", height: height / 30),
                  SizedBox(width: width / 90),
                  Container(width: 1, height: height / 40, color: Colors.grey),
                  SizedBox(width: width / 90),
                  //! ------ Search TextField -------
                  Text(
                    "Search...".tr,
                    style: TextStyle(
                        fontFamily: 'Gilroy Medium',
                        color: const Color(0xffd2d2db),
                        fontSize: 15),
                  ),
                ],
              ),
            ),
          ),*/
        ],
      ),
    ),
  );
}
navBottomsheet(GlobalKey<ScaffoldState> _scaffoldKey, BuildContext context,ColorNotifire notifire,String? name,String? email,String? phone,String? profileimage,bool loginflag,int screenFlag) {
  return showModalBottomSheet(
      backgroundColor: notifire.containercolore,
      isScrollControlled: true,
      isDismissible: true,
      context: context,
      shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.sp), topRight: Radius.circular(20.sp))),
      builder: (context) {
        return  StatefulBuilder(builder: (BuildContext context, StateSetter mystate) {
          return Container(
            child: SingleChildScrollView(
                child:  Container(
                  // color: darlgreyColor,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      /*  Expanded(
                      child: SingleChildScrollView(
                        child: !hData.isLoading
                            ? Column( crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: height / 60),
                            //! ----- Top topItem List ------
                            SizedBox(height: height / 80),
                            Padding(
                              padding: EdgeInsets.only(left: 8.sp),
                              child: SizedBox(
                                height: Get.height * 0.05,
                                child: ListView.builder(
                                  itemCount: 3,
                                  //hData.homeDataList["Catlist"].length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (ctx, i) {
                                    // var catlist = hData.homeDataList["Catlist"];
                                    // return topItem(catlist, i);
                                    return topItem(i);
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: Get.height * 0.02),
                            Padding(
                                padding: EdgeInsets.only(left: 15.sp),
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text("New Keys Housing Xpert",
                                      style: TextStyle(
                                          fontFamily: 'GeneralSans-Bold',
                                          color: notifire.textcolor,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w600)),
                                )),
                            Padding(
                                padding:
                                EdgeInsets.only(left: 15.sp, top: 10.sp),
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Sponsored projects and events",
                                      style: TextStyle(
                                          fontFamily: 'GeneralSans-Regular',
                                          color: notifire.textcolor2,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600)),
                                )),
                            SizedBox(height: 20.sp),
                            InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) => AlertDialog(
                                        title: Text('Dialog Title'),
                                        content: search(),
                                      )
                                  );
                                  // searchBottomsheet();
                                },
                                child: Container(
                                  height: Get.height * 0.06,
                                  margin: EdgeInsets.only(
                                      bottom: 0.sp, top: 0.sp, left: 30.sp, right: 30.sp),
                                  decoration: BoxDecoration(
                                      color: notifire.backgrounde,
                                      border: Border.all(color: notifire.getbordercolor, width: 0.5),
                                      borderRadius: BorderRadius.circular(15.sp)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 4, right: 8),
                                    child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(width: 10.sp),
                                        Text("Search By Location, Project & Budget",
                                            style: TextStyle(
                                                fontFamily: 'GeneralSans-Medium',
                                                color: notifire.textcolor,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600)),
                                        SizedBox(width: 10.sp),
                                      ],
                                    ),
                                  ),
                                )
                            ),
                            SizedBox(height: height / 60),
                            //! ----------- Upcoming Events List -------------
                            Ink(
                              height: Get.height * 0.20,
                              child: ListView.builder(
                                itemCount: 5, //hData.upcomingEvent.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (ctx, i) {
                                  return events(i);
                                },
                              ),
                            ),
                          ],
                        )
                            : isLoadingCircular(),
                      ),
                    ),*/
                      SizedBox(height: 20.sp),
                      Container(
                          color: notifire.newtopbgcolore,
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(left: 15.sp, top: 25.sp,right: 10.sp),
                                  child: Container(
                                      alignment: Alignment.centerLeft,
                                      child:Row(children: [
                                        Container(
                                            margin: EdgeInsets.only(
                                                bottom: 0, top: 0.sp, left: 0.sp, right: 0),
                                            child:loginflag == true?
                                            Container( margin: EdgeInsets.only(
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
                                                    child:Card( color: MyColors.whiteColor,
                                                      elevation: 3,
                                                      shadowColor: MyColors.darkgrey_100,
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
                                                              height:40.sp,
                                                              width: 40.sp,
                                                              fit: BoxFit.fill,
                                                              imageUrl: profileimage??"",
                                                              placeholder: (context, url) => Container(
                                                                decoration: BoxDecoration(
                                                                    image: DecorationImage(
                                                                      image: AssetImage("images/profile.png"),
                                                                      fit: BoxFit.fill,
                                                                    )),),
                                                              errorWidget: (context, url, error) => Icon(Icons.error),
                                                            ),)

                                                      ),),)
                                                ],
                                              ),
                                            )
                                                :
                                            CircleAvatar(
                                                backgroundColor: Colors.transparent,
                                                radius: MediaQuery.of(context).size.height  / 25,
                                                child: Image.asset("images/profile1.png",
                                                    fit: BoxFit.cover))

                                        ),
                                        loginflag == true?
                                        Container(
                                          margin: EdgeInsets.only(
                                              bottom: 0, top: 0.sp, left: 10.sp, right: 0),
                                          child:  Column(crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(name??"",
                                                  style: TextStyle(
                                                      fontFamily: 'GeneralSans-Semibold',
                                                      color: notifire.textcolor3,
                                                      fontSize: 16.sp,
                                                      fontWeight: FontWeight.w600)),
                                              Text(email??"",
                                                  style: TextStyle(
                                                      fontFamily: 'GeneralSans-Regular',
                                                      color: notifire.textcolor3,
                                                      fontSize: 15.sp)),
                                              Text(phone??'',
                                                  style: TextStyle(
                                                      fontFamily: 'GeneralSans-Regular',
                                                      color: notifire.textcolor3,
                                                      fontSize: 15.sp))
                                            ],),):
                                        Container(
                                          margin: EdgeInsets.only(
                                              bottom: 0, top: 0.sp, left: 10.sp, right: 0),
                                          child: Text("Welcome",
                                              style: TextStyle(
                                                  fontFamily: 'GeneralSans-Semibold',
                                                  color: notifire.textcolor3,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w600)),),
                                      ],)

                                  )),
                              SizedBox(height:20.sp),
                              loginflag == false ?Container(
                                margin: EdgeInsets.only(
                                  bottom: 0.sp, top: 0.sp, left: 16.sp, right: 16.sp),
                                child:GestureDetector(
                                onTap: () {
                                  FocusScope.of(context).requestFocus(FocusNode());
                                  Login().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Fade);
                                },
                                child: SizedBox(
                                  child: Custombutton.button5(
                                      Colors.white,
                                      darktextColor,
                                      "Login / Register Now",
                                      25.0.sp,
                                      double.infinity
                                  ),
                                ),
                              ),):Container(),
                              SizedBox(height:20.sp),
                            ],)),
                     /* SizedBox(height:15.sp),
                      InkWell(
                          onTap: () {

                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 15.sp,right: 15.sp, top: 15.sp, bottom: 15.sp),
                            margin: EdgeInsets.only(
                                bottom: 0.sp, top: 0.sp, left: 12.sp, right: 12.sp),
                            color: lightColor,
                            child:Row(children: [
                              Container(
                                margin: EdgeInsets.only(
                                    bottom: 0, top: 0.sp, left: 0.sp, right: 0),
                                child:  Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Post Property",
                                        style: TextStyle(
                                          fontFamily: 'GeneralSans-Medium',
                                          color: notifire.textcolor2,
                                          fontSize: 16.sp,
                                        )),
                                    Text("Sell/Rent faster with New Keys Housing Xpert",
                                        style: TextStyle(
                                            fontFamily: 'GeneralSans-Regular',
                                            color: notifire.textcolor2,
                                            fontSize: 14.sp))
                                  ],),),
                              const Spacer(),
                              Container(
                                  margin: EdgeInsets.only(
                                      bottom: 0, top: 0.sp, left: 0.sp, right: 0),
                                  child:CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: MediaQuery.of(context).size.height  / 40,
                                      child: Image.asset("images/home1.png",
                                          fit: BoxFit.cover))


                              ),
                            ],)
                            ,)),*/
                      SizedBox(height:15.sp),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            CommonUtills.launchInBrowser("https://wa.me/${919111060060}?text=Hi! I'm interested in your services.");
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 15.sp,right: 15.sp, top: 15.sp, bottom: 15.sp),
                            margin: EdgeInsets.only(
                                bottom: 0.sp, top: 0.sp, left: 12.sp, right: 12.sp),
                            color: lightColor,
                            child:Row(children: [
                              Container(
                                margin: EdgeInsets.only(
                                    bottom: 0, top: 0.sp, left: 0.sp, right: 0),
                                child:  Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Post Property via Whatsapp",
                                        style: TextStyle(
                                          fontFamily: 'GeneralSans-Medium',
                                          color: notifire.textcolor2,
                                          fontSize: 16.sp,
                                        )),
                                    Text("Faster property posting experience",
                                        style: TextStyle(
                                            fontFamily: 'GeneralSans-Regular',
                                            color: notifire.textcolor2,
                                            fontSize: 14.sp))
                                  ],),),
                              const Spacer(),
                              Container(
                                  margin: EdgeInsets.only(
                                      bottom: 0, top: 0.sp, left: 0.sp, right: 0),
                                  child:CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: MediaQuery.of(context).size.height  / 40,
                                      child: Image.asset("images/whatsapp.png",
                                          fit: BoxFit.cover))


                              ),
                            ],)
                            ,)),
                      // SizedBox(height:15.sp),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            // ProjectListPage(propertyType : '',screenFlag :1,CuratedId : '0').launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Fade);
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 15.sp,right: 15.sp, top: 15.sp, bottom: 15.sp),
                            margin: EdgeInsets.only(
                                bottom: 0.sp, top: 0.sp, left: 12.sp, right: 12.sp),
                            color: lightColor,
                            child:Row(children: [
                              Container(
                                margin: EdgeInsets.only(
                                    bottom: 0, top: 0.sp, left: 0.sp, right: 0),
                                child:  Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Search Properties",
                                        style: TextStyle(
                                          fontFamily: 'GeneralSans-Medium',
                                          color: notifire.textcolor2,
                                          fontSize: 16.sp,
                                        )),
                                    Text("Explore residential and commercial properties",
                                        style: TextStyle(
                                            fontFamily: 'GeneralSans-Regular',
                                            color: notifire.textcolor2,
                                            fontSize: 14.sp))
                                  ],),),
                              const Spacer(),
                              Container(
                                  margin: EdgeInsets.only(
                                      bottom: 0, top: 0.sp, left: 0.sp, right: 0),
                                  child:CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: MediaQuery.of(context).size.height  / 40,
                                      child: Image.asset("images/homesearch.png",
                                          fit: BoxFit.cover))


                              ),
                            ],)
                            ,)),
                      // SizedBox(height:15.sp),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            if(screenFlag==1){
                              MerchentBottombar().launch(context, isNewTask: true, pageRouteAnimation: PageRouteAnimation.Scale);
                            }else if(screenFlag==2){
                              AdminBottombar().launch(context, isNewTask: true, pageRouteAnimation: PageRouteAnimation.Scale);
                            }else if(screenFlag==3){
                              UserBottombar().launch(context, isNewTask: true, pageRouteAnimation: PageRouteAnimation.Scale);
                            }

                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 15.sp,right: 15.sp, top: 15.sp, bottom: 15.sp),
                            margin: EdgeInsets.only(
                                bottom: 0.sp, top: 0.sp, left: 12.sp, right: 12.sp),
                            color: lightColor,
                            child:Row(children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      bottom: 0, top: 0.sp, left: 0.sp, right: 10.sp),
                                  child:Icon(
                                      Icons.home,
                                      size: 20.sp,
                                      color: iconColor)
                              ),
                              Text("Home Page",
                                  style: TextStyle(
                                    fontFamily: 'GeneralSans-Medium',
                                    color: notifire.textcolor2,
                                    fontSize: 16.sp,
                                  )),
                            ],)
                            ,)),
                      /*SizedBox(height:15.sp),
                      Container(
                        margin: EdgeInsets.only(
                            bottom: 0.sp, top: 0.sp, left: 12.sp, right: 12.sp),
                        child:Text("PROPERTY MANAGEMENT - FOR OWNERS/DEALERS",
                            style: TextStyle(
                                fontFamily: 'GeneralSans-Regular',
                                color: notifire.textcolor2,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600)) ,),
                      SizedBox(height:15.sp),
                      InkWell(
                          onTap: () {

                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 15.sp,right: 15.sp, top: 15.sp, bottom: 15.sp),
                            margin: EdgeInsets.only(
                                bottom: 0.sp, top: 0.sp, left: 12.sp, right: 12.sp),
                            color: lightColor,
                            child:Row(children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      bottom: 0, top: 0.sp, left: 0.sp, right: 10.sp),
                                  child:Icon(
                                      Icons.message_rounded,
                                      size: 20.sp,
                                      color: iconColor)
                              ),
                              Text("View Responses",
                                  style: TextStyle(
                                    fontFamily: 'GeneralSans-Medium',
                                    color: notifire.textcolor2,
                                    fontSize: 16.sp,
                                  )),
                            ],)
                            ,)),
                      SizedBox(height:4.sp),
                      InkWell(
                          onTap: () {

                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 15.sp,right: 15.sp, top: 15.sp, bottom: 15.sp),
                            margin: EdgeInsets.only(
                                bottom: 0.sp, top: 0.sp, left: 12.sp, right: 12.sp),
                            color: lightColor,
                            child:Row(children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      bottom: 0, top: 0.sp, left: 0.sp, right: 10.sp),
                                  child:Icon(
                                      Icons.business_sharp,
                                      size: 20.sp,
                                      color: iconColor)
                              ),
                              Text("Manage / Edit your Listings",
                                  style: TextStyle(
                                    fontFamily: 'GeneralSans-Medium',
                                    color: notifire.textcolor2,
                                    fontSize: 16.sp,
                                  )),
                            ],)
                            ,)),*/
                      SizedBox(height:15.sp),
                      Container(
                        margin: EdgeInsets.only(
                            bottom: 0.sp, top: 0.sp, left: 12.sp, right: 12.sp),
                        child:Text("EXPLORE PROPERTIES BY CATEGORY",
                            style: TextStyle(
                                fontFamily: 'GeneralSans-Regular',
                                color: notifire.textcolor2,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600)) ,),
                      SizedBox(height:15.sp),
                      Container(padding: EdgeInsets.only(left: 15.sp,right: 15.sp, top: 15.sp, bottom: 15.sp),
                        margin: EdgeInsets.only(
                            bottom: 0.sp, top: 0.sp, left: 12.sp, right: 12.sp),
                        color: lightColor,
                        child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(child: InkWell(onTap: () {
                              Navigator.pop(context);
                              // ProjectListPage(propertyType: "residential",screenFlag:1,CuratedId: '0').launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Fade);
                              },
                                child: Container(
                                  child: Column(children: [
                                    Container(
                                        margin: EdgeInsets.only(
                                            bottom: 0, top: 0.sp, left: 0.sp, right: 0.sp),
                                        child:Icon(
                                            Icons.home,
                                            size: 20.sp,
                                            color: iconColor)
                                    ),
                                    Text("Residential",
                                        style: TextStyle(
                                          fontFamily: 'GeneralSans-Medium',
                                          color: notifire.textcolor2,
                                          fontSize: 16.sp,
                                        )),
                                    Text("Properties",
                                        style: TextStyle(
                                          fontFamily: 'GeneralSans-Regular',
                                          color: notifire.textcolor2,
                                          fontSize: 14.sp,
                                        )),
                                  ],),)),),

                            VerticalDivider(
                              color: notifire.textcolor2,
                              thickness: 4.sp,
                            ),
                            Expanded(child: InkWell(onTap: () {
                              Navigator.pop(context);
                              // ProjectListPage(propertyType: 'commercial',screenFlag:1,CuratedId: '0').launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Fade);
                            },child:  Container(
                              child: Column(children: [
                                Container(
                                    margin: EdgeInsets.only(
                                        bottom: 0, top: 0.sp, left: 0.sp, right: 0.sp),
                                    child:Icon(
                                        Icons.business_sharp,
                                        size: 20.sp,
                                        color: iconColor)
                                ),
                                Text("Commercial",
                                    style: TextStyle(
                                      fontFamily: 'GeneralSans-Medium',
                                      color: notifire.textcolor2,
                                      fontSize: 16.sp,
                                    )),
                                Text("Properties",
                                    style: TextStyle(
                                      fontFamily: 'GeneralSans-Regular',
                                      color: notifire.textcolor2,
                                      fontSize: 14.sp,
                                    )),
                              ],),),))
                          ],

                        ),),
                      SizedBox(height:15.sp),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            // AboutUsPage().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Fade);
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 15.sp,right: 15.sp, top: 15.sp, bottom: 15.sp),
                            margin: EdgeInsets.only(
                                bottom: 0.sp, top: 0.sp, left: 12.sp, right: 12.sp),
                            color: lightColor,
                            child:Row(children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      bottom: 0, top: 0.sp, left: 0.sp, right: 10.sp),
                                  child:Icon(
                                      Icons.apartment,
                                      size: 20.sp,
                                      color: iconColor)
                              ),
                              Text("About Us",
                                  style: TextStyle(
                                    fontFamily: 'GeneralSans-Medium',
                                    color: notifire.textcolor2,
                                    fontSize: 16.sp,
                                  )),
                            ],)
                            ,)),
                      SizedBox(height:4.sp),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            // GalleryPage().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Fade);
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 15.sp,right: 15.sp, top: 15.sp, bottom: 15.sp),
                            margin: EdgeInsets.only(
                                bottom: 0.sp, top: 0.sp, left: 12.sp, right: 12.sp),
                            color: lightColor,
                            child:Row(children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      bottom: 0, top: 0.sp, left: 0.sp, right: 10.sp),
                                  child:Icon(
                                      Icons.image,
                                      size: 20.sp,
                                      color: iconColor)
                              ),
                              Text("Gallery",
                                  style: TextStyle(
                                    fontFamily: 'GeneralSans-Medium',
                                    color: notifire.textcolor2,
                                    fontSize: 16.sp,
                                  )),
                            ],)
                            ,)),
                      SizedBox(height:4.sp),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            // AwardsPage().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Fade);
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 15.sp,right: 15.sp, top: 15.sp, bottom: 15.sp),
                            margin: EdgeInsets.only(
                                bottom: 0.sp, top: 0.sp, left: 12.sp, right: 12.sp),
                            color: lightColor,
                            child:Row(children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      bottom: 0, top: 0.sp, left: 0.sp, right: 10.sp),
                                  child:Icon(
                                      Icons.wine_bar_sharp,
                                      size: 20.sp,
                                      color: iconColor)
                              ),
                              Text("Awards",
                                  style: TextStyle(
                                    fontFamily: 'GeneralSans-Medium',
                                    color: notifire.textcolor2,
                                    fontSize: 16.sp,
                                  )),
                            ],)
                            ,)),
                      SizedBox(height:4.sp),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            // OurTeamPage().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Fade);
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 15.sp,right: 15.sp, top: 15.sp, bottom: 15.sp),
                            margin: EdgeInsets.only(
                                bottom: 0.sp, top: 0.sp, left: 12.sp, right: 12.sp),
                            color: lightColor,
                            child:Row(children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      bottom: 0, top: 0.sp, left: 0.sp, right: 10.sp),
                                  child:Icon(
                                      Icons.supervised_user_circle_outlined,
                                      size: 20.sp,
                                      color: iconColor)
                              ),
                              Text("Our Team",
                                  style: TextStyle(
                                    fontFamily: 'GeneralSans-Medium',
                                    color: notifire.textcolor2,
                                    fontSize: 16.sp,
                                  )),
                            ],)
                            ,)),
                      SizedBox(height:4.sp),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            // FAQPage().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Fade);
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 15.sp,right: 15.sp, top: 15.sp, bottom: 15.sp),
                            margin: EdgeInsets.only(
                                bottom: 0.sp, top: 0.sp, left: 12.sp, right: 12.sp),
                            color: lightColor,
                            child:Row(children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      bottom: 0, top: 0.sp, left: 0.sp, right: 10.sp),
                                  child:Icon(
                                      Icons.supervised_user_circle_outlined,
                                      size: 20.sp,
                                      color: iconColor)
                              ),
                              Text("FAQ",
                                  style: TextStyle(
                                    fontFamily: 'GeneralSans-Medium',
                                    color: notifire.textcolor2,
                                    fontSize: 16.sp,
                                  )),
                            ],)
                            ,)),
                      SizedBox(height:4.sp),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            // PrivacyPolicy().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Fade);
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 15.sp,right: 15.sp, top: 15.sp, bottom: 15.sp),
                            margin: EdgeInsets.only(
                                bottom: 0.sp, top: 0.sp, left: 12.sp, right: 12.sp),
                            color: lightColor,
                            child:Row(children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      bottom: 0, top: 0.sp, left: 0.sp, right: 10.sp),
                                  child:Icon(
                                      Icons.privacy_tip_sharp,
                                      size: 20.sp,
                                      color: iconColor)
                              ),
                              Text("Privacy policy",
                                  style: TextStyle(
                                    fontFamily: 'GeneralSans-Medium',
                                    color: notifire.textcolor2,
                                    fontSize: 16.sp,
                                  )),
                            ],)
                            ,)),
                      SizedBox(height:4.sp),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            // TermsandConditions().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Fade);
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 15.sp,right: 15.sp, top: 15.sp, bottom: 15.sp),
                            margin: EdgeInsets.only(
                                bottom: 0.sp, top: 0.sp, left: 12.sp, right: 12.sp),
                            color: lightColor,
                            child:Row(children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      bottom: 0, top: 0.sp, left: 0.sp, right: 10.sp),
                                  child:Icon(
                                      Icons.security_sharp,
                                      size: 20.sp,
                                      color: iconColor)
                              ),
                              Text("Terms and Conditions",
                                  style: TextStyle(
                                    fontFamily: 'GeneralSans-Medium',
                                    color: notifire.textcolor2,
                                    fontSize: 16.sp,
                                  )),
                            ],)
                            ,)),
                      SizedBox(height:4.sp),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            // ContactUsPage().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Fade);
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 15.sp,right: 15.sp, top: 15.sp, bottom: 15.sp),
                            margin: EdgeInsets.only(
                                bottom: 0.sp, top: 0.sp, left: 12.sp, right: 12.sp),
                            color: lightColor,
                            child:Row(children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      bottom: 0, top: 0.sp, left: 0.sp, right: 10.sp),
                                  child:Icon(
                                      Icons.support_agent_rounded,
                                      size: 20.sp,
                                      color: iconColor)
                              ),
                              Text("Customer Service",
                                  style: TextStyle(
                                    fontFamily: 'GeneralSans-Medium',
                                    color: notifire.textcolor2,
                                    fontSize: 16.sp,
                                  )),
                            ],)
                            ,)),

                      SizedBox(height:4.sp),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            // ReferFriendPage().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Fade);
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 15.sp,right: 15.sp, top: 15.sp, bottom: 15.sp),
                            margin: EdgeInsets.only(
                                bottom: 0.sp, top: 0.sp, left: 12.sp, right: 12.sp),
                            color: lightColor,
                            child:Row(children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      bottom: 0, top: 0.sp, left: 0.sp, right: 10.sp),
                                  child:Icon(
                                      Icons.share_rounded,
                                      size: 20.sp,
                                      color: iconColor)
                              ),
                              Text("Refer a Friend",
                                  style: TextStyle(
                                    fontFamily: 'GeneralSans-Medium',
                                    color: notifire.textcolor2,
                                    fontSize: 16.sp,
                                  )),
                            ],)
                            ,)),
                      SizedBox(height:4.sp),
                      InkWell(
                          onTap: () async {
                            Navigator.pop(context);
                            final InAppReview inAppReview = InAppReview.instance;
                            if (await inAppReview.isAvailable()) {
                            inAppReview.requestReview(); // native dialog
                            } else {
                            // fallback to store page
                            inAppReview.openStoreListing(
                            appStoreId: '6753895241', // Replace with your iOS App ID
                            microsoftStoreId: '',    // Optional
                            );
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 15.sp,right: 15.sp, top: 15.sp, bottom: 15.sp),
                            margin: EdgeInsets.only(
                                bottom: 0.sp, top: 0.sp, left: 12.sp, right: 12.sp),
                            color: lightColor,
                            child:Row(children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      bottom: 0, top: 0.sp, left: 0.sp, right: 10.sp),
                                  child:Icon(
                                      Icons.rate_review_sharp,
                                      size: 20.sp,
                                      color: iconColor)
                              ),
                              Text("Rate Our App",
                                  style: TextStyle(
                                    fontFamily: 'GeneralSans-Medium',
                                    color: notifire.textcolor2,
                                    fontSize: 16.sp,
                                  )),
                            ],)
                            ,)),
                      SizedBox(height:4.sp),
                      InkWell(
                          onTap: () {
                            dialogShow(
                                title:
                                "Are you sure ?\n You want to delete the account", context: context
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 15.sp,right: 15.sp, top: 15.sp, bottom: 15.sp),
                            margin: EdgeInsets.only(
                                bottom: 0.sp, top: 0.sp, left: 12.sp, right: 12.sp),
                            color: lightColor,
                            child:Row(children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      bottom: 0, top: 0.sp, left: 0.sp, right: 10.sp),
                                  child:Icon(
                                      Icons.delete_forever,
                                      size: 20.sp,
                                      color: iconColor)
                              ),
                              Text("Delete Account",
                                  style: TextStyle(
                                    fontFamily: 'GeneralSans-Medium',
                                    color: notifire.textcolor2,
                                    fontSize: 16.sp,
                                  )),
                            ],)
                            ,)),
                      SizedBox(height:5.sp),
                      Container(
                          alignment: Alignment.center,
                          color: Colors.transparent,
                          child: Image.asset("images/nkslogo.png",width: 50.sp,height: 40.sp,)),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            bottom: 0.sp, top: 0.sp, left: 0.sp, right: 0.sp),
                        child:Text("Version 1.0.0",
                            style: TextStyle(
                                fontFamily: 'GeneralSans-Regular',
                                color: notifire.textcolor2,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600)) ,),

                      SizedBox(height:20.sp),
                    ],
                  ),
                )
            ),
          );
        }
        );
      });
}

dialogShow({required String title, required BuildContext context}) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
            content: Text(title,
                style: const TextStyle(fontWeight: FontWeight.w600)),
            actions: <Widget>[
              TextButton(
                  child: Text("Delete",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, letterSpacing: 0.5)),
                  onPressed: () {
                  },),
              TextButton(
                child: Text("No",
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, letterSpacing: 0.5)),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ]);
      });
}
