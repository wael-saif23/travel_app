import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/extension/sizedbox_extention.dart';
import 'package:travel_app/core/utils/app_text_styles.dart';
import 'package:travel_app/data/model/category_model.dart';
import 'package:travel_app/res/colors.dart';

class ViewAllPopupMenuButtonWidget extends StatelessWidget {
  const ViewAllPopupMenuButtonWidget({
    super.key,
    this.categoryList,
    this.onItemSelected,
  });

  final List<CategoryModel>? categoryList; // قائمة العناصر
  final void Function(String)? onItemSelected; // عند اختيار عنصر

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: KAppColors.kBorderLighterGray,
      shadowColor: Colors.black,
      elevation: 10,
      splashRadius: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          side: BorderSide(color: KAppColors.primaryColor, width: 2)),
      onSelected: (selectedItem) {
        if (onItemSelected != null) {
          onItemSelected!(selectedItem);
        }
      },
      itemBuilder: (context) =>
          categoryList
              ?.map(
                (item) => PopupMenuItem<String>(
                  labelTextStyle: WidgetStateProperty.all(KAppTextStyle
                      .poppinsRegular12
                      .copyWith(color: KAppColors.lightPrimaryColor)),
                  value: item.title,
                  child: Text(item.title!),
                ),
              )
              .toList() ??
          [],
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
    );
  }
}
