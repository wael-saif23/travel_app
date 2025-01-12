part of 'booking_cubit.dart';

@immutable
sealed class BookingState extends Equatable {
  const BookingState();
  @override
  List<Object> get props => [];
}

/// حالة التبويب النشط
class BookingTabChangedState extends BookingState {
  final int activeTab;

  const BookingTabChangedState(this.activeTab);

  @override
 get props => [activeTab];
}

/// الحالة الافتراضية للـ TabView
class BookingInitialState extends BookingState {}

/// حالة التحميل عند الانتقال بين الصفحات (إن لزم الأمر)
class BookingLoadingState extends BookingState {}

/// حالة تحميل بيانات الصفحة (مثال على صفحة "Past")
class BookingPastLoadedState extends BookingState {}

/// حالة تحميل بيانات الصفحة (مثال على صفحة "Canceled")
class BookingCanceledLoadedState extends BookingState {}

/// حالة تحميل بيانات الصفحة (مثال على صفحة "Active")
class BookingActiveLoadedState extends BookingState {}
