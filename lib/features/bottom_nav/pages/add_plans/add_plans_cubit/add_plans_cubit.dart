import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:async/async.dart';
import 'package:travel_app/data/model/place_model.dart';
import 'package:travel_app/data/model/plans_model.dart';
import 'package:travel_app/data/model/trip_day_model.dart';

part 'add_plans_state.dart';

class AddPlansCubit extends Cubit<AddPlansState> {
  AddPlansCubit() : super(InitialState());

  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String selectedCurrency = r"$"; // العملة المحددة

    // قائمة افتراضية للأماكن والخدمات
  final List<Place> _defaultPlaces = [
    Place(
      placeId: 1,
      name: "Mortuary Temple of Hatshepsut",
      time: "8:00 AM - 9:30 AM",
      location: "Al Qarna, Luxor Governorate, Egypt",
      price: "40.00",
      placetype: "Sightseeing",
      date: "May 1st",
      description: "A historic temple in Luxor.",
    ),
    Place(
      placeId: 2,
      name: "Deir el-Bahari",
      time: "8:00 AM - 9:30 AM",
      location: "Al Qarna, Luxor Governorate, Egypt",
      price: "40.00",

      placetype: "Sightseeing",
      date: "May 1st",
      description: "A historic site in Luxor.",
    ),
  ];

  // قائمة الرحلات الافتراضية
  final List<PlansModel> _plansList = const [
    PlansModel(
        tripId: 1,
        tripName: 'Luxor',
        startingDate: "01/05",
        endingDate: "05/05"),
    PlansModel(
        tripId: 2,
        tripName: 'Mansoura',
        startingDate: "01/05",
        endingDate: "05/05"),
  ];

  // قائمة الأيام الافتراضية
  final List<TripDay> _defaultDays = [
    TripDay(
      dayId: 1,
      day: "Wed, May 1st",
      places: [
        Place(
          placeId: 1,
          name: "Mortuary Temple of Hatshepsut",
          location: "Al Qarna, Luxor Governorate, Egypt",
          time: "8:00 AM - 9:30 AM",
          price: "\$40.00",
          date: 'May 1st',
          placetype: "Sightseeing"
        ),
        Place(
          placeId: 2,
          name: "Deir el-Bahari",
          location: "Al Qarna, Luxor Governorate, Egypt",
          time: "8:00 AM - 9:30 AM",
          price: "\$40.00",
          date: 'May 1st'
          ,placetype: "Activities"
        ),
      ],
    ),
    TripDay(
      dayId: 2,
      day: "Thu, May 2nd",
      places: [
         Place(

          placeId: 1,
          name: "Mortuary Temple of Hatshepsut",
          location: "Al Qarna, Luxor Governorate, Egypt",
          time: "8:00 AM - 9:30 AM",
          price: "\$40.00",
          date: 'May 2nd',
          placetype: "Sightseeing"
        ),
        Place(
          placeId: 2,
          name: "Deir el-Bahari",
          location: "Al Qarna, Luxor Governorate, Egypt",
          time: "8:00 AM - 9:30 AM",
          price: "\$40.00",
          date: 'May 2nd',
          placetype: "Activities"
        ),
      ],
    ),
    TripDay(
      dayId: 3,
      day: "Fri, May 3rd",
      places: [
          Place(
          placeId: 1,
          name: "Mortuary Temple of Hatshepsut",
          location: "Al Qarna, Luxor Governorate, Egypt",
          time: "8:00 AM - 9:30 AM",
          price: "\$40.00",
          date: 'May 3rd',
          placetype: "Sightseeing"
        ),
        Place(
          placeId: 2,
          name: "Deir el-Bahari",
          location: "Al Qarna, Luxor Governorate, Egypt",
          time: "8:00 AM - 9:30 AM",
          price: "\$40.00",
          date: 'May 3rd',
          placetype: "Activities"
        ),
      ],
    ),
  ];

  CancelableOperation? _loadPlansOperation;
  CancelableOperation? _loadTripPlanOperation;
  

  @override
  Future<void> close() {
    _loadPlansOperation?.cancel(); // إلغاء عملية تحميل الرحلات
    _loadTripPlanOperation?.cancel(); // إلغاء عملية تحميل تفاصيل الرحلة
    return super.close();
  }

  // تحميل قائمة الرحلات
  void loadPlans() async {
    emit(MyplansLoadingState());
    _loadPlansOperation = CancelableOperation.fromFuture(
      Future.delayed(Duration(seconds: 1)), // محاكاة جلب البيانات من API
      onCancel: () => emit(MyPlansFailedState("Operation canceled.")),
    );

    try {
      await _loadPlansOperation?.value;
      if (_plansList.isEmpty) {
        emit(MyPlansEmptyState("No trips available."));
      } else {
        emit(MyplansSuccessState(plans: _plansList));
      }
    } catch (e) {
      emit(MyPlansFailedState("Failed to load trips. Please try again."));
    }
  }

  // تحميل تفاصيل الرحلة
  void loadTripPlan(PlansModel trip) async {
    emit(TripPlanLoadingState());
    _loadTripPlanOperation = CancelableOperation.fromFuture(
      Future.delayed(Duration(seconds: 1)), // محاكاة جلب البيانات من API
      onCancel: () => emit(TripPlanFailedState("Operation canceled.")),
    );

    try {
      await _loadTripPlanOperation?.value;
      if (_defaultDays.isEmpty) {
        emit(TripPlanEmptyDaysState("No days available for this trip."));
      } else {
        emit(TripPlanSuccessState(
          days: _defaultDays,
          expandedDays: {},
          selectedDayIndex: null,
          selectedTrip: trip,
        ));
      }
    } catch (e) {
      emit(TripPlanFailedState(
          "Failed to load trip details. Please try again."));
    }
  }

  // تبديل حالة التوسيع والطي
  void toggleDayExpansion(int dayIndex) {
    if (state is TripPlanSuccessState) {
      final currentState = state as TripPlanSuccessState;
      final expandedDays = Set<int>.from(currentState.expandedDays);
      if (expandedDays.contains(dayIndex)) {
        expandedDays.remove(dayIndex);
      } else {
        expandedDays.add(dayIndex);
      }
      emit(TripPlanSuccessState(
        days: currentState.days,
        expandedDays: expandedDays,
        selectedDayIndex: currentState.selectedDayIndex,
        selectedTrip: currentState.selectedTrip,
      ));
    }
  }

  // التحقق من وجود أماكن في يوم معين
  void checkPlacesForDay(int dayIndex) {
    if (state is TripPlanSuccessState) {
      final currentState = state as TripPlanSuccessState;
      final day = currentState.days[dayIndex];

      if (day.places == null || day.places!.isEmpty) {
        emit(TripPlanEmptyPlacesState("No places available for this day."));
      } else {
        emit(TripPlanSuccessState(
          days: currentState.days,
          expandedDays: currentState.expandedDays,
          selectedDayIndex: currentState.selectedDayIndex,
          selectedTrip: currentState.selectedTrip,
        ));
      }
    }
  }

   // دالة لتحديث ترتيب المصروفات
  void updateExpensesSortOrder(ExpensesSortOrder newOrder) {
    if (state is TripPlanSuccessState) {
      final currentState = state as TripPlanSuccessState;
      emit(TripPlanSuccessState(
        days: currentState.days,
        expandedDays: currentState.expandedDays,
        expensesSortOrder: newOrder,
        isExpensesExpanded: currentState.isExpensesExpanded,
      ));
    }
  }

    // دالة لطي/فرد قسم المصروفات
  void toggleExpensesExpansion() {
    if (state is TripPlanSuccessState) {
      final currentState = state as TripPlanSuccessState;
      emit(TripPlanSuccessState(
        days: currentState.days,
        expandedDays: currentState.expandedDays,
        expensesSortOrder: currentState.expensesSortOrder,
        isExpensesExpanded: !currentState.isExpensesExpanded, // تبديل الحالة
      ));
    }
  }

  void changeCurrency(String newCurrency) {
    selectedCurrency = newCurrency;
    emit(CurrencyChangedState(newCurrency));
  }

  void savePlace() {
  final newPlace = Place(
    time: _defaultDays.last.places!.last.time,
    placeId: _defaultDays.length + 1,
    location:  _defaultDays.last.places!.last.location,
    name: titleController.text,
    price: priceController.text,
    placetype: typeController.text,
    date: dateController.text,
    description: descriptionController.text,
  );
  _defaultPlaces.add(newPlace); 
  loadTripPlan(_plansList.first); 
}

void showAddPlaceDialog() {
  emit(TripPlanSuccessState(
    days: _defaultDays,
    expandedDays: {},
    selectedDayIndex: null,
    selectedTrip: _plansList.first,
  ));
}



  
}




