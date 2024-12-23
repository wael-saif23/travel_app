import 'package:flutter/material.dart';
import 'package:travel_app/res/style.dart';
import 'package:travel_app/widgets/auth/auth_head_text.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 82),
          AuthHeadText(),
          KAppStyle.moreMaxSH,
          
        ],
      ),
    );
  }
}

