import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/extension/sizedbox_extention.dart';
import 'package:travel_app/core/utils/app_text_styles.dart';
import 'package:travel_app/res/colors.dart';

class TripPlanDaysWidget extends StatelessWidget {
  const TripPlanDaysWidget({super.key, required this.dateFrom, required this.dateTo, this.fontColor= KAppColors.kGray, this.textStyle});
final String dateFrom ;
  final String dateTo ;
  final Color? fontColor ;
  final TextStyle? textStyle ;
  @override
  Widget build(BuildContext context) {
    return   Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      size: 18.w,
                      color: fontColor,
                    ),
                    3.sW,
                    Text(
                      dateFrom,
                      style:textStyle?? KAppTextStyle.sourceSansProBold12.copyWith(
                        color: fontColor,
                      ),
                    ),
                    Text(
                      ' - ',
                      style:textStyle?? KAppTextStyle.sourceSansProBold12.copyWith(
                        color: fontColor,
                      ),
                    ),
                    Text(
                      dateTo,
                      style:textStyle?? KAppTextStyle.sourceSansProBold12.copyWith(
                        color: fontColor,
                      ),
                    )
                  ],
                )
              ;
  }
}