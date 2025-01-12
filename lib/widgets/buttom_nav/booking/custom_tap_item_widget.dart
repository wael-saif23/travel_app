import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/extension/context_extensions.dart';
import 'package:travel_app/core/utils/app_text_styles.dart';
import 'package:travel_app/res/colors.dart';

class CustomTapItemWidget extends StatelessWidget {
  const CustomTapItemWidget({
    super.key,
    required this.tapItemText,
    required this.isSelected,
  });
  final String tapItemText;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 40.h,
      child: Container(
          decoration: isSelected
              ? BoxDecoration(
                  color: KAppColors.secondScafoldColor,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: KAppColors.primaryColor, width: 1),
                )
              : null,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 6.h,
            ),
            child: Center(
              child: Text(
                context.translate(tapItemText),
                style: KAppTextStyle.poppinsMedium16,
              ),
            ),
          )),
    );
  }
}




