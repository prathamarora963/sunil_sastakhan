import 'dart:async';
import 'dart:ui';
import 'package:SastaKhana/controller/customer/home_controller.dart';
import 'package:SastaKhana/data/models/user_models/item_model.dart';
import 'package:SastaKhana/utils/extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:upgrader/upgrader.dart';
import '../../globalwidgets/base_scaffold_body.dart';
import '../shared_ui/ViewItem.dart';
import 'Filter.dart';
import 'ItemsList.dart';
import 'LiveCampaignList.dart';
import 'MarchentCampaign.dart';
import 'SuperDiscountItemDetails.dart';
import 'SuperDiscountsItems.dart';
import '../../utils/color.dart';
import '../../utils/globalwidgets.dart';
import '../../utils/colornotifire.dart';
import 'package:provider/provider.dart';

class UserHome extends StatelessWidget {
  UserHome({Key? key}) : super(key: key);

  final HomeController homeController = Get.isRegistered<HomeController>()
      ? Get.find<HomeController>()
      : Get.put(HomeController());
  late ColorNotifire notifire;

  String getGreetingWithEmoji(String name) {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return "☀️ Good Morning, $name";
    } else if (hour >= 12 && hour < 17) {
      return "🌤 Good Afternoon, $name";
    } else if (hour >= 17 && hour < 21) {
      return "🌆 Good Evening, $name";
    } else {
      return "🌙 Good Night, $name";
    }
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.backgrounde,
      body: Body(
        child: SizedBox(
          height: screenHeight(context),
          width: screenWidth(context),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            child: Container(
              margin: EdgeInsets.only(
                top: 0.sp,
                bottom: 0,
                left: 15.sp,
                right: 15.sp,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //! ----- Top topItem List ------
                  SizedBox(height: 15.sp),
                  Padding(
                    padding: EdgeInsets.only(left: 0.sp, top: 0.sp),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        getGreetingWithEmoji("Neeraj"),
                        style: TextStyle(
                          fontFamily: 'GeneralSans-Bold',
                          color: notifire.textcolor,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 0.sp, top: 10.sp),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "You’re not hungry… you’re just food-curious 🤭",
                        style: TextStyle(
                          fontFamily: 'GeneralSans-Regular',
                          color: notifire.textcolor,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.sp),

                  /// Location Card
                  Container(
                    height: 50.sp,
                    padding: EdgeInsets.all(16.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.sp),
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://images.unsplash.com/photo-1502920514313-52581002a659",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          getData.read("CurentAdd") ?? "",
                          maxLines: 2,
                          style: TextStyle(
                            fontFamily: 'GeneralSans-Bold',
                            color: notifire.textcolor,
                            fontSize: 16.sp,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Filter().launch(
                              context,
                              isNewTask: false,
                              pageRouteAnimation: PageRouteAnimation.Scale,
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 14.sp,
                              vertical: 10.sp,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            child: Text(
                              "Explore Map",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'GeneralSans-Medium',
                                color: textColorSecond,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15.sp),

                  /// Super Discount
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Super Discount Near You",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'GeneralSans-Semibold',
                            color: textColor,
                          ),
                        ),
                      ),
                      InkWell(
                        child: Text(
                          "View All",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'GeneralSans-Semibold',
                            color: buttonColor,
                          ),
                        ),
                        onTap: () {
                          SuperDiscountsItems().launch(
                            context,
                            isNewTask: false,
                            pageRouteAnimation: PageRouteAnimation.Scale,
                          );
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: 15.sp),
                  Obx(() {
                    final discountItems = homeController.supperDiscountItems;
                    if (discountItems.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return SizedBox(
                      height: 61.sp,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: discountItems.length,
                        itemBuilder: (context, index) {
                          final item = discountItems[index];
                          return InkWell(
                          onTap: () {
                            SuperDiscountItemDetails(
                              itemId: item.itemId ?? "",
                            ).launch(
                              context,
                              isNewTask: false,
                              pageRouteAnimation: PageRouteAnimation.Scale,
                            );
                          },
                            child: Container(
                              width: 55.sp,
                              margin: EdgeInsets.only(right: 15.sp),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.sp),
                                color: Colors.white,
                              ),
                              child: Card(
                                elevation: 2,
                                shadowColor: darkgrey_100,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.sp),
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
                                            height: 43.sp,
                                            width: double.infinity,
                                            fit: BoxFit.fill,
                                            imageUrl: _itemImageUrl(item),
                                            placeholder: (context, url) =>
                                                Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    "images/logo.png",
                                                  ),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            errorWidget: (context, url, error) =>
                                                Icon(Icons.error),
                                          ),
                                        ),
                                        Positioned(
                                          top: 8,
                                          right: 8,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 12.sp,
                                              vertical: 8.sp,
                                            ),
                                            decoration: BoxDecoration(
                                              color: buttonsColororange,
                                              borderRadius:
                                                  BorderRadius.circular(15.sp),
                                            ),
                                            child: Text(
                                              "${_discountPercent(item)}%",
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
                                      padding: EdgeInsets.all(10.sp),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.merchantName ?? "-",
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontFamily: 'GeneralSans-Semibold',
                                              color: textColor,
                                            ),
                                          ),
                                          SizedBox(height: 5.sp),
                                          Text(
                                            item.itemName ?? "-",
                                            style: TextStyle(
                                              fontSize: 13.sp,
                                              fontFamily: 'GeneralSans-Medium',
                                              color: textColorSecond,
                                            ),
                                          ),
                                          SizedBox(height: 14.sp),
                                          Row(
                                            children: [
                                              Text(
                                                "${item.superDiscountPrice ?? '0'} Rs",
                                                style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontFamily:
                                                      'GeneralSans-Semibold',
                                                  color: buttonColor,
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                  left: 15.sp,
                                                ),
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "${item.price ?? '0'} Rs",
                                                  style: TextStyle(
                                                    fontSize: 16.sp,
                                                    fontFamily:
                                                        'GeneralSans-Semibold',
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    decorationThickness: 2,
                                                    color: textColorSecond,
                                                  ),
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
                            ),
                          );
                        },
                      ),
                    );
                  }),

                  SizedBox(height: 15.sp),

                  /// Live Campaigns
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Live Campaigns",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'GeneralSans-Semibold',
                            color: textColor,
                          ),
                        ),
                      ),
                      InkWell(
                        child: Text(
                          "View All",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'GeneralSans-Semibold',
                            color: buttonColor,
                          ),
                        ),
                        onTap: () {
                          LiveCampaignList().launch(
                            context,
                            isNewTask: false,
                            pageRouteAnimation: PageRouteAnimation.Scale,
                          );
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: 15.sp),

                  ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          MarchentCampaign().launch(
                            context,
                            isNewTask: false,
                            pageRouteAnimation: PageRouteAnimation.Scale,
                          );
                        },
                        child: Container(
                          height: 30.sp,
                          margin: EdgeInsets.only(bottom: 10.sp),
                          padding: EdgeInsets.all(0.sp),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13.sp),
                            color: Colors.white,
                          ),
                          child: Card(
                            elevation: 2,
                            shadowColor: darkgrey_100,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13.sp),
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    "https://picsum.photos/80?random=$index",
                                    height: 30.sp,
                                    width: 30.sp,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(width: 12.sp),
                                Expanded(
                                  child: Text(
                                    index == 0
                                        ? "The Daily Bread Bakery"
                                        : index == 1
                                        ? "The Elite Restaurant"
                                        : "Dhaba Beat",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: 'GeneralSans-Semibold',
                                      color: textColor,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12.sp,
                                    vertical: 8.sp,
                                  ),
                                  decoration: BoxDecoration(
                                    color: buttonsColororange,
                                    borderRadius: BorderRadius.circular(15.sp),
                                  ),
                                  child: Text(
                                    index == 2 ? "-50%" : "-30%",
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontFamily: 'GeneralSans-Medium',
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Icon(Icons.chevron_right, size: 20.sp),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 10.sp),

                  /// More Items
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "More Items",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'GeneralSans-Semibold',
                            color: textColor,
                          ),
                        ),
                      ),
                      InkWell(
                        child: Text(
                          "View All",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'GeneralSans-Semibold',
                            color: buttonColor,
                          ),
                        ),
                        onTap: () {
                          ItemsList().launch(
                            context,
                            isNewTask: false,
                            pageRouteAnimation: PageRouteAnimation.Scale,
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 15.sp),

                  Obx(() {
                    final homeItems = homeController.homeItems;
                    if (homeItems.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return GridView.builder(
                      itemCount: homeItems.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15.sp,
                        crossAxisSpacing: 15.sp,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) {
                        final item = homeItems[index];
                        return InkWell(
                          onTap: () {
                            ViewItem(itemId: item.itemId).launch(
                              context,
                              isNewTask: false,
                              pageRouteAnimation: PageRouteAnimation.Scale,
                            );
                          },
                          child: Container(
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
                                        height: 43.sp,
                                        width: double.infinity,
                                        fit: BoxFit.fill,
                                        imageUrl: _itemImageUrl(item),
                                        placeholder: (context, url) =>
                                            Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                "images/logo.png",
                                              ),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    ),
                                    Positioned(
                                      top: 8,
                                      right: 8,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12.sp,
                                          vertical: 8.sp,
                                        ),
                                        decoration: BoxDecoration(
                                          color: buttonsColororange,
                                          borderRadius: BorderRadius.circular(
                                            15.sp,
                                          ),
                                        ),
                                        child: Text(
                                          "${_discountPercent(item)}%",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.merchantName ?? "-",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: 'GeneralSans-Semibold',
                                          color: textColor,
                                        ),
                                      ),
                                      SizedBox(height: 5.sp),
                                      Text(
                                        item.itemName ?? "-",
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          fontFamily: 'GeneralSans-Medium',
                                          color: textColorSecond,
                                        ),
                                      ),
                                      SizedBox(height: 14.sp),
                                      Row(
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
                                            margin: EdgeInsets.only(
                                              left: 15.sp,
                                            ),
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "${item.price ?? '0'} Rs",
                                              style: TextStyle(
                                                fontSize: 16.sp,
                                                fontFamily:
                                                    'GeneralSans-Semibold',
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                decorationThickness: 2,
                                                color: textColorSecond,
                                              ),
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
                      },
                    );
                  }),
                  SizedBox(height: 25.sp),
                ],
              ),
            ),
          ),
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
}
