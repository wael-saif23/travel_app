import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/extension/sizedbox_extention.dart';
import 'package:travel_app/core/utils/app_text_styles.dart';
import 'package:travel_app/res/colors.dart';

class CustomHeadCategoryWidget extends StatelessWidget {
  const CustomHeadCategoryWidget({
    super.key,
    required this.headName,
    this.onTap,
    this.subtitle,
  });
  final String headName;
  final String? subtitle;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              headName,
              style: KAppTextStyle.poppinsSemiBold16.copyWith(
                color: KAppColors.blacPrimaryColor,
              ),
            ),
            subtitle != null
                ? Text(
                    subtitle!,
                    style: KAppTextStyle.poppinsRegular12.copyWith(
                      color: KAppColors.kGray,
                    ),
                  )
                : SizedBox(),
          ],
        ),
        Spacer(),
        InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Text(
                "View All",
                style: KAppTextStyle.poppinsMedium14.copyWith(
                  color: KAppColors.kGray,
                ),
              ),
              2.sW,
              Transform.rotate(
                angle: -90 * pi / 180,
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 12.sp,
                  color: KAppColors.kGray,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
