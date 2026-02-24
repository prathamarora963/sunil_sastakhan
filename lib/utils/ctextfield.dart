import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'color.dart';
import 'colornotifire.dart';


late ColorNotifire notifire;

class Customtextfild {
  static Widget textField({required context,TextEditingController? controller, String? name1, Color? labelclr, Color? textcolor, Color? imagecolor, String? Function(String?)? validator, Widget? prefixIcon, Function(String)? onChanged, TextInputType? keyboardType, TextInputAction? textInputAction,}) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Container(
      color: Colors.transparent,
      height: 45,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        validator: validator,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        style: TextStyle(color: textcolor),
        decoration: InputDecoration(
          disabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: name1,
          labelStyle: TextStyle(color: labelclr),
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: notifire.bordercolore, width: 1),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xff5669FF), width: 1),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
  static Widget textField1({required context,TextEditingController? controller, String? name1, Color? labelclr, Color? textcolor, Color? imagecolor, String? Function(String?)? validator, Function(String)? onChanged, TextInputType? keyboardType, TextInputAction? textInputAction,Color? fieldBg}) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Container(
      color: Colors.transparent,
      height: 28.sp,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        validator: validator,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        style: TextStyle(color: textcolor),
        decoration: InputDecoration(
          fillColor: fieldBg,
          filled: true,
          disabledBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: name1,
          labelStyle: TextStyle(color: labelclr),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: notifire.bordercolore, width: 1),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xff5669FF), width: 1),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  static Widget textFieldEnable({required context,TextEditingController? controller, String? name1, Color? labelclr, Color? textcolor, Color? imagecolor, String? Function(String?)? validator, Function(String)? onChanged, TextInputType? keyboardType, TextInputAction? textInputAction,Color? fieldBg, bool? enabledFlag}) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Container(
      color: Colors.transparent,
      height: 45,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        validator: validator,
        enabled: enabledFlag,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        style: TextStyle(color: textcolor),
        decoration: InputDecoration(
          fillColor: fieldBg,
          filled: true,
          disabledBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: name1,
          labelStyle: TextStyle(color: labelclr),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: notifire.bordercolore, width: 1),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xff5669FF), width: 1),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  static Widget textFieldMessage({required context,TextEditingController? controller, String? name1, Color? labelclr, Color? textcolor, Color? imagecolor, String? Function(String?)? validator, Function(String)? onChanged, TextInputType? keyboardType, TextInputAction? textInputAction,Color? fieldBg}) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Container(
      color: Colors.transparent,
      height: 120,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        validator: validator,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        style: TextStyle(color: textcolor),
        maxLines: 5,
        decoration: InputDecoration(
          fillColor: fieldBg,
          filled: true,
          disabledBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: name1,
          alignLabelWithHint: true,
          labelStyle: TextStyle(color: labelclr),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: notifire.bordercolore, width: 1),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide:  BorderSide(color: darktextColor, width: 1),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

}
