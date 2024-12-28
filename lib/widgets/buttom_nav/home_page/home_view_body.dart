
import 'package:flutter/material.dart';
import 'package:travel_app/widgets/buttom_nav/custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAppBar(
          )
        ],
      ),
    );
  }
}

