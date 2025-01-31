import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/extension/context_extensions.dart';
import 'package:travel_app/core/utils/eni_app_text_styles.dart';
import 'package:travel_app/res/eni_colors.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({
    super.key,
    this.onTap,
  });
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32.h,
        width: 174.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          gradient: LinearGradient(
            colors: [
              KAppENIColors.primaryColor.withOpacity(.2),
              KAppENIColors.primaryColor,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Center(
          child: Transform.translate(
            offset: Offset(0, -2.h),
            child: Text(
              context.translate("Log out"),
              style: KAppTextStyleEni.segoeUIsemibold15,
            ),
          ),
        ),
      ),
    );
  }
}
