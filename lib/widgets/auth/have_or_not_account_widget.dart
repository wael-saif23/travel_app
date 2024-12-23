import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/utils/app_text_styles.dart';
import 'package:travel_app/res/colors.dart';

class HaveOrNotAccountWidget extends StatelessWidget {
  const HaveOrNotAccountWidget({
    super.key, required this.textHaveOrNotAccount, required this.textSignupOrLogin, this.onTapSign,
  });
  final String textHaveOrNotAccount;
  final String textSignupOrLogin;
  final VoidCallback? onTapSign;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: textHaveOrNotAccount,
              style: KAppTextStyle.interRegular12.copyWith(
                color: Color(0xFF111827),
                fontSize: 16.sp,
              )),
          TextSpan(
            text: ' ',
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onTapSign,
            text: textSignupOrLogin,
            style: KAppTextStyle.interBold16
                .copyWith(color: KAppColors.lightPrimaryColor),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
