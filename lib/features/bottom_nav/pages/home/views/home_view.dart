import 'package:flutter/material.dart';
import 'package:travel_app/widgets/customs/scaffold_pattern.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScaffoldPattern(
      child: Center(
        
        child: Text('Home View view'),
      ),
    );
  }
}