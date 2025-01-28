import 'package:flutter/material.dart';
import 'package:travel_app/core/extension/sizedbox_extention.dart';
import 'package:travel_app/core/utils/app_text_styles.dart';
import 'package:travel_app/data/model/trip_day_model.dart';
import 'package:travel_app/res/colors.dart';
import 'package:travel_app/widgets/buttom_nav/add_plans/day_header.dart';
import 'package:travel_app/widgets/buttom_nav/add_plans/places_list.dart';
import 'package:travel_app/widgets/customs/custom_button.dart';

class DayWidget extends StatelessWidget {
  final TripDay dayData;
  final bool isExpanded;
  final VoidCallback onToggleExpansion;
  final VoidCallback onAddPlace;

  const DayWidget({
    super.key,
    required this.dayData,
    required this.isExpanded,
    required this.onToggleExpansion,
    required this.onAddPlace,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 16, top: 15),
          child: Column(
            children: [
              // عنوان اليوم
              DayHeader(
                day: dayData.day,
                placesCount: dayData.places!.length,
                isExpanded: isExpanded,
                onToggleExpansion: onToggleExpansion,
              ),
              const SizedBox(height: 8),
              // قائمة الأماكن (إذا كانت موسعة)
              AnimatedCrossFade(
                duration: const Duration(milliseconds: 300),
                crossFadeState: isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                firstChild: Container(), // فارغ عندما تكون القائمة مطوية
                secondChild: Column(
                  children: [
                    PlacesList(places: dayData.places!),
                    Transform.translate(
                      offset: Offset(16, 0),
                      child: CustomButton(
                        vMargin: 0,
                        hMargin: 46,
                        verticalPadding: 12,
                        borderRadius: 5,
                        trailingIcon: Icons.add,
                        trailingIconSize: 18,
                        onPressed: onAddPlace,
                        text: "Add a New Place",
                        textStyle: KAppTextStyle.sourceSansProBold16.copyWith(
                          color: KAppColors.white,
                        ),
                      ),
                    ),
                    10.sH,
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 15,
          color: KAppColors.kGray,
          endIndent: 16,
          indent: 16,
          thickness: .8,
        ),
      ],
    );
  }
}
