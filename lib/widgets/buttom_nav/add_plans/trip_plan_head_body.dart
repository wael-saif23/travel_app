import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/extension/context_extensions.dart';
import 'package:travel_app/core/utils/app_text_styles.dart';
import 'package:travel_app/features/bottom_nav/pages/add_plans/add_plans_cubit/add_plans_cubit.dart';
import 'package:travel_app/res/assets.dart';
import 'package:travel_app/res/colors.dart';
import 'package:travel_app/routes/k_routes.dart';
import 'package:travel_app/widgets/buttom_nav/add_plans/trip_plan_days_widget.dart';
import 'package:travel_app/widgets/customs/custom_button.dart';

class TripPlanHeadBody extends StatelessWidget {
  const TripPlanHeadBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 97,
      decoration: containerDecoration(),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Row(
        children: [
          ClipOval(
            child: Image.asset(
              KAppPngs.userExImage,
              width: 40.w,
              height: 40.h,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "${context.translate("Trip to ")}Luxor",
                    style: KAppTextStyle.sourceSansProBold24.copyWith(
                      fontSize: 21,
                      color: KAppColors.blacPrimaryColor,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: TripPlanDaysWidget(dateFrom: "01/05", dateTo: "05/05"),
                ),
                Transform.translate(
                  offset: const Offset(8, -16),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        // الانتقال الي صفحة التفاصيل
                        context.navNamedTo(KAppRoutes.tripDetailsView);
                      },
                      icon: Icon(Icons.more_horiz),
                      iconSize: 35,
                      color: KAppColors.kLighterGrayInAUTH,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Align(
                  alignment: Alignment.bottomRight,
                  child: newListButton(
                    context: context,
                    onPressed: () {
                      // اضافة قائمة جديدة
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  CustomButton newListButton({
    required BuildContext context,
    required Function() onPressed,
  }) {
    return CustomButton(
      onPressed: () {},
      hMargin: 0,
      width: 104.w,
      hieght: 35.h,
      horizontalPadding: 16.w,
      verticalPadding: 7.h,
      borderRadius: 5.r,
      text: context.translate("New list"),
      textStyle:
          KAppTextStyle.sourceSansProBold14.copyWith(color: KAppColors.white),
      leadingIcon: Icons.add,
      leadingIconSize: 18,
    );
  }

  BoxDecoration containerDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(8),
        bottomRight: Radius.circular(8),
      ),
      boxShadow: const [
        BoxShadow(
          color: Color(0x33000000),
          blurRadius: 8,
          offset: Offset(0, 2),
          spreadRadius: 0,
        ),
      ],
    );
  }
}
