import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/extension/context_extensions.dart';
import 'package:travel_app/core/extension/sizedbox_extention.dart';
import 'package:travel_app/core/utils/app_text_styles.dart';
import 'package:travel_app/res/assets.dart';
import 'package:travel_app/res/colors.dart';

class CustomTripPlanWidget extends StatelessWidget {
  const CustomTripPlanWidget({
    super.key,
    required this.tripName,
    this.profileImage,
    required this.startingDate,
    required this.endingDate,
    this.onTap,
  });
  final String tripName;
  final String? profileImage;
  final String startingDate;
  final String endingDate;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
              profileImage ?? KAppPngs.userExImage,
              width: 50.w,
              height: 50.h,
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              "${context.translate("Trip to ")}Luxor",
              style: KAppTextStyle.sourceSansProBold24.copyWith(
                fontSize: 21,
                color: KAppColors.blacPrimaryColor,
              ),
            ),
          ),
          subtitle: Row(children: [
            Icon(Icons.calendar_month),
            3.sW,
            Text(
              startingDate,
              style: KAppTextStyle.sourceSansProBold12.copyWith(
                color: KAppColors.kGray,
              ),
            ),
            Text(
              ' - ',
              style: KAppTextStyle.sourceSansProBold12.copyWith(
                color: KAppColors.kGray,
              ),
            ),
            Text(
              endingDate,
              style: KAppTextStyle.sourceSansProBold12.copyWith(
                color: KAppColors.kGray,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
