import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/res/eni_assets.dart';
import 'package:travel_app/res/eni_colors.dart';

class EditIconContainerWidget extends StatelessWidget {
  const EditIconContainerWidget({
    super.key,
    this.onEditPressed,
  });
  final VoidCallback? onEditPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onEditPressed,
      child: Container(
        padding: EdgeInsets.all(6),
        width: 30.w,
        height: 27.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              KAppENIColors.primaryColor.withOpacity(.2),
              KAppENIColors.primaryColor,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(7.r),
        ),
        child: SvgPicture.asset(
          KAppSvgsEni.editPenIcon,
        ),
      ),
    );
  }
}
