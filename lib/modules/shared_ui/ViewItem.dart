
import 'dart:io';
import 'package:SastaKhana/controller/customer/home_controller.dart';
import 'package:SastaKhana/data/models/user_models/item_details_model.dart';
import 'package:SastaKhana/utils/extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../merchent/MerchentBottombar.dart';
import '../../globalwidgets/base_scaffold_body.dart';
import '../../main.dart';
import '../../utils/color.dart';
import '../../utils/colornotifire.dart';
import '../../utils/commonutills.dart';
import '../merchent/CreateItems.dart';

class ViewItem extends StatefulWidget {
  const ViewItem({Key? key, this.itemId}) : super(key: key);
  final String? itemId;

  @override
  _ViewItemState createState() => _ViewItemState();
}

class _ViewItemState extends State<ViewItem> {
  final HomeController homeController = Get.isRegistered<HomeController>()
      ? Get.find<HomeController>()
      : Get.put(HomeController());
  late ColorNotifire notifire;
  bool status = false;
  final number = TextEditingController();
  String? dropdownValue = "";

  int quantity = 2;
  @override
  void initState() {
    super.initState();
    _loadItemDetails();
  }

  void _loadItemDetails() {
    final id = widget.itemId ??
        (homeController.homeItems.isNotEmpty
            ? homeController.homeItems.first.itemId
            : null);
    if (id != null && id.isNotEmpty) {
      homeController.selectedItemDetails.value = null;
      homeController.getItemDetails(id);
    }
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Obx(() {
      final ItemDetailsModel? item = homeController.selectedItemDetails.value;

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
            onPressed: () {},
            icon: const Icon(Icons.add, color: Colors.white),
            label:  Text(
              "Add",
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
          child: item == null
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
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
                          "View Item",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'GeneralSans-Bold',
                              color: notifire.gettextcolor),
                        ),),
                    ]),
                    Container( height: 60.sp,
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
                        imageUrl: item.itemsImage.isNotEmpty
                            ? (item.itemsImage.first.image?.toImageUrl() ?? "")
                            : "",
                        placeholder: (context, url) => Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("images/logo.png"),
                                fit: BoxFit.fill,
                              )),),
                        errorWidget: (context, url, error) => Icon(Icons.error),
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
                        itemCount: item.itemsImage.length,
                        itemBuilder: (context, index) {
                          final image = item.itemsImage[index];
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
                                imageUrl:  image.image?.toImageUrl() ?? "",
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
                    SizedBox(height: 15.sp),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                          item.itemName ?? "-",
                          style: TextStyle(
                            fontFamily:
                            'GeneralSans-Semibold',
                            color: notifire.textcolor,
                            fontSize: 16.sp,)),
                    ),
                    SizedBox(height:10.sp),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                          "Item Description",
                          style: TextStyle(
                            fontFamily:
                            'GeneralSans-Semibold',
                            color: textColorSecond,
                            fontSize: 14.sp,)),
                    ),
                    SizedBox(height:10.sp),
                    Container(
                      padding:  EdgeInsets.all(10.sp),
                      decoration: BoxDecoration(
                        border: Border.all(color: borderColorvalue),
                        borderRadius: BorderRadius.circular(12.sp),
                      ),
                      child: Text(
                          item.itemDescription ?? "-",
                          style: TextStyle(
                            fontFamily:
                            'GeneralSans-Medium',
                            color: textColorSecond,
                            fontSize: 14.sp,)),
                    ),
                    SizedBox(height:10.sp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(margin: EdgeInsets.only(top: 0.sp, bottom: 0, left: 0.sp, right: 0.sp),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${item.numberOfItme ?? '0'} Available",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: 'GeneralSans-Semibold',
                                color: notifire.gettextcolor),
                          ),),
                        Container(margin: EdgeInsets.only(top: 0.sp, bottom: 0, left: 0.sp, right: 0.sp),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${item.superDiscount ?? '0'}%",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontFamily: 'GeneralSans-Semibold',
                                color: redColorvalue),
                          ),),
                        Container(margin: EdgeInsets.only(top: 0.sp, bottom: 0, left: 0.sp, right: 0.sp),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${item.price ?? '0'} Rs",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: 'GeneralSans-Semibold',
                                decoration: TextDecoration.lineThrough,
                                decorationThickness: 2,
                                color: textColorSecond),
                          ),),
                        Container(margin: EdgeInsets.only(top: 0.sp, bottom: 0, left: 0.sp, right: 0.sp),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Rs ${item.superDiscountPrice ?? '0'}",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontFamily: 'GeneralSans-Semibold',
                                color: buttonColor),
                          ),),

                      ],
                    ),
                    SizedBox(height:15.sp),
                    /// PICKUP TIME
                    Row(
                      children:  [
                        Icon(Icons.access_time, size: 18, color: textColorSecond),
                        SizedBox(width: 6),
                        Text(
                            "Pickup: ${item.pickupTimeFrom ?? '-'} - ${item.pickupTimeTo ?? '-'}",
                            style: TextStyle(
                              fontFamily:
                              'GeneralSans-Semibold',
                              color: textColorSecond,
                              fontSize: 14.sp,)),
                      ],
                    ),
                    SizedBox(height:10.sp),
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
                              item.itemStatue == "1" ? "Available" : "Unavailable",
                              style: TextStyle(
                                fontFamily:
                                'GeneralSans-Semibold',
                                color: Colors.white,
                                fontSize: 14.sp,)),
                        ),
                      ],
                    ),
                    SizedBox(height:15.sp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "Add",
                            style: TextStyle(
                              fontFamily:
                              'GeneralSans-Semibold',
                              color: textColor,
                              fontSize: 20.sp,)),
                        Row(
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
                                    'GeneralSans-Semibold',
                                    color: textColor,
                                    fontSize: 16.sp,)),
                            ),
                            _qtyButton(
                              icon: Icons.add,
                              onTap: () {
                                setState(() => quantity++);
                              },
                            ),
                          ],
                        )
                      ],
                    ),


                    SizedBox(height: 40.sp),
                  ],
                ),
              ),
            ),
          ),),)

    );
    });

  }
  Widget _qtyButton({required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 20),
      ),
    );
  }
}
