import 'package:flutter/material.dart';
import 'package:travel_app/core/extension/context_extensions.dart';
import 'package:travel_app/core/extension/sizedbox_extention.dart';
import 'package:travel_app/res/eni_assets.dart';
import 'package:travel_app/routes/k_routes_enigma.dart';
import 'package:travel_app/widgets/enigma_bottom_nav/my_profile_sections_item.dart';
import 'package:travel_app/widgets/enigma_bottom_nav/section_name_widget.dart';

class SettingSection extends StatelessWidget {
  const SettingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionNameWidget(
            sectionName: context.translate(
          "Settings",
        )),
        12.sH,
        MyProfileSectionsItem(
          title: "Change language",
          iconName: KAppSvgsEni.changeLanguageIcon,
          onTap: () {},
        ),
        MyProfileSectionsItem(
          title: "Privacy policy",
          iconName: KAppSvgsEni.privacyPolicyIcon,
          onTap: () {
            context.navNamedTo(KAppRoutesEni.privacyPolicyPage);
          },
        ),
        MyProfileSectionsItem(
          title: "Terms and conditions",
          iconName: KAppSvgsEni.termsAndConditionsIcon,
          onTap: () {},
        ),
        MyProfileSectionsItem(
          title: "Rate app",
          iconName: KAppSvgsEni.rateAppIcon,
          onTap: () {},
        ),
        MyProfileSectionsItem(
          title: "Share app",
          iconName: KAppSvgsEni.shareAppIcon,
          onTap: () {},
        ),
      ],
    );
  }
}
