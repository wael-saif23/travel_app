import 'package:flutter/material.dart';
import 'package:travel_app/core/extension/sizedbox_extention.dart';
import 'package:travel_app/core/utils/eni_app_text_styles.dart';
import 'package:travel_app/res/eni_assets.dart';
import 'package:travel_app/res/eni_colors.dart';
import 'package:travel_app/widgets/customs/scaffold_pattern.dart';
import 'package:travel_app/widgets/enigma_bottom_nav/app_name_with_logo_widget.dart';
import 'package:travel_app/widgets/enigma_bottom_nav/custom_appbar_eni_app.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPattern(
      appBarBackgroundColor: KAppENIColors.blackColor,
      statusBarIsLight: false,
      backgroundColor: KAppENIColors.blackColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBarEniApp(
            showBackButton: true,
            title: "Privacy policy",
            svgActionIcon: KAppSvgsEni.showMoreThreeLinesIcon,
            onActionPressed: () {},
            onBackButtonPressed: () {
              Navigator.pop(context);
            },
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: AppNameWithLogoWidget()),
                  56.sH,
                  Text(
                    'It is a long established',
                    style: KAppTextStyleEni.segoeUIRegular13,
                  ),
                  Text(
                    "fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lore m Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here",
                    style: KAppTextStyleEni.segoeUIRegular14grayOpacity,
                  ),
                  60.sH,
                  Text(
                    'It is a long established',
                    style: KAppTextStyleEni.segoeUIRegular13,
                  ),
                  Text(
                    "fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lore m Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lore m Ipsum is that it has a more-or-less normal distribution of distracted by the readable content of a page when looking at its layout. The point of using Lore m Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content herfact that ae distracted by the readable content of a page when looking at its layout. The point of using Lore m Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content herfact that a dis of a page when looking at its layout. The point of using Lore m Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content her",
                    style: KAppTextStyleEni.segoeUIRegular14grayOpacity,
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}

