import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/features/bottom_nav/pages/add_plans/add_plans_cubit/add_plans_cubit.dart';
import 'package:travel_app/features/bottom_nav/pages/add_plans/views/my_plans_view.dart';
import 'package:travel_app/features/bottom_nav/pages/add_plans/views/trip_plan_view.dart';

class AddPlansView extends StatelessWidget {
  const AddPlansView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) =>
          AddPlansCubit()..loadPlans(), // تحميل الرحلات عند الإنشاء
      child: BlocBuilder<AddPlansCubit, AddPlansState>(
        builder: (context, state) {
          if (state is TripPlanViewState) {
            return TripPlanView();
          } else {
            return MyPlansView();
          }
        },
      ),
    );
  }
}

