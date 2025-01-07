import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/data/model/service_card.dart';
import 'package:travel_app/res/assets.dart';
import 'package:travel_app/widgets/customs/custom_service_card.dart';

class ActiveView extends StatelessWidget {
  const ActiveView({super.key});
final List<ServiceCardModel> activeServices = const [
    ServiceCardModel(
      imagePath: KAppPngs.boulevardCity,
      title: "Boulevard City",
      place: "Boulevard City,Riyadh City",
      price: 165.3,
      rating: 4.8,
      isSaved: true,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, left: 16.w, right: 16.w),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: activeServices.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomServiceCard(
            title: activeServices[index].title,
            place: activeServices[index].place,
            imagePath: activeServices[index].imagePath,
            price: activeServices[index].price,
            rating: activeServices[index].rating,
            isSaved: activeServices[index].isSaved,
          );
        },
      ),
    );
  }
}