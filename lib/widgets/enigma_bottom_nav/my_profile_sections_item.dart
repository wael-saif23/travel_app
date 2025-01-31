import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/core/extension/context_extensions.dart';
import 'package:travel_app/core/utils/eni_app_text_styles.dart';
import 'package:travel_app/res/eni_assets.dart';
import 'package:travel_app/widgets/enigma_bottom_nav/editIcon_container_widget.dart';

class MyProfileSectionsItem extends StatelessWidget {
  const MyProfileSectionsItem({
    super.key,
    required this.title,
    required this.iconName,
    this.onTap,
    this.subtitle,
    this.showEditIcon = false,
  });
  final String title, iconName;
  final String? subtitle;
  final VoidCallback? onTap;
  final bool showEditIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        dense: true,
        contentPadding: EdgeInsets.zero,
        leading: SvgPicture.asset(iconName),
        title: Text(
          context.translate(title),
          style: KAppTextStyleEni.segoeUIRegular16,
        ),
        subtitle: subtitle != null
            ? Text(
                context.translate(
                  subtitle!,
                ),
                style: KAppTextStyleEni.segoeUISemilight14,
              )
            : null,
        trailing: showEditIcon
            ? EditIconContainerWidget(
                onEditPressed: onTap,
              )
            : GestureDetector(
                onTap: onTap,
                child: SvgPicture.asset(
                  KAppSvgsEni.arrowForwardIcon,
                ),
              ));
  }
}
