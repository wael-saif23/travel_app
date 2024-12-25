import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/features/auth/otp_verification/cubit/otp_verification_cubit.dart';
import 'package:travel_app/widgets/auth/otp_verification_view_body.dart';
import 'package:travel_app/widgets/customs/scaffold_pattern.dart';

class OtpVerificationView extends StatelessWidget {
  const OtpVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPattern(
      child: BlocProvider(
        create: (context) => OtpVerificationCubit(),
        child: OTPVerificationViewBody(),
      ),
    );
  }
}
