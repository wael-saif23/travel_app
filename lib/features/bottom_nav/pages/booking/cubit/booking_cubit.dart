import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingInitialState());

  /// التبويب النشط
  int activeTab = 0;

  /// تغيير التبويب الحالي
  void changeTab(int index) {
    activeTab = index;
    emit(BookingTabChangedState(index));

    // يمكن إضافة تحميل بيانات الصفحة هنا بناءً على التبويب النشط
    _loadPageData(index);
  }

  /// تحميل البيانات للصفحات المختلفة
  void _loadPageData(int index) {
    emit(BookingLoadingState());

    // محاكاة تحميل البيانات (يمكن استبدالها بمنطق البيانات الخاص بك)
    Future.delayed(const Duration(milliseconds: 250), () {
      switch (index) {
        case 0:
          emit(BookingActiveLoadedState());
          break;
        case 1:
          emit(BookingPastLoadedState());
          break;
        case 2:
          emit(BookingCanceledLoadedState());
          break;
        default:
          emit(BookingInitialState());
          break;
      }
    });
  }
}
