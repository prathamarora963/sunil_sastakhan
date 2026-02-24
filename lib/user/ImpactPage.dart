
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart' hide whiteColor;
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../MerchentBottombar.dart';
import '../globalwidgets/base_scaffold_body.dart';
import '../main.dart';
import '../merchent/ViewItem.dart';
import '../utils/color.dart';
import '../utils/color.dart' as MyColors;
import '../utils/colornotifire.dart';
import '../utils/commonutills.dart';
import 'MarchentDeatilsUser.dart';
import 'OrderDetails.dart';


class ImpactPage extends StatefulWidget {
  final bool? navFlag;
  const ImpactPage({Key? key,this.navFlag}) : super(key: key);

  @override
  _ImpactPageState createState() => _ImpactPageState();
}

class _ImpactPageState extends State<ImpactPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
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
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }
  @override
  void dispose() {
    feedbackController.dispose();
    super.dispose();
  }
  void _handleTabSelection() {
    setState(() {
    });
  }
  int selectedRating = 0;
  final TextEditingController feedbackController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
        backgroundColor: notifire.backgrounde,
        body: Body(child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.sp),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  widget.navFlag==true ?SizedBox(): SizedBox(height:28.sp),
                  widget.navFlag==true ? SizedBox(): Row(children: [
                    Container( margin: EdgeInsets.only(top: 0.sp, bottom: 0, left: 0.sp, right: 0.sp),
                      alignment: Alignment.topLeft,
                      child:  IconButton(onPressed: (){
                        finish(context);
                      }, icon:  Icon(Icons.arrow_back_ios_new_outlined,color: textColor,size: 3.h,)),
                    ),
                    Container(alignment: Alignment.centerLeft,
                      child: Text(
                        "Your Impact",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: 'GeneralSans-Bold',
                            color: notifire.gettextcolor),
                      ),),
                  ]),
                  SizedBox(height:15.sp),
                  _impactSummaryCard(),
                   SizedBox(height: 12.sp),
                  _progressCard(
                    icon: Icons.restaurant,
                    title: 'Meals Saved Goal',
                    value: '157',
                    total: '200 meals',
                    progress: 157 / 200,
                    description:
                    "You've saved 157 meals this month, getting closer to your goal of 200!",
                    color: buttonColor,
                  ),
                  SizedBox(height: 10.sp),
                  _progressCard(
                    icon: Icons.cloud,
                    title: 'CO₂ Reduction Target',
                    value: '250',
                    total: '300 kg',
                    progress: 250 / 300,
                    description:
                    "You've helped reduce 250 kg of CO₂ emissions, an excellent contribution to the environment.",
                    color: Colors.orange,
                  ),
                  SizedBox(height: 10.sp),
                  _communityCard(),

                  SizedBox(height: 10.sp),
                ],
              )
            )
              )
            ),)

    );
  }
  // 🌱 TOP SUMMARY CARD
  Widget _impactSummaryCard() {
    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F8F1),
        borderRadius: BorderRadius.circular(16.sp),
      ),
      child: Column(
        children: [
          Icon(Icons.auto_awesome, color: buttonsColororange, size: 28.sp),
          SizedBox(height: 12.sp),
          Text(
            'Your Environmental\nFootprint',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.sp, fontFamily: 'GeneralSans-Semibold',color: textColor),
          ),
          SizedBox(height: 10.sp),
           Text(
            "Every action counts! See the positive difference you're making by rescuing delicious food.",
            textAlign: TextAlign.center,
            style:  TextStyle(
              fontSize: 14.sp,
              fontFamily: 'GeneralSans-Medium',
              color: textColorSecond,
            ),
          ),
          Divider(height: 20.sp,),
          Row(
            children: [
              _statItem(
                icon: Icons.restaurant,
                value: '157',
                label: 'Meals Saved',
                color: buttonColor,
              ),
              Container(
                height: 50,
                width: 1,
                color: Colors.grey.shade300,
              ),
              _statItem(
                icon: Icons.cloud,
                value: '250 kg',
                label: 'CO₂ Reduced',
                color: Colors.black87,
              ),
            ],
          ),
          Divider(height: 20.sp,),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonsColororange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.only(top: 12.sp, bottom: 12.sp, left: 15.sp, right: 15.sp),
              ),
              child: Text('Track Your Rewards',style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'GeneralSans-Medium',
                  color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }

  // 📊 PROGRESS CARD
  Widget _progressCard({
    required IconData icon,
    required String title,
    required String value,
    required String total,
    required double progress,
    required String description,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: boxbgColor,
        borderRadius: BorderRadius.circular(16.sp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color),
               SizedBox(width: 10.sp),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: 'GeneralSans-Semibold',
                      color: textColor),
                ),
              ),
              Text(
                '$value / $total',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'GeneralSans-Semibold',
                    color: color),
              )
            ],
          ),
          SizedBox(height: 10.sp),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: Colors.grey.shade200,
              color: buttonColor,
            ),
          ),
          SizedBox(height: 12.sp),
          Text(description, style: TextStyle(
              fontSize: 13.sp,
              fontFamily: 'GeneralSans-Medium',
              color: textColorSecond),),
        ],
      ),
    );
  }

  // 👥 COMMUNITY CARD
  Widget _communityCard() {
    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            height: 55.sp,
            decoration: BoxDecoration(
              color: const Color(0xFFFFF2E6),
              borderRadius: BorderRadius.circular(12),
            ),
            child:  Center(
              child: Container(
                  color: Colors.transparent,
                  height: 55.sp,
                  child: Image.asset("images/impact.png")),
            ),
          ),

          SizedBox(height: 12.sp),
          Text(
            'Together, We Grow',
            style: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'GeneralSans-Semibold',
                color: textColor),
          ),
           SizedBox(height: 10.sp),
           Text(
            'Every meal rescued contributes to a healthier planet. Thank you for being a part of the SastaKhana community!',
            textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 13.sp,
                  fontFamily: 'GeneralSans-Medium',
                  color: textColorSecond)
          ),
           SizedBox(height: 14.sp),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.sp),
                ),
                padding: EdgeInsets.symmetric(vertical: 15.sp),
              ),
              child:  Text('Share Your Impact',style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'GeneralSans-Medium',
                  color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }

  // 🔢 STAT ITEM
  Widget _statItem({
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: color),
          SizedBox(height: 6.sp),
          Text(value,
              style: TextStyle(fontSize: 22.sp, fontFamily: 'GeneralSans-Semibold',color: textColor),
    ),
           SizedBox(height: 4.sp),
          Text(label, style: TextStyle(
              fontSize: 14.sp,
              fontFamily: 'GeneralSans-Medium',
              color: textColorSecond)),
        ],
      ),
    );
  }
}



