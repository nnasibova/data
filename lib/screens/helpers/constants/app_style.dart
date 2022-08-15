 import 'package:flutter/material.dart';

class TextStyles{
static TextStyle styleForHeadings = const TextStyle(
    color: AppColor.bigTextColor,
    fontSize: 20,
    fontWeight: FontWeight.w700
  );

  static TextStyle styleForBody = const TextStyle(
    color: AppColor.textColor2,
    fontSize: 16,
  );
  static TextStyle styleForInfo = const TextStyle(
    color: AppColor.bigTextColor,
    fontSize: 16,
    fontWeight: FontWeight.w500
  );
 
 }

 
class AppColor {
  static const Color textColor1 =  Color(0xff989acd);
  static const Color textColor2 = Color(0xff878593);
  static const Color bigTextColor = Color(0xff2e2e31);
  static const Color backgroundColor = Color(0xfff7f6f4);}