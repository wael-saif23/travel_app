import 'package:flutter/material.dart';
import 'package:travel_app/res/eni_assets.dart';
import 'package:travel_app/res/eni_colors.dart';

class ProfileImageWithAction extends StatelessWidget {
  const ProfileImageWithAction({
    super.key,
    this.networkUrlImage,
    this.positionLeft,
    this.positionTop,
    this.positionRight,
    this.positionBottom,
    required this.imageRadius,
    required this.actionBackgroundRadius,
    this.actionChild,
    this.actionBackgroundColor,
  });

  final String? networkUrlImage;
  final double? positionLeft, positionTop, positionRight, positionBottom;
  final double imageRadius;
  final double actionBackgroundRadius;
  final Color? actionBackgroundColor;
  final Widget? actionChild;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: imageRadius,
          backgroundImage: networkUrlImage != null
              // امكانية اضافة الصورة من الانترنت  - مهم اضافتها
              // اذا لم تكن موجوده يكون فيه صورة استندر
              ? NetworkImage(networkUrlImage!)
              : AssetImage(KAppPngsEni.profilePictureExample),
        ),
        Positioned(
          bottom: positionBottom,
          right: positionRight,
          left: positionLeft,
          top: positionTop,
          child: CircleAvatar(
            radius: actionBackgroundRadius,
            backgroundColor:
                actionBackgroundColor ?? KAppENIColors.lighterGreenColor,
            child: actionChild != null ? Center(child: actionChild) : null,
          ),
        )
      ],
    );
  }
}
