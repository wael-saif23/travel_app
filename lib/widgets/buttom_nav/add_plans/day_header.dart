import 'package:flutter/material.dart';
import 'package:travel_app/core/extension/sizedbox_extention.dart';
import 'package:travel_app/core/utils/app_text_styles.dart';
import 'package:travel_app/res/colors.dart';

class DayHeader extends StatelessWidget {
  final String day;
  final int placesCount;
  final bool isExpanded;
  final VoidCallback onToggleExpansion;

  const DayHeader({
    super.key,
    required this.day,
    required this.placesCount,
    required this.isExpanded,
    required this.onToggleExpansion,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              icon: Icon(
                isExpanded ? Icons.expand_more : Icons.expand_less,
                size: 28,
                color: KAppColors.blacPrimaryColor,
              ),
              onPressed: onToggleExpansion,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      day,
                      style: KAppTextStyle.sourceSansProBold18
                          .copyWith(color: KAppColors.blacPrimaryColor),
                    ),
                    8.sW,
                    Icon(
                      Icons.calendar_month,
                      size: 18,
                      color: KAppColors.blacPrimaryColor,
                    ),
                  ],
                ),
                if (!isExpanded) ...[
                  3.sH,
                  Text(
                    '$placesCount places',
                    style: KAppTextStyle.sourceSansProBold16
                        .copyWith(color: KAppColors.kGray),
                  ),
                ],
              ],
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_horiz),
          padding: EdgeInsets.zero,
        ),
      ],
    );
  }
}

