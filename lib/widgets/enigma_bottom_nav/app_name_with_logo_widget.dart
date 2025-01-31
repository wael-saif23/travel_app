import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/extension/context_extensions.dart';
import 'package:travel_app/core/extension/sizedbox_extention.dart';
import 'package:travel_app/core/utils/eni_app_text_styles.dart';
import 'package:travel_app/res/eni_assets.dart';

class AppNameWithLogoWidget extends StatelessWidget {
  const AppNameWithLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          KAppPngsEni.enigmaLogo,
          width: 106.w,
        ),
        16.sH,
        Text(
          context.translate("Enigma Chat"),
          style: KAppTextStyleEni.segoeUIBold21,
        )
      ],
    );
  }
}
