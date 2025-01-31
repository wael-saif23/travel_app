import 'package:flutter/material.dart';
import 'package:travel_app/core/extension/context_extensions.dart';
import 'package:travel_app/core/extension/sizedbox_extention.dart';
import 'package:travel_app/core/utils/eni_app_text_styles.dart';
import 'package:travel_app/res/eni_assets.dart';
import 'package:travel_app/res/eni_colors.dart';

class DeleteAccountWidget extends StatelessWidget {
  const DeleteAccountWidget({
    super.key,
    this.onTap,
  });
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            KAppPngsEni.deletIcon,
            height: 8,
          ),
          2.sW,
          Text(
            context.translate("Delete account"),
            style: KAppTextStyleEni.segoeUIRegular7.copyWith(
              decoration: TextDecoration.underline,
              decorationColor: KAppENIColors.whiteColor,
              decorationThickness: 1.5,
            ),
          )
        ],
      ),
    );
  }
}
