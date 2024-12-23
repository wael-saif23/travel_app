import 'package:flutter/material.dart';
import 'package:travel_app/core/localization/app_localization.dart';
import 'package:travel_app/core/utils/app_text_styles.dart';
import 'package:travel_app/res/style.dart';

class AuthHeadText extends StatelessWidget {
  const AuthHeadText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)?.translate("Sign_in_now")??'',
            style: KAppTextStyle.poppinsSemiBold26.copyWith(
              color: Color(0xff1B1E28),
            ),
          ),
          KAppStyle.smallMidSH,
          Text(
            AppLocalizations.of(context)?.translate("Please_sign_in_to_continue_our_app")??'',
            style: KAppTextStyle.poppinsRegular16.copyWith(
              color: Color(0xff7D848D),
            ),
          ),
        ],
      ),
    );
  }
}
