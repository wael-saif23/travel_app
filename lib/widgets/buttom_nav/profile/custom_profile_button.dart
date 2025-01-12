import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/core/utils/app_text_styles.dart';
import 'package:travel_app/res/assets.dart';
import 'package:travel_app/res/colors.dart';

class CustomProfileButton extends StatelessWidget {
  const CustomProfileButton(
      {super.key,
      required this.buttonText,
      required this.leadingIconPath,
      required this.onTap,
      this.showDivider = true});
  final String buttonText;
  final String leadingIconPath;
  final VoidCallback onTap;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            contentPadding: EdgeInsets.zero,
            leading: SvgPicture.asset(
              leadingIconPath,
              height: 20.h,
              colorFilter: ColorFilter.mode(
                KAppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            title: Text(
              buttonText,
              style: KAppTextStyle.interMedium14.copyWith(
                  color: KAppColors.blacPrimaryColor, fontSize: 16.sp),
            ),
            trailing: InkWell(
                onTap: onTap,
                child: SvgPicture.asset(
                  KAppSvgs.arrowForwardIcon,
                  height: 16.h,
                ))),
        if (showDivider)
          Divider(
            height: 24.h,
            thickness: 1.h,
            color: KAppColors.kGray,
          ),
      ],
    );
  }
}
