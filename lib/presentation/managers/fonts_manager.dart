import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FontSizeManager {
  static final double s10 = 10.sp;
  static final double s14 = 14.sp;
  static final double s16 = 16.sp;
  static final double s18 = 18.sp;
  static final double s20 = 20.sp;
  static final double s22 = 22.sp;
  static final double s30 = 30.sp;
  static final double s40 = 40.sp;
}

class FontsManager {
  static TextStyle smallText(Color color, FontWeight weight) {
    return TextStyle(
      fontSize: FontSizeManager.s10,
      color: color,
    );
  }

  static TextStyle regularText(Color color, FontWeight weight) {
    return TextStyle(
      fontSize: FontSizeManager.s14,
      color: color,
    );
  }

  static TextStyle mediumText(Color color, FontWeight weight) {
    return TextStyle(
      fontSize: FontSizeManager.s20,
      color: color,
    );
  }

  static TextStyle bigText(Color color, FontWeight weight) {
    return TextStyle(
      fontSize: FontSizeManager.s30,
      color: color,
      fontWeight: weight,
    );
  }

  static TextStyle hugeText(Color color, FontWeight weight) {
    return TextStyle(
      fontSize: FontSizeManager.s40,
      fontWeight: weight,
      color: color,
      height: 0,
    );
  }
}
