import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/app_text_styles.dart';
import '../../res/colors.dart';
import '../widgets.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.textSize,
    this.radius,
    this.horizontalPadding,
    this.verticalPadding,
    this.width,
    required this.onPressed,
    required this.text,
    this.hMargin,
    this.vMargin,
    this.elevation = 0,
    this.borderRadius,
    this.borderColor = Colors.transparent,
    this.isLoading = false,
    this.gradientColor,
    this.shadowColor = Colors.grey,
    this.backgroundColor = KAppColors.primaryColor,
    this.textStyle, this.textColor,
  });

  final double? textSize;
  final double? radius;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double elevation;
  final double? hMargin;
  final double? vMargin;
  final double? width;
  final Function() onPressed;
  final String text;
  final bool isLoading;
  final double? borderRadius;
  final Color borderColor;
  final Color backgroundColor;
  final Color shadowColor;
  final Gradient? gradientColor;
  final TextStyle? textStyle;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      margin: EdgeInsets.symmetric(
          horizontal: hMargin ?? 20.w, vertical: vMargin ?? 0.h),
      decoration: BoxDecoration(
        gradient: gradientColor,
        borderRadius: BorderRadius.circular(borderRadius ?? 18.r),
      ),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ButtonStyle(
          padding: WidgetStateProperty.all(
            EdgeInsets.symmetric(
                horizontal: horizontalPadding ?? 16.w,
                vertical: verticalPadding ?? 20.h),
          ),
          elevation: WidgetStateProperty.all(elevation),
          shadowColor: WidgetStateProperty.all(shadowColor),
          backgroundColor: WidgetStateProperty.all(
              (gradientColor != null) ? Colors.transparent : backgroundColor),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 18.r),
              side: BorderSide(color: borderColor),
            ),
          ),
        ),
        child: isLoading
            ? LoadingWidget(color: Colors.white, size: 30.r)
            : Text(
                text,
                style: textStyle ??
                    KAppTextStyle.interBold16.copyWith(color:textColor?? Colors.white),
              ),
      ),
    );
  }
}
