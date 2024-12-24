import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/extension/context_extensions.dart';
import 'package:travel_app/core/extension/sizedbox_extention.dart';
import 'package:travel_app/core/utils/app_text_styles.dart';
import 'package:travel_app/res/colors.dart';
import 'package:travel_app/res/style.dart';
import 'package:travel_app/routes/k_routes.dart';
import 'package:travel_app/widgets/auth/auth_head_text.dart';
import 'package:travel_app/widgets/customs/custom_app_bar.dart';
import 'package:travel_app/widgets/customs/custom_button.dart';
import 'package:travel_app/widgets/customs/custom_text_form_field.dart';

class OTPVerificationViewBody extends StatelessWidget {
  const OTPVerificationViewBody({
    super.key,
  });
  final String? emailName = 'your_email@gmail.com';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 26.0),
        child: Column(
          children: [
            DefaultAppBar(
              hasNotification: false,
            ),
            40.sH,
            AuthHeadText(
              headText: context.translate("OTP_Verification"),
              subHeadText:
                  "${context.translate("Please_check_your_email ")}\n$emailName${context.translate("to_see_the_verification_code")}",
            ),
            66.sH,
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                context.translate("OTP_Code"),
                style: KAppTextStyle.poppinsSemiBold20.copyWith(
                  color: KAppColors.blacPrimaryColor,
                ),
              ),
            ),
            KAppStyle.midSH,
            Row(
              children: [
                Flexible(
                    child: CustomTextFormField(
                  hintText: 0.toString(),
                  textAlign: TextAlign.center,
                )),
                18.sW,
                Flexible(
                  child: CustomTextFormField(
                    hintText: 0.toString(),
                    textAlign: TextAlign.center,
                  ),
                ),
                8.sW,
                Flexible(
                  child: CustomTextFormField(
                    hintText: 0.toString(),
                    textAlign: TextAlign.center,
                  ),
                ),
                8.sW,
                Flexible(
                  child: CustomTextFormField(
                    hintText: 0.toString(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            65.sH,
            CustomButton(
              onPressed: () {
                context.navNamedTo(KAppRoutes.login);
              },
              text: context.translate("Verify"),
              hMargin: 0.w,
              borderRadius: 12.r,
              horizontalPadding: 0,
              verticalPadding: 16.h,
            ),
            KAppStyle.midSH,
            ResendCodeWidget()
          ],
        ),
      ),
    );
  }
}

class ResendCodeWidget extends StatelessWidget {
  const ResendCodeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            context.navNamedTo(KAppRoutes.forgetPassword);
          },
          child: Text(
            context.translate("Resend_OTP"),
            style: KAppTextStyle.poppinsSemiBold14.copyWith(
              color: KAppColors.kLighterGrayInAUTH,
            ),
          ),
        ),
        Text(
         '00 : 00',
          style: KAppTextStyle.poppinsSemiBold14.copyWith(
            color: KAppColors.kLighterGrayInAUTH,
          ),
        ),
      ],
    );
  }
}
