import 'package:flutter/material.dart';
import 'package:travel_app/core/extension/sizedbox_extention.dart';
import 'package:travel_app/data/model/place_model.dart';
import 'package:travel_app/res/colors.dart';
import 'package:travel_app/widgets/buttom_nav/add_plans/place_widget.dart';

class PlacesList extends StatelessWidget {
  final List<Place> places;

  const PlacesList({super.key, required this.places});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // الخط العمودي
          Container(
            width: 4,
            color: KAppColors.primaryColor,
          ),
          12.sW,
          // قائمة الأماكن
          Expanded(
            child: Column(
              children: places.map((place) {
                return PlaceWidget(place: place);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

