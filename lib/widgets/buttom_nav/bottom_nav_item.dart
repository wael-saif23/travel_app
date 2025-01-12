import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/core/extension/sizedbox_extention.dart';

import '../../core/utils/app_text_styles.dart';
import '../../res/colors.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    super.key,
    required this.label,
    required this.iconUnselected,
    required this.isSelected,
    required this.onSelect,
    required this.iconSelected,
    required this.itemNumber,
  });

  final String label;
  final String iconSelected;
  final String iconUnselected;
  final bool isSelected;
  final int itemNumber;
  final Function() onSelect;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width / itemNumber,
              child:isSelected? Divider(
                height: 0,
                thickness: 3,
                color: isSelected
                    ? KAppColors.primaryColor
                    : KAppColors.color_C3ACD0,
              ): SizedBox(),
            ),
          ),
          6.sH,
          SvgPicture.asset(
            isSelected ? iconSelected : iconUnselected,
            height: 24,
            colorFilter: ColorFilter.mode(
              isSelected ? KAppColors.primaryColor : KAppColors.kGray,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: isSelected
                ? KAppTextStyle.poppinsRegular12.copyWith(
                    color: KAppColors.primaryColor,
                  )
                : KAppTextStyle.poppinsRegular12.copyWith(
                    color: KAppColors.kGray,
                  ),
          ),
        ],
      ),
    );
  }
}
