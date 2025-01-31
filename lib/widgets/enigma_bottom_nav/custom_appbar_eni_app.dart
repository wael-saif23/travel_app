import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/core/utils/eni_app_text_styles.dart';
import 'package:travel_app/res/eni_assets.dart';
import 'package:travel_app/res/eni_colors.dart';
import 'package:travel_app/widgets/enigma_bottom_nav/profile_image_with_action.dart';

class CustomAppBarEniApp extends StatelessWidget {
  const CustomAppBarEniApp({
    super.key,
    required this.title,
    this.networkUrlImage,
    this.svgActionIcon,
    this.pngActionIcon,
    this.showBackButton = false,
    this.onBackButtonPressed,
    this.onActionPressed,
    this.horizontalPadding,
  });
  final String title;
  final String? networkUrlImage;
  final String? svgActionIcon;
  final String? pngActionIcon;
  final bool? showBackButton;
  final VoidCallback? onBackButtonPressed;
  final VoidCallback? onActionPressed;
  final double? horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: [.3, 1],
          colors: [KAppENIColors.secondaryColor, KAppENIColors.blackColor],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 30.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            showBackButton!
                ? GestureDetector(
                    onTap: onBackButtonPressed,
                    child: SvgPicture.asset(
                      KAppSvgsEni.arrowBackIcon,
                      height: 20.h,
                    ),
                  )
                : ProfileImageWithAction(
                    positionBottom: 0,
                    positionRight: 0,
                    networkUrlImage: networkUrlImage,
                    imageRadius: 21.r,
                    actionBackgroundRadius: 5.r,
                  ),
            Text(
              title,
              style: KAppTextStyleEni.segoeUIBold28,
            ),
            GestureDetector(
              onTap: onActionPressed,
              child: pngActionIcon != null
                  ? Image.asset(
                      pngActionIcon!,
                      height: 34.h,
                    )
                  : svgActionIcon != null
                      ? SvgPicture.asset(
                          svgActionIcon!,
                          fit: BoxFit.fill,
                        )
                      : SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
