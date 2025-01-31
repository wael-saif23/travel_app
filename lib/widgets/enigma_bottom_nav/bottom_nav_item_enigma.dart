import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/core/extension/sizedbox_extention.dart';
import 'package:travel_app/core/utils/eni_app_text_styles.dart';

class BottomNavItemEni extends StatelessWidget {
  const BottomNavItemEni({
    super.key,
    required this.label,
    required this.iconUnselected,
    required this.isSelected,
    required this.onSelect,
    required this.iconSelected,
    required this.itemNumber,
  });

  final String label;
  final String iconSelected;
  final String iconUnselected;
  final bool isSelected;
  final int itemNumber;
  final Function() onSelect;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            isSelected ? iconSelected : iconUnselected,
          ),
          6.sH,
          Text(label,
              style: isSelected
                  ? KAppTextStyleEni.segoeUIsemibold11White
                  : KAppTextStyleEni.segoeUIsemibold11GrayOpacity),
        ],
      ),
    );
  }
}
