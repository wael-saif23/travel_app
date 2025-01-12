import 'package:flutter/material.dart';
import 'package:travel_app/data/model/plans_model.dart';
import 'package:travel_app/widgets/customs/custom_trip_plan_widget.dart';

class AddPlansViewBody extends StatelessWidget {
  const AddPlansViewBody({super.key});
  final List<PlansModel> plansList = const [
    PlansModel(tripName: 'Luxor', startingDate: "01/05", endingDate: "05/05"),
    PlansModel(tripName: 'Luxor', startingDate: "01/05", endingDate: "05/05"),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: plansList.length,
      itemBuilder: (BuildContext context, int index) {
        return CustomTripPlanWidget(
          onTap: () {},
          tripName: plansList[index].tripName,
          startingDate: plansList[index].startingDate,
          endingDate: plansList[index].endingDate,
        );
      },
    );
  }
}
