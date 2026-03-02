import 'package:SastaKhana/controller/customer/home_controller.dart';
import 'package:SastaKhana/data/models/user_models/item_details_model.dart';
import 'package:SastaKhana/utils/extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../globalwidgets/base_scaffold_body.dart';
import '../../utils/color.dart';
import '../../utils/colornotifire.dart';
import 'ViewCart.dart';

class SuperDiscountItemDetails extends StatefulWidget {
  const SuperDiscountItemDetails({Key? key, required this.itemId})
      : super(key: key);

  final String itemId;

  @override
  _SuperDiscountItemDetailsState createState() =>
      _SuperDiscountItemDetailsState();
}

class _SuperDiscountItemDetailsState extends State<SuperDiscountItemDetails> {
  final HomeController homeController = Get.isRegistered<HomeController>()
      ? Get.find<HomeController>()
      : Get.put(HomeController());
  late ColorNotifire notifire;

  @override
  void initState() {
    super.initState();
    homeController.selectedItemDetails.value = null;
    homeController.getItemDetails(widget.itemId);
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Obx(() {
      final ItemDetailsModel? item = homeController.selectedItemDetails.value;

      return Scaffold(
        backgroundColor: notifire.backgrounde,
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(16.sp),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              padding: EdgeInsets.symmetric(vertical: 15.sp),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.sp),
              ),
            ),
            onPressed: () {
              ViewCart().launch(
                context,
                isNewTask: false,
                pageRouteAnimation: PageRouteAnimation.Scale,
              );
            },
            icon: const Icon(Icons.add, color: Colors.white),
            label: Text(
              "Order Now",
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'GeneralSans-Medium',
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: Body(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: item == null
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 28.sp),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    finish(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios_new_outlined,
                                    color: textColor,
                                    size: 3.h,
                                  ),
                                ),
                                Text(
                                  "Super Discount Details",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: 'GeneralSans-Bold',
                                    color: notifire.gettextcolor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15.sp),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.sp),
                              child: SizedBox(
                                height: 60.sp,
                                child: CachedNetworkImage(
                                  height: 60.sp,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                  imageUrl: _mainImage(item),
                                  placeholder: (context, url) => Container(
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("images/logo.png"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                            SizedBox(height: 15.sp),
                            if (item.itemsImage.isNotEmpty)
                              SizedBox(
                                child: GridView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    childAspectRatio: 1,
                                  ),
                                  itemCount: item.itemsImage.length,
                                  itemBuilder: (context, index) {
                                    final img = item.itemsImage[index];
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(12.sp),
                                      child: CachedNetworkImage(
                                        fit: BoxFit.fill,
                                        imageUrl: img.image?.toImageUrl() ?? "",
                                        placeholder: (context, url) => Container(
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage("images/logo.png"),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            SizedBox(height: 15.sp),
                            Text(
                              item.itemName ?? "-",
                              style: TextStyle(
                                fontFamily: 'GeneralSans-Semibold',
                                color: notifire.textcolor,
                                fontSize: 20.sp,
                              ),
                            ),
                            SizedBox(height: 15.sp),
                            Text(
                              item.itemDescription ?? "-",
                              style: TextStyle(
                                fontFamily: 'GeneralSans-Medium',
                                color: textColorSecond,
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(height: 12.sp),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Super Discount",
                                  style: TextStyle(
                                    fontFamily: 'GeneralSans-Semibold',
                                    color: textColorSecond,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12.sp,
                                    vertical: 10.sp,
                                  ),
                                  decoration: BoxDecoration(
                                    color: buttonColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    item.itemStatue == "1"
                                        ? "Available"
                                        : "Unavailable",
                                    style: TextStyle(
                                      fontFamily: 'GeneralSans-Semibold',
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.sp),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '₹${item.price ?? '0'}',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                SizedBox(width: 15.sp),
                                Text(
                                  '₹${item.superDiscountPrice ?? '0'}',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: buttonColor,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 14.sp,
                                    vertical: 10.sp,
                                  ),
                                  decoration: BoxDecoration(
                                    color: buttonsColororange,
                                    borderRadius: BorderRadius.circular(20.sp),
                                  ),
                                  child: Text(
                                    'Save ${_savedAmount(item)}',
                                    style: TextStyle(
                                      fontFamily: 'GeneralSans-Medium',
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 18.sp),
                            _infoCard(
                              child: Row(
                                children: [
                                  Icon(Icons.store,
                                      color: buttonColor, size: 20.sp),
                                  SizedBox(width: 12.sp),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.categoryName ?? "Store",
                                          style: TextStyle(
                                            fontFamily: 'GeneralSans-Semibold',
                                            color: textColor,
                                            fontSize: 15.sp,
                                          ),
                                        ),
                                        SizedBox(height: 4.sp),
                                        Text(
                                          '${item.numberOfItme ?? '0'} Available',
                                          style: TextStyle(
                                            fontFamily: 'GeneralSans-Medium',
                                            color: textColorSecond,
                                            fontSize: 13.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(Icons.chevron_right,
                                      color: Colors.grey, size: 20.sp),
                                ],
                              ),
                            ),
                            SizedBox(height: 15.sp),
                            _infoCard(
                              child: Row(
                                children: [
                                  Icon(Icons.access_time,
                                      color: buttonColor, size: 18.sp),
                                  SizedBox(width: 12.sp),
                                  Text(
                                    'Pickup: ${item.pickupTimeFrom ?? '-'} - ${item.pickupTimeTo ?? '-'}',
                                    style: TextStyle(
                                      fontFamily: 'GeneralSans-Medium',
                                      color: textColor,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 40.sp),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      );
    });
  }

  Widget _infoCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: child,
    );
  }

  String _mainImage(ItemDetailsModel item) {
    if (item.itemsImage.isEmpty) return "";
    return item.itemsImage.first.image?.toImageUrl() ?? "";
  }

  String _savedAmount(ItemDetailsModel item) {
    final actual = double.tryParse(item.price ?? "");
    final discount = double.tryParse(item.superDiscountPrice ?? "");
    if (actual == null || discount == null) return '₹0';
    final saved = actual - discount;
    return '₹${saved.toStringAsFixed(2)}';
  }
}
