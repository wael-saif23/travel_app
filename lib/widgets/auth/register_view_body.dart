import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/extension/context_extensions.dart';
import 'package:travel_app/core/extension/sizedbox_extention.dart';
import 'package:travel_app/res/assets.dart';
import 'package:travel_app/res/style.dart';
import 'package:travel_app/routes/k_routes.dart';
import 'package:travel_app/widgets/auth/auth_head_text.dart';
import 'package:travel_app/widgets/auth/have_or_not_account_widget.dart';
import 'package:travel_app/widgets/auth/or_social_sign_widget.dart';
import 'package:travel_app/widgets/customs/custom_button.dart';
import 'package:travel_app/widgets/customs/custom_text_form_field.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
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
              82.sH,
              AuthHeadText(
                headText: context.translate('Sign_up_now'),
                subHeadText: context
                    .translate("Please_fill_the_details_and_create_account"),
              ),
              KAppStyle.moreMaxSH,
              CustomTextFormField(
                hintText: context.translate("Your_name"),
                prefixIconName: KAppSvgs.user,
              ),
              KAppStyle.midSH,
              CustomTextFormField(
                hintText: context.translate("Your_email"),
                prefixIconName: KAppSvgs.emailIcon,
              ),
              KAppStyle.midSH,
              CustomTextFormField(
                hintText: context.translate('Min. 8 characters'),
                prefixIconName: KAppSvgs.passwordIcon,
                obscureText: isObscureText,
                onSuffixIconPressed: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
                suffixIconName: KAppSvgs.eyeSlashIcon,
              ),
              30.sH,
              CustomButton(
                onPressed: () {},
                text: context.translate("Sign_Up"),
                hMargin: 0.w,
                borderRadius: 12.r,
                horizontalPadding: 0,
                verticalPadding: 16.h,
              ),
              SizedBox(height: 30.h),
              OrSocialSignWidget(),
              KAppStyle.semiMidSH,
              HaveOrNotAccountWidget(
                onTapSign: () => context.navNamedTo(KAppRoutes.login),
                textHaveOrNotAccount:
                    context.translate("Already_have_an_account"),
                textSignupOrLogin: context.translate("Sign_In"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
