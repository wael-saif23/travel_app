import 'package:flutter/material.dart';
import 'package:travel_app/widgets/auth/otp_verification_view_body.dart';
import 'package:travel_app/widgets/customs/scaffold_pattern.dart';

class OtpVerificationView extends StatelessWidget {
  const OtpVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPattern(
      child: OTPVerificationViewBody(),
    );
  }
}
