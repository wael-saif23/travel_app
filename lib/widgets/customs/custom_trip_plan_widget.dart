import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/extension/context_extensions.dart';
import 'package:travel_app/core/utils/app_text_styles.dart';
import 'package:travel_app/data/model/plans_model.dart';
import 'package:travel_app/res/assets.dart';
import 'package:travel_app/res/colors.dart';
import 'package:travel_app/widgets/buttom_nav/add_plans/trip_plan_days_widget.dart';

class CustomTripPlanWidget extends StatelessWidget {
  const CustomTripPlanWidget({
    super.key,
    this.onTap,
    required this.theTrip,
  });

  final VoidCallback? onTap;
  final PlansModel theTrip;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: KAppColors.white,
        margin: EdgeInsets.only(bottom: 10.h),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 20.h,
          ),
          leading: ClipOval(
            child: Image.asset(
              theTrip.profileImage ?? KAppPngs.userExImage,
              width: 50.w,
              height: 50.h,
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              "${context.translate("Trip to ")}${theTrip.tripName}",
              style: KAppTextStyle.sourceSansProBold24.copyWith(
                fontSize: 21,
                color: KAppColors.blacPrimaryColor,
              ),
            ),
          ),
          subtitle: TripPlanDaysWidget(
            dateFrom: theTrip.startingDate,
            dateTo: theTrip.endingDate,
          ),
        ),
      ),
    );
  }
}
