import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/core/extension/sizedbox_extention.dart';
import 'package:travel_app/data/model/place_model.dart';
import 'package:travel_app/features/bottom_nav/pages/add_plans/add_plans_cubit/add_plans_cubit.dart';
import 'package:travel_app/widgets/buttom_nav/add_plans/add_place_dialog.dart';
import 'package:travel_app/widgets/buttom_nav/add_plans/day_widget.dart';
import 'package:travel_app/widgets/buttom_nav/add_plans/days_plan_widget.dart';
import 'package:travel_app/widgets/buttom_nav/add_plans/expenses_section.dart';
import 'package:travel_app/widgets/buttom_nav/add_plans/trip_plan_head_body.dart';

class TripPlanViewBody extends StatelessWidget {
  const TripPlanViewBody({super.key, this.onAddPlace});
  final VoidCallback? onAddPlace;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPlansCubit, AddPlansState>(
      builder: (context, state) {
        if (state is TripPlanLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is TripPlanFailedState) {
          return Center(child: Text(state.message));
        } else if (state is TripPlanEmptyDaysState) {
          return Center(child: Text(state.message));
        } else if (state is TripPlanSuccessState) {
          final cubit = BlocProvider.of<AddPlansCubit>(context);
          final days = state.days;
          final expandedDays = state.expandedDays;
          final expensesSortOrder = state.expensesSortOrder;
          final isExpensesExpanded = state.isExpensesExpanded;

          return Column(
            children: [
              const TripPlanHeadBody(),
              26.sH,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: DaysPlanWidget(
                  dateFrom: '01/05',
                  dateTo: "03/05",
                  onTap: () {},
                ),
              ),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final dayData = days[index];
                          return DayWidget(
                            dayData: dayData,
                            isExpanded: expandedDays.contains(index),
                            onToggleExpansion: () {
                              cubit.toggleDayExpansion(index);
                            },
                            onAddPlace: () {
                              // إظهار الديالوج مباشرةً
                              showDialog(
                                context: context,
                                builder: (context) => AddPlaceDialog(
                                  titleController: cubit.titleController,
                                  priceController: cubit.priceController,
                                  typeController: cubit.typeController,
                                  dateController: cubit.dateController,
                                  descriptionController:
                                      cubit.descriptionController,
                                  selectedCurrency: cubit.selectedCurrency,
                                  onCurrencySelected: (newCurrency) {
                                    cubit.changeCurrency(newCurrency);
                                  },
                                  onSave: () {
                                    cubit.savePlace();
                                    Navigator.of(context).pop();
                                    // cubit.loadTripPlan(cubit._plansList.first); // إعادة تحميل الحالة
                                  },
                                ),
                              );
                            },
                          );
                        },
                        childCount: days.length,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: ExpensesSection(
                        isExpanded: isExpensesExpanded,
                        places: days
                            .expand((day) => day.places ?? [])
                            .toList()
                            .cast<Place>(),
                        sortOrder: expensesSortOrder,
                        onSortOrderChanged: (newOrder) {
                          cubit.updateExpensesSortOrder(newOrder);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }

        return Center(child: Text("Welcome! Choose a trip to start planning."));
      },
    );
  }
}
