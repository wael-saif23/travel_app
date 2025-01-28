import 'package:flutter/material.dart';
import 'package:travel_app/core/utils/app_text_styles.dart';
import 'package:travel_app/data/model/category_model.dart';
import 'package:travel_app/res/colors.dart';
import 'package:travel_app/widgets/customs/popup_menu_button_widget.dart';

class CustomHeadCategoryWidget extends StatelessWidget {
  const CustomHeadCategoryWidget({
    super.key,
    required this.headName,
    this.onTap,
    this.subtitle,
    this.categoryList,
  });
  final String headName;
  final String? subtitle;
  final VoidCallback? onTap;
  final List<CategoryModel>? categoryList;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        GenericPopupMenuButton<CategoryModel>(
          itemList: categoryList, // قائمة العناصر
          onItemSelected: (selectedCategory) {
          },
          itemToString: (category) => category.title!, // تحويل العنصر إلى نص
        )
      
      ],
    );
  }
}
