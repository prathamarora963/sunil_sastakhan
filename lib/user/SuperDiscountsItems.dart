
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../globalwidgets/base_scaffold_body.dart';
import '../utils/color.dart';
import '../utils/colornotifire.dart';
import '../utils/commonutills.dart';
import 'ViewCart.dart';

class SuperDiscountsItems extends StatefulWidget {
  const SuperDiscountsItems({Key? key}) : super(key: key);

  @override
  _SuperDiscountsItemsState createState() => _SuperDiscountsItemsState();
}

class _SuperDiscountsItemsState extends State<SuperDiscountsItems> {
  late ColorNotifire notifire;
  bool status = false;
  final number = TextEditingController();
  String? dropdownValue = "";

  final List<Map<String, dynamic>> items = [
    {
      "name": "Breakfast Combo",
      "status": "Active",
      "img": "images/logo.png",
      "desc": "A delightful mix of pastries, fruits, and juice.",
      "available": 5,
      "price": 120.00,
      "statusColor": Colors.orange,
    },
    {
      "name": "Lunch Special",
      "status": "Sold Out",
      "img": "images/logo.png",
      "desc": "Hearty Indian thali with rice, dal, sabzi, and roti.",
      "available": 0,
      "price": 180.50,
      "statusColor": Colors.red,
    },
    {
      "name": "Evening Snacks",
      "status": "Draft",
      "img": "images/logo.png",
      "desc": "Assortment of pakoras, samosas, and chai.",
      "available": 10,
      "price": 80.00,
      "statusColor": Colors.grey,
    },
    {
      "name": "Dinner Delight",
      "status": "Active",
      "img": "images/logo.png",
      "desc": "Generous portion of biryani with raita and salad.",
      "available": 3,
      "price": 250.00,
      "statusColor": Colors.orange,
    },
  ];

  @override
  void initState() {
    super.initState();
  }
  int quantity = 0;
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
          child: SingleChildScrollView(
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
                          "Super Discount",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'GeneralSans-Bold',
                              color: notifire.gettextcolor),
                        ),),
                    ]),
                    SizedBox(height:15.sp),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.all(0),
                      itemCount: items?.length,
                      itemBuilder: (context, index) {
                        // return propertyListItem(propertyList![index]);
                        final item = items[index];
                        return Container(
                          margin:  EdgeInsets.only(bottom: 15.sp),
                          padding:  EdgeInsets.all(13.sp),
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
                                  // product image
                                  Container(
                                    width: 35.sp,
                                    height: 35.sp,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                        image: AssetImage(item["img"]),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10.sp),
                                  // title, description, status
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(margin: EdgeInsets.only(top: 0.sp, bottom: 0, left: 0.sp, right: 0.sp),
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  item["name"],
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontFamily: 'GeneralSans-Semibold',
                                                      color: notifire.gettextcolor),
                                                ),),

                                            ),

                                            Container(
                                              padding:  EdgeInsets.symmetric(
                                                horizontal: 12.sp,
                                                vertical: 8.sp,
                                              ),
                                              decoration: BoxDecoration(
                                                color: item["statusColor"].withOpacity(0.15),
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                              child: Text(
                                                item["status"],
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontFamily: 'GeneralSans-Semibold',
                                                    color: item["statusColor"]),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(margin: EdgeInsets.only(top: 8.sp, bottom: 0, left: 0.sp, right: 0.sp),
                                          child: Text(
                                            item["desc"],
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontFamily: 'GeneralSans-Medium',
                                                color: textColorSecond),
                                          ),),

                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 10.sp),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(margin: EdgeInsets.only(top: 0.sp, bottom: 0, left: 0.sp, right: 0.sp),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "${item['available']} Available",
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontFamily: 'GeneralSans-Semibold',
                                          color: notifire.gettextcolor),
                                    ),),
                                  Container(margin: EdgeInsets.only(top: 0.sp, bottom: 0, left: 0.sp, right: 0.sp),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "40%",
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontFamily: 'GeneralSans-Semibold',
                                          color: redColorvalue),
                                    ),),
                                  Container(margin: EdgeInsets.only(top: 0.sp, bottom: 0, left: 0.sp, right: 0.sp),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "250 Rs",
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
                                      "Rs ${item['price']}",
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontFamily: 'GeneralSans-Semibold',
                                          color: buttonColor),
                                    ),),

                                ],
                              ),
                              SizedBox(height: 10.sp),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "Add",
                                      style: TextStyle(
                                        fontFamily:
                                        'GeneralSans-Semibold',
                                        color: textColor,
                                        fontSize: 16.sp,)),
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
                                                'GeneralSans-Medium',
                                                color: Colors.white,
                                                fontSize: 15.sp,)),
                                        ),
                                        _qtyButton(
                                          icon: Icons.add,
                                          onTap: () {
                                            setState(() => quantity++);
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
                        );
                      },
                    ),

                    SizedBox(height: 40.sp),
                  ],
                ),
              ),
            ),
          ),),)

    );

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
  Widget buildItemCard({
    required String image,
    required String title,
    required String desc,
    required String status,
    required Color statusColor,
    required String available,
    required String price,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.black12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// IMAGE
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              image,
              height: 75,
              width: 75,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 12),

          /// RIGHT CONTENT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// TITLE + STATUS TAG
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: statusColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                /// DESCRIPTION
                Text(
                  desc,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.black54, fontSize: 14),
                ),

                const SizedBox(height: 10),

                /// AVAILABLE + PRICE
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      available,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "₹ $price",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.green,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                /// EDIT + DELETE BUTTONS
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade700,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        icon: const Icon(Icons.edit, color: Colors.white),
                        label: const Text("Edit",
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.red),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        icon: const Icon(Icons.delete, color: Colors.red),
                        label: const Text("Delete",
                            style: TextStyle(color: Colors.red)),
                        onPressed: () {},
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
