import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/res/eni_colors.dart';

class CircleButtonWithIcon extends StatelessWidget {
  const CircleButtonWithIcon({
    super.key,
    this.onTap,
    this.svgiconPath,
    this.pngiconPath,
  });
  final void Function()? onTap;
  final String? svgiconPath;
  final String? pngiconPath;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          height: 32,
          width: 32,
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: [
              KAppENIColors.primaryColor,
              KAppENIColors.primaryColor.withOpacity(.2),
            ]),
          ),
          child: Center(
            child: svgiconPath != null
                ? SvgPicture.asset(
                    svgiconPath!,
                  )
                : (pngiconPath != null
                    ? Image.asset(
                        pngiconPath!,
                      )
                    : SizedBox()),
          ),
        ));
  }
}
