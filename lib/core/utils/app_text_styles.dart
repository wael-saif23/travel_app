import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../res/colors.dart';
import '../../res/keys.dart';

class KAppTextStyle {
  static TextStyle boldTextStyle = TextStyle(
    color: KAppColors.primaryColor,
    fontSize: 15.sp,
    fontFamily: KAppKeys.APP_Font_Janna,
    fontWeight: FontWeight.bold,
  );

  static TextStyle regularTextStyle = TextStyle(
    color: KAppColors.primaryColor,
    fontSize: 15.sp,
    fontFamily: KAppKeys.APP_Font_Janna,
    fontWeight: FontWeight.normal,
  );

  static TextStyle inputStyle = TextStyle(
    color: KAppColors.primaryColor,
    fontSize: 16.sp,
    fontFamily: KAppKeys.APP_Font_Janna,
    fontWeight: FontWeight.normal,
  );

  static TextStyle hintStyle = TextStyle(
    color: KAppColors.hintColor,
    fontSize: 16.sp,
    fontFamily: KAppKeys.APP_Font_Janna,
    fontWeight: FontWeight.normal,
  );
}