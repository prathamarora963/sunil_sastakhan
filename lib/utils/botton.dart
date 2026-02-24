// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class Custombutton {
  // static Widget button(clr, text, siz, siz2) {
  //   return Center(
  //     child: Container(
  //       decoration: BoxDecoration(
  //           borderRadius: const BorderRadius.all(Radius.circular(14)),
  //           color: clr),
  //       height: height / 15,
  //       width: Get.width / 1.3,
  //       child: Row(
  //         children: [
  //           siz,
  //           Text(text,
  //               style: TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 15,
  //                   fontWeight: FontWeight.w600)),
  //           siz2,
  //           Padding(
  //               padding: const EdgeInsets.symmetric(vertical: 9),
  //               child: Image.asset("image/arrow.png")),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  static Widget button1(clr, text, h, w) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            color: clr),
        height:  h,
        width: w,
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 6.sp,
                      fontWeight: FontWeight.w600)),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 9),
                child: Image.asset("image/arrow.png")),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
  static Widget button2(clr, text, h, w) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            color: clr),
        height: h,
        width: w,
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600)),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }

  static Widget button3(clr, text, h, w) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: clr,
            style: BorderStyle.solid,
            width: 1.0,
          ),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(25),
        ),
       /* decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            color: Colors.white),*/
        height: h,
        width: w,
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: clr,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600)),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
  static Widget button4(clr, text, h, w) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: clr,
            style: BorderStyle.solid,
            width: 1.0,
          ),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(25),
        ),
        /* decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            color: Colors.white),*/
        height: h,
        width: w,
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: clr,
                      fontSize: 16.sp,
                      fontFamily: 'GeneralSans-Medium',
                      fontWeight: FontWeight.w600)),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }

  //white round corner button
  static Widget button5(clr, texclr,text,heig, wid) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: clr,
            style: BorderStyle.solid,
            width: 1.0,
          ),
          color: clr,
          borderRadius: BorderRadius.circular(10),
        ),
        /* decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            color: Colors.white),*/
        height: heig,
        width: wid,
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'GeneralSans-Semibold',
                      color: texclr,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600)),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
