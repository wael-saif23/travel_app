part of 'add_plans_cubit.dart';

@immutable
sealed class AddPlansState {}

final class InitialState extends AddPlansState {}

final class MyPlansViewState extends AddPlansState {}

final class TripPlanViewState extends AddPlansState {}

final class TripPlanDetailsState extends AddPlansState {}

/////////////////////////////////////////////////////////////////////
final class MyplansLoadingState extends MyPlansViewState {}

final class MyPlansFailedState extends MyPlansViewState {
  final String message;

  MyPlansFailedState(this.message);
}

final class MyplansSuccessState extends MyPlansViewState {
  final List<PlansModel> plans;
  MyplansSuccessState({required this.plans});
}

final class MyPlansEmptyState extends MyPlansViewState {
  final String message;

  MyPlansEmptyState(this.message);
}
/////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////
final class TripPlanLoadingState extends TripPlanViewState {}

final class TripPlanFailedState extends TripPlanViewState {
  final String message;

  TripPlanFailedState(this.message);
}

final class TripPlanSuccessState extends TripPlanViewState {
  final List<TripDay> days;
  final int? selectedDayIndex;
  final Set<int> expandedDays;
  final PlansModel? selectedTrip;
  final ExpensesSortOrder expensesSortOrder;
  final bool isExpensesExpanded;
  TripPlanSuccessState({
    required this.days,
    required this.expandedDays,
    this.selectedDayIndex,
    this.selectedTrip,
    this.expensesSortOrder = ExpensesSortOrder.dateNewestFirst,
    this.isExpensesExpanded = true,
  });
}

final class TripPlanEmptyDaysState extends TripPlanViewState {
  final String message;

  TripPlanEmptyDaysState(this.message);
}

final class TripPlanEmptyPlacesState extends TripPlanViewState {
  final String message;
  TripPlanEmptyPlacesState(this.message);
}

final class CurrencyChangedState extends TripPlanViewState {
  final String currency;
  CurrencyChangedState(this.currency);
}

final class PlaceAddedState extends TripPlanViewState {
  final Place place;
  PlaceAddedState(this.place);
}

/////////////////////////////////////////////////////////////////////
enum ExpensesSortOrder {
  dateNewestFirst,
  dateOldestFirst,
  priceHighestFirst,
  priceLowestFirst,
}

