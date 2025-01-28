import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/extension/context_extensions.dart';
import 'package:travel_app/core/extension/sizedbox_extention.dart';
import 'package:travel_app/core/utils/app_text_styles.dart';
import 'package:travel_app/res/colors.dart';

class FloatingNewPlanButton extends StatelessWidget {
  const FloatingNewPlanButton({
    super.key,
    this.onButtonTap,
  });
  final VoidCallback? onButtonTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        width: 120.w,
        height: 40.w,
        decoration: BoxDecoration(
          color: KAppColors.primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.translate("New_Plan"),
              style: KAppTextStyle.interSemiBold16.copyWith(
                color: KAppColors.white,
              ),
            ),
            6.sW,
            Container(
              width: 30.w,
              height: 30.w,
              decoration: BoxDecoration(
                color: KAppColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.add,
                color: KAppColors.primaryColor,
                size: 20.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
