
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../globalwidgets/base_scaffold_body.dart';
import '../main.dart';
import '../utils/color.dart';
import '../utils/colornotifire.dart';
import '../utils/commonutills.dart';

class CreateItems extends StatefulWidget {
  const CreateItems({Key? key}) : super(key: key);

  @override
  _CreateItemsState createState() => _CreateItemsState();
}

class _CreateItemsState extends State<CreateItems> {
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
  bool _isObscure = true;
  String? password;
  @override
  void initState() {
    super.initState();

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
                          "Create Item",
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontFamily: 'GeneralSans-Bold',
                              color: notifire.gettextcolor),
                        ),),
                    ]),
                    Container(margin: EdgeInsets.only(top: 10.sp, bottom: 0, left: 0.sp, right: 0.sp),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Item Details",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: 'GeneralSans-Semibold',
                            color: notifire.gettextcolor),
                      ),),

                    Container(margin: EdgeInsets.only(top: 15.sp, bottom: 0, left: 0.sp, right: 0.sp),
                      child: Text(
                        "Item Name",
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
                        hintText: "Enter Item Name",
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
                        "Item Description",
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
                        hintText: "Enter Item Description",
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

                    Container(
                      margin: EdgeInsets.only(top: 15.sp, bottom: 0, left: 0.sp, right: 0.sp),
                      child: Text(
                        "Add Item Photo",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'GeneralSans-Medium',
                            color: textColorSecond),
                      ),),
                    // SizedBox(height:10.sp),
                    Container(
                      height: 70.sp,
                      padding:  EdgeInsets.all(15.sp),
                      decoration: BoxDecoration(
                        color: textBoxbgColor,
                        borderRadius: BorderRadius.circular(15.sp),
                      ),
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: 6,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 15.sp,
                          mainAxisSpacing: 15.sp,
                        ),
                        itemBuilder: (_, index) {
                          return  uploadBox(size: 45.sp, onTap: () {

                          });
                        },
                      ),
                    ),
                    Container(margin: EdgeInsets.only(top: 10.sp, bottom: 0, left: 0.sp, right: 0.sp),
                      child: Text(
                        "Upload a clear photo of item and max file size 5MB.",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'GeneralSans-Regular',
                            color: textColorSecond),
                      ),),
                    Container(margin: EdgeInsets.only(top: 15.sp, bottom: 0, left: 0.sp, right: 0.sp),
                      child: Text(
                        "Number of Items",
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
                        hintText: "Enter Item Number",
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
                        "Original Price",
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
                        hintText: "Enter Item Original Price",
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
                        "Discount %",
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
                        hintText: "Enter Item Discount %",
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
                        "Sale Price",
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
                        hintText: "Enter Item Sale Price Note all calculate by discount",
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

                    Container(
                      margin: EdgeInsets.only(top: 15.sp, bottom: 0, left: 0.sp, right: 0.sp),
                      child: Text(
                        "Business Category",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'GeneralSans-Medium',
                            color: textColorSecond),
                      ),),
                    SizedBox(height:10.sp),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      decoration: BoxDecoration(
                        border: Border.all(color: borderColorvalue),
                        borderRadius: BorderRadius.circular(15.sp),
                        color: textBoxbgColor,
                      ),
                      child:Row(
                        children: [
                          Expanded(child:   categoryItem("Restaurants"),),
                          categoryItem("Bakery"),
                          Expanded(child:   categoryItem("Home Chef"),)
                        ],
                      ),
                    ),
                    SizedBox(height:15.sp),
                    Container(alignment: Alignment.centerLeft,
                      child: Text(
                        "Pickup Information",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: 'GeneralSans-Semibold',
                            color: notifire.gettextcolor),
                      ),),
                    SizedBox(height:10.sp),
                    Container(
                      margin: EdgeInsets.only(top: 0.sp, bottom: 0, left: 0.sp, right: 0.sp),
                      child: Text(
                        "Pickup Time Window",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'GeneralSans-Medium',
                            color: textColorSecond),
                      ),),
                    SizedBox(height:10.sp),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTimeDropdown(
                            value: startTime,
                            onChanged: (v) => setState(() => startTime = v!),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "to",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'GeneralSans-Medium',
                              color: textColorSecond),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildTimeDropdown(
                            value: endTime,
                            onChanged: (v) => setState(() => endTime = v!),
                          ),
                        ),
                      ],
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
                            "Make Item Available",
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
                    SizedBox(height:10.sp),
                    Container(alignment: Alignment.centerLeft,
                      child: Text(
                        "Super Discount ",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: 'GeneralSans-Semibold',
                            color: notifire.gettextcolor),
                      ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "This is Super Discount",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'GeneralSans-Medium',
                              color: textColorSecond),
                        ),
                        Switch(
                          value: isSuperDiscount,
                          activeColor: Colors.white,
                          activeTrackColor: Colors.green,
                          onChanged: (v) => setState(() => isSuperDiscount = v),
                        ),
                      ],
                    ),
                    SizedBox(height:10.sp),
                    TextField(
                      onChanged: (text) {
                        // password=text.toString();
                      },
                      enabled: isSuperDiscount,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: textBoxbgColor,
                        hintText: "Enter Super Discount Price",
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
                          'Save Item',
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

  // CATEGORY CHECKBOX ITEM
  Widget categoryItem(String title) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 0.sp, vertical: 10.sp),
      /* decoration: BoxDecoration(
        border: Border.all(color: borderColorvalue),
        borderRadius: BorderRadius.circular(12),
        color: textBoxbgColor,
      ),*/
      child: Row(
        children: [
          Checkbox(
              value: false,
              onChanged: (v) {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              )),
          Text(
            title,
            style: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'GeneralSans-Regular',
                color: textColorSecond),
          ),
        ],
      ),
    );
  }
// IMAGE UPLOAD BOX
  Widget uploadBox({double size = 100,required VoidCallback onTap}) {
    return GestureDetector(onTap: onTap,
        child: Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
            color: textBoxbgColor,
            borderRadius: BorderRadius.circular(15.sp),
            border: Border.all(color: borderColorvalue),
          ),
          child:  Center(
            child: Icon(
              Icons.add_photo_alternate_outlined,
              size: 25.sp,
              color: Color(0xFF4C566A),
            ),
          ),
        ));
  }

}

