import 'package:bloc/bloc.dart';

import 'package:travel_app/data/model/trip_day_model.dart';
import 'package:async/async.dart';
part 'trip_details_state.dart';

class TripDetailsCubit extends Cubit<TripDetailsState> {
  TripDetailsCubit() : super(TripDetailsInitialState());

  CancelableOperation? _loadTripDetailsOperation;

void loadeTripDetails()async {
  emit(TripDetailsLoadingState());
  _loadTripDetailsOperation = CancelableOperation.fromFuture(
    Future.delayed(Duration(seconds: 1)), // محاكاة جلب البيانات من API
    onCancel: () => emit(TripDetailsFailedState("Operation canceled.")),
  );

  try {
    await _loadTripDetailsOperation?.value;
    emit(TripDetailsSuccessState(
      isExpanded: true,
      isCenterTitle: true,
    ));
  } catch (e) {
    emit(TripDetailsFailedState(
        "Failed to load trip details. Please try again."));
  }
}

 void updateScrollState(bool isExpanded, bool isCenterTitle) {
    emit(TripDetailsScrollState(isExpanded: isExpanded, isCenterTitle: isCenterTitle));
  }

}
