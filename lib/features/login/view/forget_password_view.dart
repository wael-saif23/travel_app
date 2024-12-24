import 'package:flutter/material.dart';
import 'package:travel_app/widgets/auth/forget_password_view_body.dart';
import 'package:travel_app/widgets/customs/scaffold_pattern.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPattern(
      child: ForgetPasswordViewBody(),
    );
  }
}
