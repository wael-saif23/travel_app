import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/core/extension/context_extensions.dart';
import 'package:travel_app/core/extension/sizedbox_extention.dart';
import 'package:travel_app/core/utils/app_text_styles.dart';
import 'package:travel_app/res/assets.dart';
import 'package:travel_app/res/colors.dart';

class CustomSearchBarWidget extends StatelessWidget {
  const CustomSearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: KAppColors.kBorderLighterGray,
          width: 1.w,
        ),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(11),
              decoration: BoxDecoration(
                color: KAppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(6),
                  topLeft: Radius.circular(6),
                  bottomRight: Radius.circular(6),
                ),
              ),
              child: SvgPicture.asset(KAppSvgs.leadingSearchIcon),
            ),
          ),15.sW,
          Expanded(
            child: TextField(
              cursorColor: KAppColors.primaryColor,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: context.translate("Search_here"),
                hintStyle: KAppTextStyle.interRegular12.copyWith(
                  color: KAppColors.kGray,
                ),),
              onChanged: (value) {},
            ),
          ),15.sW,
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          )
        ],
      ),
    );
  }
}
