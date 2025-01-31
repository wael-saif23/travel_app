import 'package:flutter/material.dart';
import 'package:travel_app/core/utils/eni_app_text_styles.dart';

class SectionNameWidget extends StatelessWidget {
  const SectionNameWidget({
    super.key,
    required this.sectionName,
    this.horizontalPadding = 0,
  });
  final String sectionName;
  final double horizontalPadding;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Text(
          sectionName,
          style: KAppTextStyleEni.segoeUIsemibold19,
        ),
      ),
    );
  }
}