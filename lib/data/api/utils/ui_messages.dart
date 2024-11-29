import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import '../../../core/utils/app_text_styles.dart';

void showToast({
  required BuildContext context,
  required String msg,
  Color backgroundColor = Colors.black,
  Color textColor = Colors.white,
  int duration = Toast.lengthLong,
}) {
  ToastContext().init(context);
  Toast.show(
    msg,
    textStyle: KAppTextStyle.regularTextStyle.copyWith(
      color: textColor,
      fontSize: 14,
    ),
    backgroundColor: backgroundColor,
    duration: duration,
  );
}

void showErrorToast({
  required BuildContext context,
  required String msg,
  Color backgroundColor = Colors.red,
  int duration = Toast.lengthLong,
}) {
  showToast(context: context, msg: msg, backgroundColor: backgroundColor);
}

void showSuccessToast({
  required BuildContext context,
  required String msg,
  Color backgroundColor = Colors.green,
  int duration = Toast.lengthLong,
}) {
  showToast(context: context, msg: msg, backgroundColor: backgroundColor);
}
