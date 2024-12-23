import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/localization/app_localization.dart';
import 'package:travel_app/core/utils/app_text_styles.dart';
import 'package:travel_app/res/assets.dart';
import 'package:travel_app/res/colors.dart';
import 'package:travel_app/res/style.dart';
import 'package:travel_app/widgets/auth/auth_head_text.dart';
import 'package:travel_app/widgets/auth/have_or_not_account_widget.dart';
import 'package:travel_app/widgets/auth/or_social_sign_widget.dart';
import 'package:travel_app/widgets/customs/custom_button.dart';
import 'package:travel_app/widgets/customs/custom_text_form_field.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final formkey = GlobalKey<FormState>();
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 82.h),
              AuthHeadText(),
              KAppStyle.moreMaxSH,
              CustomTextFormField(
                hintText:
                    AppLocalizations.of(context)?.translate("Your_email") ?? '',
                prefixIconName: KAppSvgs.emailIcon,
              ),
              KAppStyle.maxSH,
              CustomTextFormField(
                hintText: AppLocalizations.of(context)
                        ?.translate('Min. 8 characters') ??
                    '',
                prefixIconName: KAppSvgs.passwordIcon,
                obscureText: isObscureText,
                onSuffixIconPressed: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
                suffixIconName: KAppSvgs.eyeSlashIcon,
              ),
              SizedBox(height: 22.h),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    AppLocalizations.of(context)
                            ?.translate("Forget_Password") ??
                        '',
                    style: KAppTextStyle.poppinsSemiBold14.copyWith(
                      color: KAppColors.lightPrimaryColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 22.h),
              CustomButton(
                onPressed: () {},
                text: AppLocalizations.of(context)?.translate("Sign_In") ?? '',
                hMargin: 0.w,
                borderRadius: 12.r,
                horizontalPadding: 0,
                verticalPadding: 16.h,
              ),
              SizedBox(height: 30.h),
              OrSocialSignWidget(),
              KAppStyle.semiMidSH,
              HaveOrNotAccountWidget(
                textHaveOrNotAccount: AppLocalizations.of(context)
                        ?.translate("Don’t_have_an_account?") ??
                    '',
                textSignupOrLogin:
                    AppLocalizations.of(context)?.translate("Sign_Up") ?? '',
              ),
              KAppStyle.maxSH,
              TextButton(
                onPressed: () {},
                child: Text(
                  AppLocalizations.of(context)?.translate("Skip") ?? '',
                  style: KAppTextStyle.interSemiBold16.copyWith(
                    color: KAppColors.blackColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
