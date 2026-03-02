import 'package:SastaKhana/controller/customer/home_controller.dart';
import 'package:SastaKhana/data/models/user_models/item_model.dart';
import 'package:SastaKhana/modules/shared_ui/ViewItem.dart';
import 'package:SastaKhana/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../globalwidgets/base_scaffold_body.dart';
import '../../utils/color.dart';
import '../../utils/colornotifire.dart';
import 'ViewCart.dart';

class SuperDiscountsItems extends StatefulWidget {
  const SuperDiscountsItems({Key? key}) : super(key: key);

  @override
  _SuperDiscountsItemsState createState() => _SuperDiscountsItemsState();
}

class _SuperDiscountsItemsState extends State<SuperDiscountsItems> {
  final HomeController homeController = Get.isRegistered<HomeController>()
      ? Get.find<HomeController>()
      : Get.put(HomeController());
  late ColorNotifire notifire;
  final Map<String, int> quantities = {};
  final Set<String> _requestedDetails = <String>{};

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
          ViewCart().launch(
            context,
            isNewTask: false,
            pageRouteAnimation: PageRouteAnimation.Scale,
          );
        },
        icon: const Icon(Icons.shopping_cart, color: Colors.white),
        label: Text(
          'View Cart',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.sp,
            fontFamily: 'GeneralSans-Semibold',
            color: white,
          ),
        ),
      ),
      body: Body(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
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
                          "Super Discount",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'GeneralSans-Bold',
                            color: notifire.gettextcolor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.sp),
                    Obx(() {
                      final items = homeController.supperDiscountItems;
                      if (items.isEmpty) {
                        return Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 30.sp),
                            child: Text(
                              "No super discount items",
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: 'GeneralSans-Medium',
                                color: textColorSecond,
                              ),
                            ),
                          ),
                        );
                      }

                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index];
                          final itemId = item.itemId ?? item.itemName ?? "$index";
                          final details = item.itemId == null
                              ? null
                              : homeController.itemDetailsById[item.itemId!];
                          final qty = quantities[itemId] ?? 0;
                          return InkWell(
                            onTap: () {
                              ViewItem(itemId: item.itemId).launch(
                                context,
                                isNewTask: false,
                                pageRouteAnimation: PageRouteAnimation.Scale,
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 15.sp),
                              padding: EdgeInsets.all(13.sp),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.sp),
                                border: Border.all(color: borderColorvalue),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 35.sp,
                                        height: 35.sp,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          image: DecorationImage(
                                            image: (_imageUrl(item).isEmpty)
                                                ? const AssetImage("images/logo.png")
                                                : NetworkImage(_imageUrl(item))
                                                    as ImageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10.sp),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    details?.itemName ??
                                                        item.itemName ??
                                                        "-",
                                                    style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontFamily:
                                                          'GeneralSans-Semibold',
                                                      color: notifire.gettextcolor,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 12.sp,
                                                    vertical: 8.sp,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: buttonColor
                                                        .withOpacity(0.15),
                                                    borderRadius:
                                                        BorderRadius.circular(20),
                                                  ),
                                                  child: Text(
                                                    "Active",
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      fontFamily:
                                                          'GeneralSans-Semibold',
                                                      color: buttonColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 8.sp),
                                                child: Text(
                                                details?.categoryName ??
                                                    item.merchantName ??
                                                    "-",
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontFamily:
                                                      'GeneralSans-Medium',
                                                  color: textColorSecond,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.sp),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${details?.numberOfItme ?? '--'} Available",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontFamily: 'GeneralSans-Semibold',
                                          color: notifire.gettextcolor,
                                        ),
                                      ),
                                      Text(
                                        "${details?.superDiscount ?? _discountPercent(item)}%",
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontFamily: 'GeneralSans-Semibold',
                                          color: redColorvalue,
                                        ),
                                      ),
                                      Text(
                                        "${details?.price ?? item.price ?? '0'} Rs",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontFamily: 'GeneralSans-Semibold',
                                          decoration: TextDecoration.lineThrough,
                                          decorationThickness: 2,
                                          color: textColorSecond,
                                        ),
                                      ),
                                      Text(
                                        "Rs ${details?.superDiscountPrice ?? item.superDiscountPrice ?? '0'}",
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontFamily: 'GeneralSans-Semibold',
                                          color: buttonColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.sp),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Add",
                                        style: TextStyle(
                                          fontFamily: 'GeneralSans-Semibold',
                                          color: textColor,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: buttonColor,
                                          border: Border.all(color: buttonColor),
                                          borderRadius:
                                              BorderRadius.circular(10.sp),
                                        ),
                                        child: Row(
                                          children: [
                                            _qtyButton(
                                              icon: Icons.remove,
                                              onTap: () {
                                                if (qty > 0) {
                                                  setState(() {
                                                    quantities[itemId] = qty - 1;
                                                  });
                                                }
                                              },
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 12.sp,
                                              ),
                                              child: Text(
                                                qty.toString(),
                                                style: TextStyle(
                                                  fontFamily:
                                                      'GeneralSans-Medium',
                                                  color: Colors.white,
                                                  fontSize: 15.sp,
                                                ),
                                              ),
                                            ),
                                            _qtyButton(
                                              icon: Icons.add,
                                              onTap: () {
                                                setState(() {
                                                  quantities[itemId] = qty + 1;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.sp),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }),
                    SizedBox(height: 40.sp),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _imageUrl(ItemModel item) {
    final details = item.itemId == null
        ? null
        : homeController.itemDetailsById[item.itemId!];
    if (details != null && details.itemsImage.isNotEmpty) {
      return details.itemsImage.first.image?.toImageUrl() ?? "";
    }
    if (item.itemsImage.isEmpty) return "";
    return item.itemsImage.first.image?.toImageUrl() ?? "";
  }

  int _discountPercent(ItemModel item) {
    final price = double.tryParse(item.price ?? "");
    final discountPrice = double.tryParse(item.superDiscountPrice ?? "");
    if (price == null || discountPrice == null || price <= 0) return 0;
    final percent = ((price - discountPrice) / price) * 100;
    return percent < 0 ? 0 : percent.round();
  }

  // void _ensureDetailsLoaded(List<ItemModel> items) {
  //   for (final item in items) {
  //     final id = item.itemId;
  //     if (id == null || id.isEmpty) continue;
  //     if (homeController.itemDetailsById.containsKey(id)) continue;
  //     if (_requestedDetails.contains(id)) continue;

  //     _requestedDetails.add(id);
  //     homeController
  //         .getItemDetails(id, showLoader: false, showError: false)
  //         .whenComplete(() => _requestedDetails.remove(id));
  //   }
  // }

  Widget _qtyButton({required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(5.sp),
        height: 20.sp,
        child: Icon(icon, size: 18.sp, color: Colors.white),
      ),
    );
  }
}
