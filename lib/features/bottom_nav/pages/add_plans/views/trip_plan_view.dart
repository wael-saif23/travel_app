import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/features/bottom_nav/pages/add_plans/add_plans_cubit/add_plans_cubit.dart';
import 'package:travel_app/helper/functions/custom_simple_appbar.dart';
import 'package:travel_app/res/colors.dart';
import 'package:travel_app/widgets/buttom_nav/add_plans/trip_plan_view_body.dart';
import 'package:travel_app/widgets/customs/scaffold_pattern.dart';

class TripPlanView extends StatelessWidget {
  const TripPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPattern(
      appBarBackgroundColor: KAppColors.primaryColor,
      statusBarIsLight: false,
      appBar: customSimpleAppbar(
        context: context,
        onleadingButtonTap: () {
          context.read<AddPlansCubit>().loadPlans();
        },
        title: "Trip_Plan",
      ),
      child: TripPlanViewBody(),
    );
  }
}
