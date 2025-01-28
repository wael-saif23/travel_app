import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/core/extension/context_extensions.dart';
import 'package:travel_app/features/bottom_nav/pages/add_plans/add_plans_cubit/add_plans_cubit.dart';
import 'package:travel_app/widgets/customs/custom_trip_plan_widget.dart';

class MyPlansViewBody extends StatelessWidget {
  const MyPlansViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPlansCubit, AddPlansState>(
      builder: (context, state) {
        if (state is MyplansLoadingState) {
          return Center(child: CircularProgressIndicator()); // عرض تحميل
        } else if (state is MyplansSuccessState) {
          return plansListView(state);
        } else if (state is MyPlansFailedState) {
          return Center(child: Text(state.message)); // عرض رسالة الخطأ
        } else if (state is MyPlansEmptyState) {
          return Center(child: Text(state.message)); // عرض رسالة عدم وجود رحلات
        }
        // الحالة الافتراضية (إذا لم تكن هناك بيانات)
        return Center(
          child: Text(
            context.translate("Welcome! Choose a trip to start planning."),
          ),
        );
      },
    );
  }

  ListView plansListView(MyplansSuccessState state) {
    return ListView.builder(
          itemCount: state.plans.length,
          itemBuilder: (context, index) {
            final theTrip = state.plans[index];
            return CustomTripPlanWidget(
              onTap: () =>
                  context.read<AddPlansCubit>().loadTripPlan(theTrip),
              theTrip: theTrip,
            ); // عرض كل رحلة باستخدام PlanCard
          },
        );
  }
}
