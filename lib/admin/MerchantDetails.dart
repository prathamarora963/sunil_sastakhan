// ignore_for_file: unused_local_variable, prefer_final_fields, avoid_function_literals_in_foreach_calls, unused_field, deprecated_member_use
import 'package:SastaKhana/utils/mycolors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../globalwidgets/base_scaffold_body.dart';
import '../utils/color.dart';
import '../utils/colornotifire.dart';

class MerchantDetails extends StatefulWidget {
  const MerchantDetails({Key? key}) : super(key: key);

  @override
  _MerchantDetailsState createState() => _MerchantDetailsState();
}

class _MerchantDetailsState extends State<MerchantDetails> {
  late ColorNotifire notifire;
  bool status = false;
  final number = TextEditingController();
  List<String> _countryCodes = [];
  String? dropdownValue = "";
  int quantity = 2;
  @override
  void initState() {
    super.initState();

  }
  bool _isObscure = true;
  String? password;
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
                          "Merchant Details",
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
                          Container(
                            margin: EdgeInsets.only(
                                bottom: 0, top: 0.sp, left: 0.sp, right: 0),
                            child:Card( color: MyColors.whiteColor,
                              elevation: 3,
                              shadowColor:darkgrey_100,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius
                                      .circular(20.0))),
                              child:   Container(
                                  margin: EdgeInsets.only(
                                      bottom: 0, top: 0.sp, left: 0.sp, right: 0),
                                  child:ClipRRect(borderRadius: BorderRadius.circular(20.0),
                                    child: CachedNetworkImage(
                                      // maxHeightDiskCache:100,
                                      // maxWidthDiskCache: 90,
                                      // memCacheHeight: 100,
                                      // memCacheWidth: 90,
                                      height:50.sp,
                                      width: 50.sp,
                                      fit: BoxFit.fill,
                                      imageUrl: "https://randomuser.me/api/portraits/men/32.jpg"??'',
                                      placeholder: (context, url) => Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage("images/profile.png"),
                                              fit: BoxFit.fill,
                                            )),),
                                      errorWidget: (context, url, error) => Icon(Icons.error),
                                    ),)

                              ),),),
                          SizedBox(height: 15.sp),
                          Text(
                              "Mathew Fernandes",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontFamily: 'GeneralSans-Semibold',
                                  color: textColor
                              )
                          ),

                          SizedBox(height: 20.sp),
                          _infoRow(Icons.location_on_outlined, "Address:",
                              "123/456, green valley road,sagar nagar, delhi, 200002"),
                          SizedBox(height: 14.sp),
                          _infoRow(Icons.call, "Contact:", "+91-9000009999"),
                          SizedBox(height: 14.sp),
                          _infoRow(
                              Icons.email_outlined, "Email :", "myrahulmehta@gmail.com"),
                          SizedBox(height: 16),
                         Divider(color: buttonColor,height: 2.sp,),

                          SizedBox(height: 16),
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
                          SizedBox(height: 0.sp),
                          _imageGrid(),
                          SizedBox(height: 10.sp),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Row(children: [
                                Icon(Icons.store_sharp, size: 25.sp, color: buttonColor),
                                SizedBox(width: 10.sp,),
                                Text(
                                  "Restaurant",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontFamily: 'GeneralSans-bold',
                                      color: textColor),
                                ),
                              ],)
                          ),
                          SizedBox(height: 12.sp),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                textAlign: TextAlign.left,
                                "About The Daily Bread Bakery",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontFamily: 'GeneralSans-Semibold',
                                    color: textColor),
                              ),
                          ),
                          SizedBox(height: 10.sp),
                          _aboutText(),
                          SizedBox(height: 18.sp),
                          _keyDetailsCard(),
                          SizedBox(height: 15.sp),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Uploaded Documents",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: 'GeneralSans-Semibold',
                                    color: textColor),
                              ),
                          ),
                          SizedBox(height: 15.sp),
                          Padding(
                            padding:  EdgeInsets.all(0),
                            child: Column(
                              children: [
                                _documentTile(
                                  context,
                                  title: "FSSAI Certificate",
                                ),
                                _documentTile(
                                  context,
                                  title: "Merchant Identity",
                                ),
                                _documentTile(
                                  context,
                                  title: "PAN Card",
                                ),
                                _documentTile(
                                  context,
                                  title: "Other Document",
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Merchant Status",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: 'GeneralSans-Semibold',
                                  color: textColor),
                            ),
                          ),
                          SizedBox(height: 15.sp),
                          _statusToggle(),
                          SizedBox(height: 18.sp),
                          Container(
                            margin:  EdgeInsets.only(bottom: 14.sp),
                            padding:  EdgeInsets.symmetric(horizontal: 14.sp, vertical: 14.sp),
                            decoration: BoxDecoration(
                              color: BoxShadowColorValue,
                              borderRadius: BorderRadius.circular(12.sp),
                              border: Border.all(color: Colors.grey.shade400),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.delete_outline_sharp, color: textColor,size: 18.sp,),
                                SizedBox(width: 12.sp),
                                Expanded(
                                  child: Text(
                                    "Delete Merchant",
                                    style:TextStyle(
                                        fontSize: 15.sp,
                                        fontFamily: 'GeneralSans-Medium',
                                        color: textColorSecond),
                                  ),
                                ),
                                Icon(Icons.chevron_right,color: textColor,size: 18.sp,),
                              ],
                            ),
                          ),

                          SizedBox(height: 30.sp),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.sp),
                  ],
                )
            ),
          ),),)

    );

  }
  // ================= Buttons =================
  Widget _actionButton(IconData icon, String text) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 16.sp, color: Colors.white),
      label:  Text(
        maxLines: 1,
        text,
        style: TextStyle(
            fontSize: 15.sp,
            fontFamily: 'GeneralSans-Medium',
            color: Colors.white),
      ),
      style: OutlinedButton.styleFrom(
        backgroundColor: buttonColor,
        side:  BorderSide(color: buttonColor),
        padding:  EdgeInsets.symmetric(vertical: 10.sp,horizontal: 15.sp),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.sp),
        ),
      ),
    );
  }

  // ================= Info Row =================
  Widget _infoRow(IconData icon, String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: textColor),
        SizedBox(width: 10.sp),
        Text(
          title,
          style: TextStyle(
              fontSize: 15.sp,
              fontFamily: 'GeneralSans-Semibold',
              color: textColor),
        ),
        SizedBox(width: 10.sp),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
                fontSize: 15.sp,
                fontFamily: 'GeneralSans-Medium',
                color: textColorSecond),
          ),
        ),
      ],
    );
  }

  // =================== Top Image ===================
  Widget _profileImage() {
    return Container(
      margin: EdgeInsets.only(
          bottom: 0, top: 0.sp, left: 0.sp, right: 0),
      child:Card( color: MyColors.whiteColor,
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

  // =================== Images ===================
  Widget _imageGrid() {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 0.sp),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.2,
        children: List.generate(
          5,
              (index) => ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              "https://images.unsplash.com/photo-1504674900247-0877df9cc836",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }


  // =================== About ===================
  Widget _aboutText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.sp),
      child:
      Text(
        "The Daily Bread Bakery offers a delightful selection of freshly baked goods, from artisan breads to delectable pastries. We use only the finest local ingredients to bring you quality and taste in every bite. Committed to reducing food waste, we proudly offer Surprise Bags daily, allowing you to enjoy premium products at discounted prices while helping the environment.",
        style: TextStyle(
            fontSize: 14.sp,
            height: 1.5,
            fontFamily: 'GeneralSans-Medium',
            color: textColorSecond),
      ),
    );
  }

  // =================== Key Details ===================
  Widget _keyDetailsCard() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        padding:  EdgeInsets.all(15.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.sp),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Key Details",
              style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'GeneralSans-Semibold',
                  color: textColor),
            ),
            SizedBox(height: 10.sp),
            _detailRow(Icons.access_time, "Operating Hours:",
                "Mon-Sat: 8:00 AM - 8:00 PM\nSun: 9:00 AM - 6:00 PM"),
            _detailRow(Icons.call, "Contact:", "+91 98765 43210"),
            _detailRow(Icons.email, "Email:", "dailybreadbakery@gmail.com"),
            _detailRow(Icons.badge, "PAN No:", "ASDF34669X765"),
            _detailRow(Icons.receipt_long, "GST No:",
                "123456ASDF34669X765"),
          ],
        ),
      ),
    );
  }

  Widget _detailRow(IconData icon, String title, String value) {
    return Padding(
      padding: EdgeInsets.only(top: 10.sp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 17.sp, color: textColor),
          SizedBox(width: 10.sp),
          Text(
            "$title ",
            style: TextStyle(
                fontSize: 15.sp,
                fontFamily: 'GeneralSans-Semibold',
                color: textColor),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: 'GeneralSans-Medium',
                  color: textColorSecond),

            ),
          ),
        ],
      ),
    );
  }
  // ================= Document Tile =================
  Widget _documentTile(BuildContext context, {required String title}) {
    return Container(
      margin:  EdgeInsets.only(bottom: 14.sp),
      padding:  EdgeInsets.symmetric(horizontal: 14.sp, vertical: 12.sp),
      decoration: BoxDecoration(
        color: BoxShadowColorValue,
        borderRadius: BorderRadius.circular(12.sp),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Row(
        children: [
          Icon(Icons.cloud_upload_outlined, color: textColor,size: 18.sp,),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style:TextStyle(
                fontSize: 15.sp,
                fontFamily: 'GeneralSans-Medium',
                color: textColorSecond),
            ),
          ),
          TextButton(
            onPressed: () => _openDocument(context, title),
            child: Text("View", style:TextStyle(
                fontSize: 16.sp,
                fontFamily: 'GeneralSans-Medium',
                color: textColorSecond),),
          ),
          Icon(Icons.chevron_right,color: textColor,size: 18.sp,),
        ],
      ),
    );
  }
  // ================ Open Document =================
  void _openDocument(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: const Text(
          "This is where the document will be opened.\n\n"
              "You can load PDF, Image, or Web URL here.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

  // ================= Toggle UI =================
  bool isMerchantActive = true;
  Widget _statusToggle() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 5.sp),
      decoration: BoxDecoration(
        color: BoxShadowColorValue,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(12.sp),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            isMerchantActive ? "Active" : "Inactive",
            style:TextStyle(
                fontSize: 15.sp,
                fontFamily: 'GeneralSans-Medium',
                color: textColorSecond),
          ),
           SizedBox(width: 14.sp),
          Switch(
            value: isMerchantActive,
            activeColor: buttonColor,
            onChanged: (value) {
              setState(() {
                isMerchantActive = value;
              });
            },
          ),
        ],
      ),
    );
  }
}



