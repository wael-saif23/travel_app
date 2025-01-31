import 'package:flutter/material.dart';
import 'package:travel_app/res/eni_colors.dart';
import 'package:travel_app/widgets/customs/scaffold_pattern.dart';

class EniContactsView extends StatelessWidget {
  const EniContactsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPattern(
      backgroundColor: KAppENIColors.blackColor,
      child: Center(
        child: Text('Eni Contacts View'),
      ),
    );
  }
}