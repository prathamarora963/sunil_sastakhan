import 'package:SastaKhana/controller/customer/profile_controller.dart';
import 'package:SastaKhana/utils/extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/colornotifire.dart';
import '../../globalwidgets/base_scaffold_body.dart';
import '../../loginsignup/ChangePassword.dart';
import '../../loginsignup/SignupWelcome.dart';
import '../merchent/MarchentContactUs.dart';

import '../../utils/color.dart';
import '../../utils/color.dart' as MyColors;
import '../../utils/commonutills.dart';
import '../../utils/globalwidgets.dart';
import 'RateUs.dart';
import 'ReferralProgram.dart';
import 'UserOrders.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  UserProfileState createState() => UserProfileState();
}

class UserProfileState extends State<UserProfile> {

final ProfileController profileController = Get.put(ProfileController()); 

  late ColorNotifire notifire;

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifire.setIsDark = false;
    } else {
      notifire.setIsDark = previusstate;
    }
  }
  String name='';
  String email='';
  String phone='';
  String? profileimage;
  bool? loginflage = false;
  bool promotionalEmails = true;
  bool pushNotifications = true;
  initState() {
    profileController.fetchUserProfile();
    super.initState();
 
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      // appBar: otherHeader(context,"Privacy Policy"),
        backgroundColor: notifire.backgrounde,
        body: Body(child: Container(
          height: screenHeight(context),
          width: screenWidth(context),
          child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              child: Container(
                margin: EdgeInsets.only(
                    bottom: 0, top: 0, left: 15.sp, right: 15.sp),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 15.sp),

                      // Profile Card
                      Container(
                        width: double.infinity,
                        padding:  EdgeInsets.all(16.sp),
                        decoration: BoxDecoration(
                          border: Border.all(color: borderColorvalue),
                          color: textBoxbgColor,
                          borderRadius: BorderRadius.circular(16.sp),
                        ),
                        child: Obx((){
                          final userProfile=profileController.userProfile.value;
                          return Column(
                          children: [
                            ClipRRect(borderRadius: BorderRadius.circular(15.sp),
                              child:   Container(
                                margin: EdgeInsets.only(
                                    bottom: 0, top: 0, left: 0, right: 0),
                                child:CachedNetworkImage(
                                  // maxHeightDiskCache:100,
                                  // maxWidthDiskCache: 90,
                                  // memCacheHeight: 100,
                                  // memCacheWidth: 90,
                                  height: 42.sp,
                                  width: 45.sp,
                                  fit: BoxFit.fill,
                                  imageUrl:  userProfile?.image.toImageUrl()??'',//baseUrl!+"/"+propertyDetails!.image! ??'',
                                  placeholder: (context, url) => Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("images/logo.png"),
                                          fit: BoxFit.fill,
                                        )),),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                              ),),
                            SizedBox(height: 12.sp),
                            Text(
                              userProfile?.fName ?? "User Name",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontFamily: 'GeneralSans-Semibold',
                                  color: notifire.gettextcolor),
                            ),
                            SizedBox(height: 5.sp),
                            Text(
                              userProfile?.email ?? "myrahulmehta@gmail.com",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontFamily: 'GeneralSans-Medium',
                                  color: textColorSecond),
                            ),
                            SizedBox(height: 5.sp),
                            Text(
                              userProfile?.mobile ?? "9953044581",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontFamily: 'GeneralSans-Medium',
                                  color: textColorSecond),
                            ),
                            SizedBox(height: 10.sp),
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon:  Icon(Icons.edit, size: 18.sp,color: textColorSecond,),
                              label: Text(
                                "Edit Profile",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: 'GeneralSans-Medium',
                                    color: textColorSecond),
                              ),
                              style: ElevatedButton.styleFrom(
                                elevation: 1,
                                backgroundColor: const Color(0xFFF0F1F5),
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.sp),
                                ),
                              ),
                            )
                          ],
                        );
                      
                        })),
                      SizedBox(height: 20.sp),

                      // Change Password
                      Container(margin: EdgeInsets.only(top: 0.sp, bottom: 0, left: 15.sp, right: 20.sp),
                        child:GestureDetector(
                          onTap: () {
                            ChangePassword().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Scale);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [
                              Text(
                                "Change Password",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: 'GeneralSans-Semibold',
                                  color: skyBlueColorPrimery,
                                ),
                              ),
                              Icon(Icons.arrow_forward_ios, color: skyBlueColorPrimery,size: 17.sp,),
                            ],
                          ),
                        ),),
                      SizedBox(height: 20.sp),
                      // Account Settings
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            "Account Settings",
                            style: TextStyle(
                              fontFamily:
                              'GeneralSans-Semibold',
                              color: notifire.gettextcolor,
                              fontSize: 16.sp,)),
                      ),
                      SizedBox(height: 10.sp),


                      _settingsTile(Icons.history, "Order History", onTap: () {
                        UserOrders(navFlag: false).launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Scale);
                      },),
                      _settingsTile(Icons.share_sharp, "Referral Program", onTap: () {
                        ReferralProgram().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Scale);
                      },),
                      _settingsTile(Icons.settings, "Setting", onTap: () {
                        // MarchentCustomerReviews().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Scale);
                      },),
                      _settingsTile(Icons.delete_outline_sharp, "Delete Account", onTap: () {

                      },),

                      SizedBox(height: 15.sp),

                      // General
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            "General",
                            style: TextStyle(
                              fontFamily:
                              'GeneralSans-Semibold',
                              color: notifire.gettextcolor,
                              fontSize: 16.sp,)),
                      ),
                      SizedBox(height: 10.sp),

                      _settingsTile(Icons.star,  'Rate Us', onTap: () {
                        // _showHelpfulSheet();
                        RateUs().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Scale);
                      },),
                      _settingsTile(Icons.contact_support, "Contact Us", onTap: () {
                        MarchentContactUs().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Scale);
                      },),
                      _settingsTile(Icons.description, "Terms of Service", onTap: () {

                      },),
                      _settingsTile(Icons.privacy_tip, "Privacy Policy", onTap: () {

                      },),
                      _settingsTile(Icons.help_outline, "FAQ", onTap: () {

                      },),

                      SizedBox(height: 20.sp),

                      // Logout Button
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            SignupWelcome().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Scale);
                          },
                          icon:  Icon(Icons.logout, color: Colors.white,size: 18.sp,),
                          label:   Container(margin: EdgeInsets.only(top: 0.sp, bottom: 0, left: 0.sp, right: 0.sp),
                            child: Text(
                              "Logout",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: 'GeneralSans-Medium',
                                  color: Colors.white),
                            ),),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttonsColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.sp),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 30.sp),
                    ],
                  ),
                ),
              )),
        ),));
  }

  // Settings Tile Widget (kept inside same class)
  Widget _settingsTile(IconData icon, String title, {required VoidCallback onTap}) {
    return Container(
      margin:  EdgeInsets.only(bottom: 13.sp),
      decoration: BoxDecoration(
        border: Border.all(color: borderColorvalue),
        color: textBoxbgColor,
        borderRadius: BorderRadius.circular(14.sp),
      ),
      child: ListTile(
        leading: Icon(icon, color: textColorSecond),
        title: Text(
          title,
          style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'GeneralSans-Medium',
              color: textColorSecond),
        ),
        trailing: Icon(Icons.arrow_forward_ios,color: textColorSecond,size: 17.sp,),
        onTap: onTap,
      ),
    );
  }
  Widget _buildProfileImage() {
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
                      height:50.sp,
                      width: 50.sp,
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
  void _showHelpfulSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.sp)),
      ),
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter mystate) {
              return Container(
                padding: EdgeInsets.all(20.sp),
                height: 70.sp,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Are you finding us helpful?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 17.sp,
                          fontFamily: 'GeneralSans-Semibold',
                          color: notifire.getprimetextcolor),
                    ),
                    SizedBox(height: 10.sp),
                    Text(
                      'Please share your experience with us.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: 'GeneralSans-Medium',
                          color: notifire.gettext1color),
                    ),
                    SizedBox(height: 20.sp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                // Handle Yes Option
                                rateApp();
                              },
                              child: CircleAvatar(
                                radius: 20.sp,
                                backgroundColor: Colors.yellow[100],
                                child:
                                Text("😊", style: TextStyle(fontSize: 20.sp)),
                              ),
                            ),
                            SizedBox(height: 10.sp),
                            Text(
                              'Yes, Loving it',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: 'GeneralSans-Medium',
                                  color: primeTextColor2),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                // Handle No Option
                                rateApp();
                              },
                              child: CircleAvatar(
                                radius: 20.sp,
                                backgroundColor: Colors.grey[200],
                                child:
                                Text("😟", style: TextStyle(fontSize: 20.sp)),
                              ),
                            ),
                            SizedBox(height: 10.sp),
                            Text(
                              'No, Not really',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: 'GeneralSans-Medium',
                                  color: primeTextColor2),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20.sp),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Remind me later',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: 'GeneralSans-Medium',
                            color: notifire.gettext1color),
                      ),
                    )
                  ],
                ),
              );
            });
      },
    );
  }

  Future<void> rateApp() async {
    final InAppReview inAppReview = InAppReview.instance;
    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview(); // native dialog
    } else {
      // fallback to store page
      inAppReview.openStoreListing(
        appStoreId: '123456789', // Replace with your iOS App ID
        microsoftStoreId: '',    // Optional
      );
    }
  }
  void _showCommunicationSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.sp)),
      ),
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter mystate) {
              return Container(
                padding: EdgeInsets.all(20.sp),
                height: 70.sp,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildToggleTile(
                        title: "Receive promotional content via email/whatsapp",
                        subtitle:
                        "Promotional mailers give you exclusive offers and fresh launches from 99acres and partner websites directly into your box and in relation with your activity",
                        value: promotionalEmails,
                        onChanged: (value) {
                          mystate(() {
                            promotionalEmails = value;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      _buildToggleTile(
                        title: "Receive push notifications",
                        subtitle:
                        "Alerts for curated properties and projects based on your interests",
                        value: pushNotifications,
                        onChanged: (value) {
                          mystate(() {
                            pushNotifications = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              );
            });
      },
    );
  }

  Widget _buildToggleTile({
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: 'GeneralSans-Semibold',
                    color: notifire.getprimetextcolor),
              ),
              SizedBox(height: 5.sp),
              Text(
                subtitle,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'GeneralSans-Medium',
                    color: notifire.gettext1color),
              ),
              // SizedBox(height: 10.sp),
            ],
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: primeTextColor2,
        )
      ],
    );
  }

  void signoutSheetMenu() {
    showModalBottomSheet(
        backgroundColor: notifire.containercolore,
        isDismissible: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        builder: (builder) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: screenHeight(context) * 0.02),
              Container(
                  height: 6,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(25))),
              SizedBox(height: screenHeight(context) * 0.02),
              Text(
                "Logout",
                style: TextStyle(
                    fontSize: 18.sp,
                    fontFamily: 'GeneralSans-Semibold',
                    color: notifire.getprimetextcolor),
              ),
              SizedBox(height: screenHeight(context) * 0.01),
              Container(
                margin: EdgeInsets.only(
                    bottom: 0, top: 0, left: 15.sp, right: 15.sp),
                alignment: Alignment.center,
                child: Text(
                  textAlign: TextAlign.center,
                  "Are you sure would like to sign out of your New Keys account?",
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: 'GeneralSans-Medium',
                      color: notifire.gettextcolor),
                ),
              ),
              SizedBox(height: screenHeight(context) * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 48.sp,
                    height: 28.sp,
                    child: MaterialButton(
                        color: fieldbgColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.sp)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          textAlign: TextAlign.center,
                          "Cancel",
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: 'GeneralSans-Medium',
                              color: notifire.gettextcolor),
                        )),
                  ),
                  SizedBox(
                    width: 48.sp,
                    height: 28.sp,
                    child: MaterialButton(
                        color: buttonColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.sp)),
                        onPressed: () {
                        },
                        child: Text(
                          textAlign: TextAlign.center,
                          "Yes Logout",
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: 'GeneralSans-Medium',
                              color: primeryColor),
                        )),
                  )
                ],
              ),
              SizedBox(height: screenHeight(context) * 0.04),
            ],
          );
        });
  }
}

