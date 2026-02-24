
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../globalwidgets/base_scaffold_body.dart';
import '../utils/color.dart';
import '../utils/colornotifire.dart';
import '../utils/commonutills.dart';

class AddCampaignMerchent extends StatefulWidget {
  const AddCampaignMerchent({Key? key}) : super(key: key);

  @override
  _AddCampaignMerchentState createState() => _AddCampaignMerchentState();
}

class _AddCampaignMerchentState extends State<AddCampaignMerchent> {
  late ColorNotifire notifire;
  bool status = false;
  final number = TextEditingController();
  String? dropdownValue = "";

  String startTime = "18:00";
  String endTime = "20:00";

  bool isAvailable = true;
  bool isSuperDiscount = false;

  final List<String> timeSlots = [
    "1:00", "2:00", "03:00",
    "04:00", "05:00", "06:00", "07:00",
    "08:00", "09:00", "10:00", "11:00",
    "12:00", "13:00", "14:00", "15:00",
    "16:00", "17:00", "18:00", "19:00",
    "20:00", "21:00", "22:00", "23:00"
  ];
  String? password;
  @override
  void initState() {
    super.initState();
  }
  DateTime? startDate;
  DateTime? endDate;

  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  Future<void> selectDate({
    required bool isStartDate,
  }) async {
    DateTime now = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now, // ✅ Future only
      lastDate: DateTime(now.year + 5),
    );

    if (picked != null) {
      setState(() {
        if (isStartDate) {
          startDate = picked;
          endDate = null; // reset end date
        } else {
          endDate = picked;
        }
      });
    }
  }
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
                          "Add Campaign",
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontFamily: 'GeneralSans-Bold',
                              color: notifire.gettextcolor),
                        ),),
                    ]),

                    Container(margin: EdgeInsets.only(top: 15.sp, bottom: 0, left: 0.sp, right: 0.sp),
                      child: Text(
                        "Title",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'GeneralSans-Medium',
                            color: textColorSecond),
                      ),),
                    SizedBox(height:10.sp),
                    TextField(
                      onChanged: (text) {
                        // password=text.toString();
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: textBoxbgColor,
                        hintText: "Enter Title",
                        hintStyle: TextStyle(
                            color: PlaceholderColor),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide: BorderSide(color: greenColorPrimery, width: 4.sp),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide:  BorderSide(color: borderColorvalue, width: 4.sp),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide:  BorderSide(color: redColorvalue, width: 4.sp),
                        ),
                        disabledBorder: InputBorder.none,
                        isDense: false,
                        // Added this
                        contentPadding: EdgeInsets.fromLTRB(
                            10, 15, 10, 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                        ),

                      ),
                      cursorColor: notifire.gettextcolor,
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: notifire.gettextcolor),
                    ),
                    Container(margin: EdgeInsets.only(top: 15.sp, bottom: 0, left: 0.sp, right: 0.sp),
                      child: Text(
                        "Description",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'GeneralSans-Medium',
                            color: textColorSecond),
                      ),),
                    SizedBox(height:10.sp),
                    TextField(
                      onChanged: (text) {
                        // password=text.toString();
                      },
                      maxLines: 4,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,

                      decoration: InputDecoration(
                        filled: true,
                        fillColor: textBoxbgColor,
                        hintText: "Enter Description",
                        hintStyle: TextStyle(
                            color: PlaceholderColor),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide: BorderSide(color: greenColorPrimery, width: 4.sp),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide:  BorderSide(color: borderColorvalue, width: 4.sp),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide:  BorderSide(color: redColorvalue, width: 4.sp),
                        ),
                        disabledBorder: InputBorder.none,
                        isDense: false,
                        // Added this
                        contentPadding: EdgeInsets.fromLTRB(
                            10, 15, 10, 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                        ),

                      ),
                      cursorColor: notifire.gettextcolor,
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: notifire.gettextcolor),
                    ),
                    SizedBox(height:15.sp),
                    ClipRRect(borderRadius: BorderRadius.all(Radius.circular(15.sp)),
                      child:   Container( height: 60.sp,
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
                          imageUrl:  "https://picsum.photos/seed/picsum/200/300",//baseUrl!+"/"+propertyDetails!.image! ??'',
                          placeholder: (context, url) => Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/logo.png"),
                                  fit: BoxFit.fill,
                                )),),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),),
                    SizedBox(height:15.sp),
                    Container(alignment: Alignment.center,
                      child: Text(
                      textAlign: TextAlign.center,
                      "Upload a captivating image for your campaign.",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'GeneralSans-Medium',
                          color: textColorSecond),
                    ),),
                    SizedBox(height:10.sp),
                    Container(alignment: Alignment.center,
                      child: OutlinedButton.icon(
                      onPressed: () {
                        // ViewItem().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Scale);
                      },
                      icon:  Icon(Icons.file_upload_outlined, color: buttonboldColor),
                      label: Text(
                        "Upload Image",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'GeneralSans-Medium',
                            color: buttonboldColor),
                      ),

                      style: OutlinedButton.styleFrom(
                        side:  BorderSide(color: buttonboldColor),
                        padding:  EdgeInsets.symmetric(vertical: 6.sp,horizontal: 20.sp),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                      ),
                    ),),

                    SizedBox(height:0.sp),
                    Container(
                      margin: EdgeInsets.only(top: 15.sp, bottom: 0, left: 0.sp, right: 0.sp),
                      child: Text(
                        "Start Date",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'GeneralSans-Medium',
                            color: textColorSecond),
                      ),),
                    SizedBox(height:10.sp),
                    Container(
                      padding:  EdgeInsets.symmetric(horizontal: 0, vertical: 12.sp),
                      decoration: BoxDecoration(
                        border: Border.all(color: borderColorvalue),
                        borderRadius: BorderRadius.circular(15.sp),
                        color: textBoxbgColor,
                      ),
                      child: dateField(
                        label: 'Start Date',
                        date: startDate,
                        onTap: () => selectDate(isStartDate: true),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15.sp, bottom: 0, left: 0.sp, right: 0.sp),
                      child: Text(
                        "End Date",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'GeneralSans-Medium',
                            color: textColorSecond),
                      ),),
                    SizedBox(height:10.sp),
                    Container(
                      padding:  EdgeInsets.symmetric(horizontal: 0, vertical: 12.sp),
                      decoration: BoxDecoration(
                        border: Border.all(color: borderColorvalue),
                        borderRadius: BorderRadius.circular(15.sp),
                        color: textBoxbgColor,
                      ),
                      child: dateField(
                        label: 'End Date',
                        date: endDate,
                        // onTap: startDate == null ? null : () => selectDate(isStartDate: false),
                        onTap: () => selectDate(isStartDate: false),
                      ),
                    ),

                    SizedBox(height:15.sp),
                    Container(alignment: Alignment.centerLeft,
                      child: Text(
                        "Availability",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: 'GeneralSans-Semibold',
                            color: notifire.gettextcolor),
                      ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 0.sp, bottom: 0, left: 0.sp, right: 0.sp),
                          child: Text(
                            "Campaign Status",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: 'GeneralSans-Medium',
                                color: textColorSecond),
                          ),),
                        Switch(
                          value: isAvailable,
                          activeColor: Colors.white,
                          activeTrackColor: Colors.green,
                          onChanged: (v) => setState(() => isAvailable = v),
                        ),
                      ],
                    ),
                    Container(margin: EdgeInsets.only(top: 15.sp, bottom: 0, left: 0.sp, right: 0.sp),
                      child: Text(
                        "Price (e.g.,Discount Percentage)",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'GeneralSans-Medium',
                            color: textColorSecond),
                      ),),
                    SizedBox(height:10.sp),
                    TextField(
                      onChanged: (text) {
                        // password=text.toString();
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: textBoxbgColor,
                        hintText: "Enter Title",
                        hintStyle: TextStyle(
                            color: PlaceholderColor),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide: BorderSide(color: greenColorPrimery, width: 4.sp),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide:  BorderSide(color: borderColorvalue, width: 4.sp),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide:  BorderSide(color: redColorvalue, width: 4.sp),
                        ),
                        disabledBorder: InputBorder.none,
                        isDense: false,
                        // Added this
                        contentPadding: EdgeInsets.fromLTRB(
                            10, 15, 10, 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                        ),

                      ),
                      cursorColor: notifire.gettextcolor,
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: notifire.gettextcolor),
                    ),


                    SizedBox(height:20.sp),
                    SizedBox(
                      width: double.infinity,
                      height: 28.sp,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.sp),
                          ),
                        ),
                        onPressed: () {
                          // Bottombar().launch(context, isNewTask: true, pageRouteAnimation: PageRouteAnimation.Fade);
                        },
                        child:  Text(
                          'Submit',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'GeneralSans-Semibold',
                              color: white),
                        ),
                      ),
                    ),



                    SizedBox(height: 40.sp),
                  ],
                ),
              ),
            ),
          ),),)

    );

  }

  Widget _buildTimeDropdown({
    required String value,
    required Function(String?) onChanged,
  }) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 12.sp),
      decoration: BoxDecoration(
        border: Border.all(color: borderColorvalue),
        borderRadius: BorderRadius.circular(12.sp),
      ),
      child: DropdownButton<String>(
        value: value,
        isExpanded: true,
        underline: const SizedBox(),
        items: timeSlots.map((time) {
          return DropdownMenuItem(
            value: time,
            child: Text(
              time,
              style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'GeneralSans-Medium',
                  color: textColorSecond),
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
  Widget dateField({
    required String label,
    required DateTime? date,
    required VoidCallback onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            padding:  EdgeInsets.symmetric(horizontal: 12.sp),
            child: Row(
              children: [
                 Icon(Icons.calendar_month, size: 18.sp,color: textColor,),
                 SizedBox(width: 10.sp),
                Text(
                  date != null ? formatter.format(date) : 'Select date',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: 'GeneralSans-Medium',
                    color: date != null
                        ? textColor
                        : Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

