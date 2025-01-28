import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/extension/context_extensions.dart';
import 'package:travel_app/core/utils/app_text_styles.dart';
import 'package:travel_app/res/colors.dart';
import 'package:travel_app/widgets/buttom_nav/add_plans/trip_plan_days_widget.dart';

class DaysPlanWidget extends StatelessWidget {
  const DaysPlanWidget({
    super.key, required this.dateFrom, required this.dateTo, this.onTap,
  });
final String dateFrom ;
  final String dateTo ;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            context.translate("Days_Plan"),
            style: KAppTextStyle.sourceSansProBold24
                .copyWith(color: KAppColors.blacPrimaryColor),
          ),
          Container(
            padding: EdgeInsets.all(10),
            height: 40.h,
            decoration: ShapeDecoration(
              color: Color(0xffE9ECEF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: TripPlanDaysWidget(
              dateFrom: dateFrom,
              dateTo: dateTo,
              fontColor: KAppColors.blacPrimaryColor,
              textStyle: KAppTextStyle.sourceSansProBold14
                  .copyWith(color: KAppColors.blacPrimaryColor),
            ),
          )
        ],
      ),
    );
  }
}
