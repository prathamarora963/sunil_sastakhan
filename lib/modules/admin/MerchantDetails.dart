// ignore_for_file: unused_local_variable, prefer_final_fields, avoid_function_literals_in_foreach_calls, unused_field, deprecated_member_use
import 'package:SastaKhana/controller/admin/manage_merchant_controller.dart';
import 'package:SastaKhana/data/models/admin_models/merchant_details_model.dart';
import 'package:SastaKhana/utils/app_utils.dart';
import 'package:SastaKhana/utils/extensions.dart';
import 'package:SastaKhana/utils/mycolors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../globalwidgets/base_scaffold_body.dart';
import '../../utils/color.dart';
import '../../utils/colornotifire.dart';

class MerchantDetails extends StatefulWidget {
  const MerchantDetails({Key? key,required this.merchantId}) : super(key: key);
final String merchantId ; // Example merchant ID, replace with actual ID when available
  @override
  _MerchantDetailsState createState() => _MerchantDetailsState();
}

class _MerchantDetailsState extends State<MerchantDetails> {
  final ManageMerchantController _controller = ManageMerchantController();
  late ColorNotifire notifire;
  bool status = false;
  final number = TextEditingController();
  List<String> _countryCodes = [];
  String? dropdownValue = "";
  int quantity = 2;
  @override
  void initState() {
    _controller.fetchMerchantDetails(widget.merchantId);
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
                child: Obx((){
                  final merchantData=_controller.selectedMerchant.value;
                  return Column(crossAxisAlignment: CrossAxisAlignment.start,
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
                                      imageUrl: merchantData?.image.toImageUrl()??'',
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
                              merchantData?.contactPerson ?? "Unknown Merchant",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontFamily: 'GeneralSans-Semibold',
                                  color: textColor
                              )
                          ),

                          SizedBox(height: 20.sp),
                          _infoRow(Icons.location_on_outlined, "Address:",
                              merchantData?.address ?? "Unknown Address"),
                          SizedBox(height: 14.sp),
                          _infoRow(Icons.call, "Contact:", merchantData?.mobile ?? "Unknown Phone"),
                          SizedBox(height: 14.sp),
                          _infoRow(
                              Icons.email_outlined, "Email :", merchantData?.email ?? "Unknown Email"),
                          SizedBox(height: 16),
                         Divider(color: buttonColor,height: 2.sp,),

                          SizedBox(height: 16),
                          _profileImage(),
                          SizedBox(height: 12.sp),
                          Text(
                              merchantData?.fName ?? "Unknown Shop",
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
                          // _imageGrid(merchantData?.shopImage),
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
                                "About ${merchantData?.fName ?? "the shop"}",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontFamily: 'GeneralSans-Semibold',
                                    color: textColor),
                              ),
                          ),
                          SizedBox(height: 10.sp),
                          _aboutText(),
                          SizedBox(height: 18.sp),
                          _keyDetailsCard(merchantData),
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
                                  imageUrl: _resolveDocumentImage(merchantData?.fssaiDoc),
                                ),
                                _documentTile(
                                  context,
                                  title: "Merchant Identity",
                                  imageUrl: _resolveDocumentImage(merchantData?.merchantIdentity),
                                ),
                                _documentTile(
                                  context,
                                  title: "PAN Card",
                                  imageUrl: _resolveDocumentImage(merchantData?.panCard),
                                ),
                                _documentTile(
                                  context,
                                  title: "Other Document",
                                  imageUrl: _resolveDocumentImage(merchantData?.otherDoc),
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
                          GestureDetector(
                            onTap: () {
                              _showDeleteMerchantDialog(merchantData?.id ?? "");
                            },
                            child: Container(
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
                          ),

                          SizedBox(height: 30.sp),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.sp),
                  ],
                );
            
                })),
          ),),)

    );

  }

  void _showDeleteMerchantDialog(String merchantId) {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.sp),
        ),
        titlePadding: EdgeInsets.fromLTRB(16.sp, 16.sp, 16.sp, 8.sp),
        contentPadding: EdgeInsets.fromLTRB(16.sp, 0, 16.sp, 10.sp),
        actionsPadding: EdgeInsets.fromLTRB(12.sp, 0, 12.sp, 12.sp),
        title: Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: Colors.red.shade600, size: 22.sp),
            SizedBox(width: 8.sp),
            Expanded(
              child: Text(
                "Delete Merchant",
                style: TextStyle(
                  fontSize: 17.sp,
                  fontFamily: 'GeneralSans-Semibold',
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
        content: Text(
          "This action will permanently remove this merchant account. Do you want to continue?",
          style: TextStyle(
            fontSize: 14.5.sp,
            fontFamily: 'GeneralSans-Medium',
            color: textColorSecond,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              "Cancel",
              style: TextStyle(
                fontSize: 14.5.sp,
                fontFamily: 'GeneralSans-Medium',
                color: textColorSecond,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade600,
              foregroundColor: Colors.white,
              elevation: 0,
              padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 8.sp),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.sp),
              ),
            ),
            onPressed: () {
              if (merchantId.isEmpty) {
                Fluttertoast.showToast(msg: "Merchant id not found");
                Get.back();
                return;
              }
              Get.find<ManageMerchantController>().deleteMerchant(merchantId);
               Get.back();
            },
            child: Text(
              "Delete",
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'GeneralSans-Semibold',
              ),
            ),
          ),
        ],
      ),
      barrierDismissible: false,
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
  Widget _imageGrid(List<ShopImage>? images) {
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
          images?.length??0,
              (index) => ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              images![index].imageName.toImageUrl(),
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
  Widget _keyDetailsCard(MerchantDetailsModel? merchantData) {
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
                ""),
                ...List.generate(merchantData?.businessTiming.length??0, (index) {
                  final hours = merchantData!.businessTiming[index];
                  return Padding(
                    padding: EdgeInsets.only(left: 20.sp, top: 4.sp),
                    child: Text(
                      "${hours.day}: ${hours.fromTiming} - ${hours.toTiming}",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'GeneralSans-Medium',
                          color: textColorSecond),
                    ),
                  );
                }),
            _detailRow(Icons.call, "Contact:", "${merchantData?.mobile}"),
            _detailRow(Icons.email, "Email:", "${merchantData?.email}"),
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
  Widget _documentTile(
    BuildContext context, {
    required String title,
    required String imageUrl,
  }) {
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
            onPressed: () => _openDocument(context, title: title, imageUrl: imageUrl),
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
  void _openDocument(
    BuildContext context, {
    required String title,
    required String imageUrl,
  }) {
    if (imageUrl.isEmpty) {
      Utils.showErrorDialog("No document image available");
      return;
    }

    showDialog(
      context: context,
      builder: (_) => Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 20.sp),
        backgroundColor: Colors.transparent,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.sp),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.contain,
                placeholder: (_, __) => Container(
                  height: 65.h,
                  color: Colors.black12,
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(),
                ),
                errorWidget: (_, __, ___) => Container(
                  height: 40.h,
                  color: Colors.black12,
                  alignment: Alignment.center,
                  child: Text(
                    "Unable to load $title",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: 'GeneralSans-Medium',
                      color: textColor,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 8.sp,
              right: 8.sp,
              child: Material(
                color: Colors.black45,
                shape: const CircleBorder(),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () => Navigator.pop(context),
                  child: Padding(
                    padding: EdgeInsets.all(6.sp),
                    child: Icon(Icons.close, color: Colors.white, size: 16.sp),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _resolveDocumentImage(dynamic documentPath) {
    final rawPath = documentPath?.toString().trim() ?? "";
    if (rawPath.isEmpty || rawPath.toLowerCase() == "null") {
      return "";
    }

    if (rawPath.startsWith("http://") || rawPath.startsWith("https://")) {
      return rawPath;
    }

    return rawPath.toImageUrl();
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


