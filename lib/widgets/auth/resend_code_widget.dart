import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/core/extension/context_extensions.dart';
import 'package:travel_app/core/utils/app_text_styles.dart';
import 'package:travel_app/features/auth/otp_verification/cubit/otp_verification_cubit.dart';
import 'package:travel_app/res/colors.dart';

class ResendCodeWidget extends StatelessWidget {
  const ResendCodeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtpVerificationCubit, OtpVerificationState>(
      builder: (context, state) {
        if (state is OtpVerificationInitial) {
          context.read<OtpVerificationCubit>().startTimer(120); // دقيقتين
        } // المتغيرات الافتراضية لعرض التايمر
        String timerText = '00 : 00'; // النص الافتراضي إذا لم يتم تشغيل التايمر
        bool isButtonDisabled = false; // زر "Resend OTP" مفعل بشكل افتراضي

        // إذا كانت حالة التايمر تعمل
        if (state is TimerRunning) {
          final minutes = (state.secondsLeft ~/ 60).toString().padLeft(2, '0');
          final seconds = (state.secondsLeft % 60).toString().padLeft(2, '0');
          timerText = '$minutes : $seconds';
          isButtonDisabled = true; // تعطيل الزر أثناء عمل التايمر
        }

        // إذا انتهى التايمر
        if (state is TimerCompleted) {
          isButtonDisabled = false; // تفعيل الزر عند انتهاء التايمر
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: isButtonDisabled
                  ? null // تعطيل الزر إذا كان التايمر يعمل
                  : () {
                      // إعادة إرسال رمز التحقق
                      // context.read<OtpVerificationCubit>().resendOtp();
                      context
                          .read<OtpVerificationCubit>()
                          .startTimer(120); // إعادة تشغيل التايمر
                    },
              style: ButtonStyle(
                padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
              ),
              child: Text(
                context.translate("Resend_OTP"),
                style: KAppTextStyle.poppinsSemiBold14.copyWith(
                  color: isButtonDisabled
                      ? KAppColors.kLighterGrayInAUTH
                      : KAppColors.lightPrimaryColor,
                ),
              ),
            ),
            Text(
              timerText, // عرض الوقت المتبقي,
              style: KAppTextStyle.poppinsSemiBold14.copyWith(
                color: KAppColors.kLighterGrayInAUTH,
              ),
            ),
          ],
        );
      },
    );
  }
}
