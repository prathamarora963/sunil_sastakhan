
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../utils/colornotifire.dart';
import '../globalwidgets/base_scaffold_body.dart';
import '../utils/botton.dart';
import '../utils/color.dart';
import '../utils/color.dart' as MyColors;
import '../utils/ctextfield.dart';
import '../utils/globalwidgets.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  EditProfileState createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  late ColorNotifire notifire;

  String name='';
  String email='';
  String phone='';
  String agent='';
  String? profileimage;
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      appBar: otherHeader(context,"Edit Profile"),
        backgroundColor: lightgreyColor,
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
                      SizedBox(height: 20.sp),
                      _buildProfileImage(),
                      SizedBox(height: 30.sp),
                      Customtextfild.textField1(
                        controller: nameController,
                        name1: "Full Name",
                        labelclr: Colors.grey,
                        textcolor: notifire.getwhitecolor,
                        keyboardType: TextInputType.text, context: context,
                        fieldBg: notifire.getfieldbg,
                      ),
                      SizedBox(height: 15.sp),
                      Customtextfild.textField1(
                        controller: emailController,
                        name1: "Email",
                        labelclr: Colors.grey,
                        textcolor: notifire.getwhitecolor,
                        keyboardType: TextInputType.emailAddress, context: context,
                        fieldBg: notifire.getfieldbg,
                      ),
                      SizedBox(height: 15.sp),
                      Customtextfild.textFieldEnable(
                        controller: numberController,
                        name1: "Phone Number",
                        labelclr: Colors.grey,
                        textcolor: notifire.getwhitecolor,
                        keyboardType: TextInputType.number, context: context,
                        fieldBg: notifire.getfieldbg,
                          enabledFlag:false
                      ),

                      SizedBox(height: 30.sp),
                      GestureDetector(
                        onTap: () {
                          // updateUserInfo();
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              bottom: 0, top: 0, left: 15.sp, right: 15.sp),
                          height: 25.sp,
                          child: Custombutton.button2(
                            notifire.getbuttonscolor,
                            "Update",
                            25.sp,
                            double.infinity,
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
          Positioned(
              bottom: 10.sp,
              right: 0.sp,
              child: InkWell(onTap: () {
                takenProfileImageTyepPopup();
              },
                child: Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: redColorvalue,
                    size: 22.sp,
                  ),
                ),)
          ),
        ],
      ),
    );
  }
  void takenProfileImageTyepPopup() {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Container(
          height: 50.sp,
          margin:  EdgeInsets.only(bottom: 0, top: 0, left: 10.sp, right: 10.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin:  EdgeInsets.only(
                    bottom: 10.sp, top: 5.sp, left: 0, right: 5.sp),
                child: Text(
                  "Select Profile Image" ,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: MyColors.textColor,
                    fontFamily: "GeneralSans-Bold",
                    fontSize: 16.sp,
                  ),
                ),
              ),
              Divider(height: 2,color: darkgrey_60,),
              InkWell(
                  onTap: () async {
                    Navigator.pop(context);
                    var image = await selectImageBySource(context,ImageSource.camera);
                    if (image != null) {
                      // uploadProfileImage(image);
                    }
                  },
                  child: Container(  margin:  EdgeInsets.only(
                      bottom: 0, top: 20.sp, left: 0, right: 0),
                      child: Row(children: [
                        Container(height:20.sp,width: 20.sp,child:  Icon(
                          Icons.camera_alt_outlined,
                          size: 20.sp,
                          color: MyColors.primaryColor,
                        )),
                        Expanded(child:  Container(
                          alignment: Alignment.topLeft,
                          margin:  EdgeInsets.only(
                              bottom: 0, top: 0, left: 10.sp, right: 2.sp),
                          child: Text(
                            "Capture Image From Camera",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: MyColors.textColor,
                              fontFamily: "GeneralSans-Medium",
                              fontSize: 14.sp,
                            ),
                          ),
                        ),)


                      ],))

              ),
              InkWell(
                  onTap: () async {
                    Navigator.pop(context);
                    var image = await selectImageBySource(context,ImageSource.gallery);
                    if (image != null) {
                      // uploadProfileImage(image);
                    }
                  },
                  child:Container(  margin:  EdgeInsets.only(
                      bottom: 0, top: 15.sp, left: 0, right: 0),
                      child:  Row(children: [
                        Container(height:20.sp,width: 20.sp,child:  Icon(
                          Icons.attachment_outlined,
                          size: 20.sp,
                          color: MyColors.primaryColor,
                        )), Container(
                          alignment: Alignment.topLeft,
                          margin:  EdgeInsets.only(
                              bottom: 0, top: 0, left: 10.sp, right: 2.sp),
                          child: Text(
                            "Select Image From Gallery",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: MyColors.textColor,
                              fontFamily: "GeneralSans-Medium",
                              fontSize: 14.sp,
                            ),
                          ),
                        )
                      ],))
              ),

            ],
          )),
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
