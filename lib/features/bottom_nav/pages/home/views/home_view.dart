import 'package:flutter/material.dart';
import 'package:travel_app/res/colors.dart';
import 'package:travel_app/widgets/buttom_nav/home_page/home_view_body.dart';
import 'package:travel_app/widgets/customs/scaffold_pattern.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPattern(
      appBarBackgroundColor: KAppColors.primaryColor,
      child: 
      HomeViewBody(
        
      ),
    );
  }
}
