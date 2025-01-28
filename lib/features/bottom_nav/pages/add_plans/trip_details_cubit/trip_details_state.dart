part of 'trip_details_cubit.dart';

sealed class TripDetailsState {
  const TripDetailsState();
}

final class TripDetailsInitialState extends TripDetailsState {
  final bool isExpanded;
  final bool isCenterTitle;
  TripDetailsInitialState({this.isExpanded = true, this.isCenterTitle = true});
}

final class TripDetailsLoadingState extends TripDetailsState {}

final class TripDetailsFailedState extends TripDetailsState {
  final String message;

  TripDetailsFailedState(this.message);
}

final class TripDetailsSuccessState extends TripDetailsState {
  final TripDay? tripDay;
  final bool isExpanded;
  final bool isCenterTitle;
  TripDetailsSuccessState(
      {this.tripDay, required this.isExpanded, required this.isCenterTitle});
}

final class TripDetailsEmptyState extends TripDetailsState {
  final String message;

  TripDetailsEmptyState(this.message);
}

final class TripDetailsEmptyPlacesState extends TripDetailsState {
  final String message;

  TripDetailsEmptyPlacesState(this.message);
}

final class TripDetailsScrollState extends TripDetailsState {
  final bool isExpanded;
  final bool isCenterTitle;
  TripDetailsScrollState(
      {required this.isExpanded, required this.isCenterTitle});
}
