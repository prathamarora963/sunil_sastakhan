import 'package:SastaKhana/controller/customer/home_controller.dart';
import 'package:SastaKhana/data/models/user_models/item_model.dart';
import 'package:SastaKhana/utils/extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart' hide whiteColor;
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../globalwidgets/base_scaffold_body.dart';
import '../../utils/color.dart';
import '../../utils/colornotifire.dart';
import 'ViewCart.dart';

class ItemsList extends StatefulWidget {
  const ItemsList({Key? key}) : super(key: key);

  @override
  _ItemsListState createState() => _ItemsListState();
}

class _ItemsListState extends State<ItemsList> {
  final HomeController homeController = Get.isRegistered<HomeController>()
      ? Get.find<HomeController>()
      : Get.put(HomeController());
  late ColorNotifire notifire;
  bool status = false;
  final number = TextEditingController();
  String? dropdownValue = "";
  final Map<String, int> quantities = {};
  @override
  void initState() {
    super.initState();
    if (homeController.homeItems.isEmpty) {
      homeController.fetchHomeItems(reset: true, showOverlayLoader: true);
    }
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
                    Expanded(
                      child: Obx(() {
                        final items = homeController.homeItems;
                        // final isInitialLoading =
                        //     homeController.isInitialLoading.value;
                        final isLoadingMore = homeController.isLoadingMore.value;

                        // if (isInitialLoading && items.isEmpty) {
                        //   return const Center(child: CircularProgressIndicator());
                        // }

                        if (items.isEmpty) {
                          return Center(
                            child: Text(
                              "No items found",
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: 'GeneralSans-Medium',
                                color: textColorSecond,
                              ),
                            ),
                          );
                        }

                        return RefreshIndicator(
                          onRefresh: () => homeController.fetchHomeItems(
                            reset: true,
                            showOverlayLoader: false,
                          ),
                          child: ListView.builder(
                            controller: homeController.scrollController,
                            scrollDirection: Axis.vertical,
                            padding: EdgeInsets.zero,
                            itemCount: items.length + (isLoadingMore ? 1 : 0),
                            itemBuilder: (context, index) {
                              if (index >= items.length) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12.sp),
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              }
                              return _itemCard(items[index]);
                            },
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 20.sp),
                  ],
                )
            )),)

    );

  }
  Widget _itemCard(ItemModel item) {
    final itemId = item.itemId ?? item.itemName ?? "unknown";
    final qty = quantities[itemId] ?? 0;
    return Card(
      margin: EdgeInsets.only(bottom: 15.sp),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.sp),
      ),
      elevation: 3,
      child: Container(
        margin: EdgeInsets.zero,
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
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.sp),
                    topRight: Radius.circular(15.sp),
                  ),
                  child: CachedNetworkImage(
                    height: 50.sp,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    imageUrl: _itemImageUrl(item),
                    placeholder: (context, url) => Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/logo.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.sp, vertical: 8.sp),
                    decoration: BoxDecoration(
                      color: buttonsColororange,
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    child: Text(
                      "${_discountPercent(item)} %",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontFamily: 'GeneralSans-Medium',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.merchantName ?? "-",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'GeneralSans-Semibold',
                      color: textColor,
                    ),
                  ),
                  SizedBox(height: 5.sp),
                  Text(
                    item.itemName ?? "-",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'GeneralSans-Medium',
                      color: textColorSecond,
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              "${item.superDiscountPrice ?? '0'} Rs",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: 'GeneralSans-Semibold',
                                color: buttonColor,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 15.sp),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "${item.price ?? '0'} Rs",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: 'GeneralSans-Semibold',
                                  decoration: TextDecoration.lineThrough,
                                  decorationThickness: 2,
                                  color: textColorSecond,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
                                if (qty > 0) {
                                  setState(() => quantities[itemId] = qty - 1);
                                }
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.sp),
                              child: Text(
                                qty.toString(),
                                style: TextStyle(
                                  fontFamily: 'GeneralSans-Medium',
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                ),
                              ),
                            ),
                            _qtyButton(
                              icon: Icons.add,
                              onTap: () {
                                setState(() => quantities[itemId] = qty + 1);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.sp),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, size: 15.sp),
                      SizedBox(width: 8.sp),
                      Text(
                        "1.2 km",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'GeneralSans-Medium',
                          color: textColorSecond,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _itemImageUrl(ItemModel item) {
    if (item.itemsImage.isEmpty) return "";
    return item.itemsImage.first.image?.toImageUrl() ?? "";
  }

  int _discountPercent(ItemModel item) {
    final original = double.tryParse(item.price ?? "");
    final discounted = double.tryParse(item.superDiscountPrice ?? "");
    if (original == null || discounted == null || original <= 0) return 0;
    final discount = ((original - discounted) / original) * 100;
    return discount < 0 ? 0 : discount.round();
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

