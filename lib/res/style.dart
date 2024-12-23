import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/extension/sizedbox_extention.dart';

class KAppStyle {
  // * V => Version

  static final mainPadding = EdgeInsets.symmetric(horizontal: 16.w);

  static final minSH = 8.sH;
  static final smallMidSH = 12.sH;
  static final midSH = 16.sH;
  static final semiMidSH = 24.sH;
  static final maxSH = 32.sH;
  static final moreMaxSH = 42.sH;
  static final bigMaxSH = 64.sH;

  static final minSW = 8.sW;
  static final midSW = 16.sW;
  static final maxSW = 32.sW;

  static final mainViewSpace = 10.sH;
  static final mainViewRadius = 35.r;

  static final mainBorderRadius = BorderRadius.circular(12.r);
  static final bottomSheetRadius = BorderRadius.circular(20.r);

  static final hospitalPadding = EdgeInsets.symmetric(horizontal: 25.w);

  static final defaultIterablePadding = EdgeInsets.only(bottom: 120.h, left: 22.w, right: 22.w);

  static final defaultIterablePaddingV2 = EdgeInsets.only(left: 22.w, right: 22.w);

  static final defaultIterablePaddingV3 = EdgeInsets.only(bottom: 32.h, left: 22.w, right: 22.w);
  static final defaultIterablePaddingV4 = EdgeInsets.only(bottom: 32.h, left: 22.w, right: 22.w, top: 16.h);

  static final defaultIterablePaddingV5 = EdgeInsets.symmetric(vertical: 32.h);
}
