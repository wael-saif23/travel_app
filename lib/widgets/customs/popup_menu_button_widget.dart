import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/extension/sizedbox_extention.dart';
import 'package:travel_app/core/utils/app_text_styles.dart';
import 'package:travel_app/res/colors.dart';

class GenericPopupMenuButton<T> extends StatelessWidget {
  const GenericPopupMenuButton({
    super.key,
    this.itemList,
    this.onItemSelected,
    required this.itemToString, this.title, this.titleAndArrowColor, this.titleTextStyle,
  });

  final List<T>? itemList;
  final void Function(T)? onItemSelected;
  final String Function(T) itemToString;
  final String? title;
  final TextStyle? titleTextStyle;
  final Color? titleAndArrowColor;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<T>(
      color: KAppColors.kBorderLighterGray,
      shadowColor: Colors.black,
      elevation: 10,
      splashRadius: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        side: BorderSide(color: KAppColors.primaryColor, width: 2),
      ),
      onSelected: (selectedItem) {
        if (onItemSelected != null) {
          onItemSelected!(selectedItem);
        }
      },
      itemBuilder: (context) => itemList
              ?.map(
                (item) => PopupMenuItem<T>(
                  labelTextStyle: WidgetStateProperty.all(
                    KAppTextStyle.poppinsRegular12.copyWith(
                      color: KAppColors.lightPrimaryColor,
                    ),
                  ),
                  value: item,
                  child: Text(itemToString(item)),
                ),
              )
              .toList() ??
          [],
      child: Row(
        children: [
          Text(
           title?? "View All",
            style:titleTextStyle?? KAppTextStyle.poppinsMedium14.copyWith(
              color:titleAndArrowColor?? KAppColors.kGray,
            ),
          ),
          2.sW,
          Transform.rotate(
            angle: -90 * pi / 180,
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 12.sp,
              color:titleAndArrowColor?? KAppColors.kGray,
            ),
          ),
        ],
      ),
    );
  }
}