import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/core/extension/context_extensions.dart';
import 'package:travel_app/core/extension/sizedbox_extention.dart';
import 'package:travel_app/core/utils/eni_app_text_styles.dart';
import 'package:travel_app/res/eni_assets.dart';
import 'package:travel_app/res/eni_colors.dart';

class AddFriendButton extends StatelessWidget {
  const AddFriendButton({
    super.key, this.onTap,
  });
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32.h,
        width: 104.w,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: KAppENIColors.greyColor,
              blurRadius: 3.0,
              spreadRadius: 0.5,
              offset: Offset(0.0, 1.0),
            ),
          ],
          color: KAppENIColors.primaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              KAppSvgsEni.addFriendIcon,
              height: 18.3,
            ),
            5.sW,
            Text(
              context.translate("Add Friend"),
              style: KAppTextStyleEni.segoeUIsemibold11White,
            )
          ],
        ),
      ),
    );
  }
}
