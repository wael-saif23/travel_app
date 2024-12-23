import 'package:flutter/material.dart';
import 'package:travel_app/core/localization/app_localization.dart';
import 'package:travel_app/core/utils/app_text_styles.dart';
import 'package:travel_app/res/assets.dart';
import 'package:travel_app/res/colors.dart';
import 'package:travel_app/res/style.dart';
import 'package:travel_app/widgets/customs/social_login_button.dart';

class OrSocialSignWidget extends StatelessWidget {
  const OrSocialSignWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)?.translate("Or_with_email") ?? '',
          style: KAppTextStyle.interMedium14.copyWith(
            color: KAppColors.kLighterGray,
          ),
        ),
        KAppStyle.semiMidSH,
        Row(
          children: [
            Expanded(
              child: SocialLoginButton(
                image: KAppSvgs.appleIcon,
                onPressed: () {},
                title: 'Apple',
              ),
            ),
            KAppStyle.midSW,
            Expanded(
              child: SocialLoginButton(
                image: KAppSvgs.googleIcon,
                onPressed: () {},
                title: 'Google',
              ),
            ),
          ],
        )
      ],
    );
  }
}
