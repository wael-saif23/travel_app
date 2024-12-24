import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/core/extension/context_extensions.dart';
import 'package:travel_app/core/extension/sizedbox_extention.dart';
import 'package:travel_app/core/utils/app_text_styles.dart';
import 'package:travel_app/res/assets.dart';
import 'package:travel_app/routes/k_routes.dart';
import 'package:travel_app/widgets/auth/auth_head_text.dart';
import 'package:travel_app/widgets/customs/custom_app_bar.dart';
import 'package:travel_app/widgets/customs/custom_button.dart';
import 'package:travel_app/widgets/customs/custom_text_form_field.dart';
import 'package:travel_app/widgets/dialogs/show_popup.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

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
              headText: context.translate("Forgot_password"),
              subHeadText: context
                  .translate("Enter_your_email_account_to_reset_your_password"),
            ),
            40.sH,
            CustomTextFormField(
              hintText: context.translate("Your_email"),
              prefixIconName: KAppSvgs.emailIcon,
            ),
            40.sH,
            CustomButton(
              onPressed: () {
                showDialog(context);
                Future.delayed(Duration(seconds: 3), () {
                  Navigator.pop(context);
                  context.navNamedTo(KAppRoutes.otpVerificationView);
                });
              },
              text: context.translate("Reset_Password"),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> showDialog(BuildContext context) {
    return showPopup(
      context: context,
      // it dosent matter what you pass here as it will be ignored!!!!
      dialogPadding: EdgeInsets.symmetric(
        horizontal: 57.h,
        vertical: 47.0.h,
      ),
      childContent: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 47.0.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(KAppSvgs.checkEmailIcon),
            37.sH,
            AuthHeadText(
                headText: context.translate("Check_your_email"),
                subHeadText:
                    context.translate("We_have_send_password_recovery"),
                headTextStyle: KAppTextStyle.poppinsBold18.copyWith(
                  color: Color(0xff1B1E28),
                ))
          ],
        ),
      ),
    );
  }
}
