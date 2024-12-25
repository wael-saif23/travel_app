import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'otp_verification_state.dart';

class OtpVerificationCubit extends Cubit<OtpVerificationState> {
  OtpVerificationCubit() : super(OtpVerificationInitial());

  
// للتعامل مع التايمر =====================================================
  Timer? _timer;

void startTimer(int duration) {

    emit(TimerRunning(duration)); // بدء التايمر بحالة TimerRunning
    _timer?.cancel(); // إلغاء أي تايمر سابق
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (duration > 0) {
        duration--;
        emit(TimerRunning(duration)); // تحديث الثواني المتبقية
      } else {
        timer.cancel();
        emit(TimerCompleted()); // التايمر انتهى
      }
    });
  }

  void resetTimer(int duration) {
    startTimer(duration); // إعادة ضبط التايمر
  }

  @override
  Future<void> close() {
    _timer?.cancel(); // التأكد من إلغاء التايمر عند التخلص من الكوبيد
    return super.close();
  }
  // =================================================================
}

