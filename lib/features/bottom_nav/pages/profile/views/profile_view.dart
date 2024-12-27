import 'package:flutter/material.dart';
import 'package:travel_app/widgets/customs/scaffold_pattern.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPattern(
      child: Center(
        child: Text('Profile View view'),
      ),
    );
  }
}
