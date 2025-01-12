part of 'otp_verification_cubit.dart';

@immutable
sealed class OtpVerificationState {}

final class OtpVerificationInitial extends OtpVerificationState {}
final class OtpVerificationLoading extends OtpVerificationState {}
final class OtpVerificationSuccess extends OtpVerificationState {}
final class OtpVerificationFailure extends OtpVerificationState {
  final String message;

  OtpVerificationFailure(this.message);
}

class TimerRunning extends OtpVerificationState {
  final int secondsLeft;
  TimerRunning(this.secondsLeft); 
}
class TimerCompleted extends OtpVerificationState {}