import 'package:SastaKhana/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../globalwidgets/base_scaffold_body.dart';
import '../../utils/colornotifire.dart';


class MarchentNotification extends StatefulWidget {
  const MarchentNotification({Key? key}) : super(key: key);

  @override
  MarchentNotificationState createState() => MarchentNotificationState();
}

class MarchentNotificationState extends State<MarchentNotification> with SingleTickerProviderStateMixin {
  late ColorNotifire notifire;
  bool status = false;
  final number = TextEditingController();

  String? dropdownValue = "";
  @override
  void initState() {
    super.initState();
  }
  final List<Map<String, dynamic>> todayNotifications = [
    {
      "icon": Icons.notifications_none,
      "iconColor": Colors.green,
      "title": "New Surprise Bag Order!",
      "desc":
      'Customer "Priya Sharma" has placed an order for a Veggie Delight Surprise Bag. Prepare for pickup!',
      "time": "10:30 AM",
      "actions": true,
    },
    {
      "icon": Icons.inventory_2_outlined,
      "iconColor": Colors.green,
      "title": "Order Ready for Pickup",
      "desc":
      'Order #SKM2023-456 for "Rajesh Kumar" is now ready for customer pickup. Please ensure it\'s visible.',
      "time": "09:15 AM",
      "actions": true,
    },
    {
      "icon": Icons.check_circle_outline,
      "iconColor": Colors.grey,
      "title": "Profile Update Required",
      "desc":
      "Your business profile is 80% complete. Add your store's holiday hours to improve customer visibility.",
      "time": "08:00 AM",
      "actions": false,
    },
  ];

  final List<Map<String, dynamic>> earlierNotifications = [
    {
      "icon": Icons.cancel_outlined,
      "iconColor": Colors.red,
      "title": "Order Cancelled",
      "desc":
      'Order #SKM2023-455 by "Anjali Singh" has been cancelled. Please remove the items from inventory.',
      "time": "Yesterday, 07:00 PM",
      "actions": true,
    },
    {
      "icon": Icons.notifications_none,
      "iconColor": Colors.green,
      "title": "New Order Received",
      "desc":
      'A new order #SKM2023-454 for "Suresh Das" (Baked Goods Surprise Bag) has been placed.',
      "time": "Yesterday, 05:45 PM",
      "actions": false,
    },
  ];
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
        backgroundColor: notifire.backgrounde,
        body: Body(child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Container(margin: EdgeInsets.only(top: 0.sp, bottom: 0, left: 15.sp, right: 15.sp),
              child: Column(
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
                        "Notifications",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: 'GeneralSans-Bold',
                            color: notifire.gettextcolor),
                      ),),
                  ]),
                  // const SizedBox(height: 16),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.all(15.sp),
                      children: [
                        _sectionTitle("Today"),
                        ...todayNotifications.map(_notificationCard).toList(),
                        const SizedBox(height: 24),
                        _sectionTitle("Earlier"),
                        ...earlierNotifications.map(_notificationCard).toList(),
                      ],
                    ),
                  ),
                ],
              ),)
        ),)

    );

  }
  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child:  Text(
        title,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 16.sp,
            fontFamily:
            'GeneralSans-Semibold',
            color: notifire.gettextcolor),
      ),
    );
  }

  Widget _notificationCard(Map<String, dynamic> data) {
    return Container(
      margin:  EdgeInsets.only(bottom: 15.sp),
      padding:  EdgeInsets.all(15.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.sp),
        boxShadow:  [
          BoxShadow(
            color: BoxShadowColorValue,
            blurRadius: 8.sp,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(data["icon"], color: data["iconColor"]),
              SizedBox(width: 10.sp),
              Expanded(
                child: Text(
                  data["title"],
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily:
                      'GeneralSans-Semibold',
                      color: notifire.gettextcolor),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.sp),
          Text(
            data["desc"],
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 14.sp,
                fontFamily:
                'GeneralSans-Medium',
                color: textColorSecond),
          ),
           SizedBox(height: 14.sp),
          Row(
            children: [
               Icon(Icons.access_time, size: 16.sp, color: textColorSecond),
               SizedBox(width: 8.sp),
              Text(
                data["time"],
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily:
                    'GeneralSans-Medium',
                    color: textColorSecond),
              ),
               Spacer(),
              if (data["actions"]) ...[
                ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text(
                    "View Order",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily:
                        'GeneralSans-Medium',
                        color: Colors.white),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}


