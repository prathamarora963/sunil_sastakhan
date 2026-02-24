
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../globalwidgets/base_scaffold_body.dart';
import '../utils/color.dart';
import '../utils/colornotifire.dart';

class MarchentContactUs extends StatefulWidget {
  const MarchentContactUs({Key? key}) : super(key: key);

  @override
  _MarchentContactUsState createState() => _MarchentContactUsState();
}

class _MarchentContactUsState extends State<MarchentContactUs> {
  late ColorNotifire notifire;
  bool status = false;
  final number = TextEditingController();
  String? dropdownValue = "";
  int quantity = 2;
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
                          "Contact Us",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'GeneralSans-Bold',
                              color: notifire.gettextcolor),
                        ),),
                    ]),
                    SizedBox(height:10.sp),
                    Container(
                        padding:  EdgeInsets.symmetric(horizontal: 12.sp,vertical: 12.sp),
                      alignment: Alignment.centerLeft,
                      height: 40.sp,
                      decoration: BoxDecoration(
                        color: textBoxbgColor,
                        borderRadius: BorderRadius.circular(15.sp),
                        border: Border.all(color: borderColorvalue),
                      ),
                      child:  Column(mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(
                          'Office :',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'GeneralSans-Semibold',
                              color: textColor),
                        ),
                        Text(
                          "123/765, Alavama Street Sada Pushp Road, Ahmadabad. Gujrat, 595959",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: 'GeneralSans-Medium',
                              color: textColorSecond),
                        ),
                          SizedBox(height:10.sp),
                          Text(
                            'Phone Number :',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'GeneralSans-Semibold',
                                color: textColor),
                          ),
                          Text(
                            "+91- 9876543210 , 91 - 0123456789",
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: 'GeneralSans-Medium',
                                color: textColorSecond),
                          ),
                      ],)
                    ),
                    SizedBox(height:15.sp),
                    Text(
                      'How can we help you ?',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'GeneralSans-Semibold',
                          color: textColor),
                    ),
                    Container(margin: EdgeInsets.only(top: 10.sp, bottom: 0, left: 0.sp, right: 0.sp),
                      child: Text(
                        "Name",
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
                        hintText: "Enter Your Name",
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
                        "Email Id",
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
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: textBoxbgColor,
                        hintText: "Enter Your Mail Id",
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
                        "Phone Number",
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
                        hintText: "Enter Your Phone Number",
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
                        "Comment",
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
                      maxLines: 5,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: textBoxbgColor,
                        hintText: "Enter Your Comment",
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
                        "Error Screenshot (Optional)",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'GeneralSans-Medium',
                            color: textColorSecond),
                      ),),
                    SizedBox(height:10.sp),
                    Container(alignment: Alignment.center,
                      child: uploadBox(size: 50.sp, onTap: () {

                    }),),
                    SizedBox(height: 25.sp),
                    Container(margin: EdgeInsets.only(top: 0.sp, bottom: 20.sp, left: 15.sp, right: 15.sp),
                      child: SizedBox(
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
                    ),),
                    SizedBox(height: 40.sp),
                  ],
                ),
              ),
            ),
          ),),)

    );

  }
  // IMAGE UPLOAD BOX
  Widget uploadBox({double size = 100,required VoidCallback onTap}) {
    return GestureDetector(onTap: onTap,
        child: Container(
          alignment: Alignment.center,
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
