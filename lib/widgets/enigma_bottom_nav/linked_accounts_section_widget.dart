import 'package:flutter/material.dart';
import 'package:travel_app/core/extension/context_extensions.dart';
import 'package:travel_app/core/extension/sizedbox_extention.dart';
import 'package:travel_app/res/eni_assets.dart';
import 'package:travel_app/widgets/enigma_bottom_nav/my_profile_sections_item.dart';
import 'package:travel_app/widgets/enigma_bottom_nav/section_name_widget.dart';

class LinkedAccountsSection extends StatelessWidget {
  const LinkedAccountsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionNameWidget(
            sectionName: context.translate(
          "Linked accounts",
        )),
        10.sH,
        MyProfileSectionsItem(
          iconName: KAppSvgsEni.mobileNumberIcon,
          title: "Mobile Number",
          subtitle: "not linked",
          onTap: () {},
          showEditIcon: true,
        ),
        MyProfileSectionsItem(
          iconName: KAppSvgsEni.emailIcon,
          title: "E-mail",
          subtitle: "not linked",
          onTap: () {},
          showEditIcon: true,
        ),
      ],
    );
  }
}
