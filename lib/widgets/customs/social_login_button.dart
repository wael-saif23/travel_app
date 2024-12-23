import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/core/utils/app_text_styles.dart';
import 'package:travel_app/res/colors.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {super.key,
      required this.image,
      required this.title,
      required this.onPressed,
      this.borderRadius, this.borderColor, this.titleStyle});
  final String image;
  final String title;
  final TextStyle? titleStyle;
  final VoidCallback onPressed;
  final double? borderRadius;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: borderColor ?? KAppColors.kBorderLighterGray,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(
              borderRadius ?? 12,
            ),
          ),
        ),
        onPressed: onPressed,
        child: ListTile(
          visualDensity: const VisualDensity(
            vertical: VisualDensity.minimumDensity,
          ),
          leading: SvgPicture.asset(image),
          title: Text(
            title,
            textAlign: TextAlign.center,
            style:titleStyle?? KAppTextStyle.interBold16,
          ),
        ),
      ),
    );
  }
}
