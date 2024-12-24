import 'package:flutter/material.dart';
import 'package:travel_app/core/utils/app_text_styles.dart';
import 'package:travel_app/res/colors.dart';
import 'package:travel_app/res/style.dart';

class AuthHeadText extends StatelessWidget {
  const AuthHeadText({
    super.key, required this.headText, this.headTextStyle, required this.subHeadText, this.subHeadTextStyle, this.subHeadTextHorizontalPadding,
  });
  final String headText;
  final TextStyle? headTextStyle;
  final String subHeadText;
  final TextStyle? subHeadTextStyle;
  final double? subHeadTextHorizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            headText,
            style:headTextStyle?? KAppTextStyle.poppinsSemiBold26.copyWith(
              color: KAppColors.blacPrimaryColor,
            ),
          ),
          KAppStyle.smallMidSH,
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:subHeadTextHorizontalPadding ?? 0),
            child: Text(
              subHeadText,
              style:subHeadTextStyle?? KAppTextStyle.poppinsRegular16.copyWith(
                color:KAppColors.kLighterGrayInAUTH,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
