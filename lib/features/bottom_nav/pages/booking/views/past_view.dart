import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/data/model/service_card.dart';
import 'package:travel_app/res/assets.dart';
import 'package:travel_app/widgets/customs/custom_service_card.dart';

class PastView extends StatelessWidget {
  const PastView({super.key});
final List<ServiceCardModel> pastServices = const [
    ServiceCardModel(
      imagePath: KAppPngs.boulevardWorld,
      title: "Boulevard World",
      place: "Boulevard World,Riyadh City",
      price: 312.5,
      rating: 4.8,
      isSaved: true,
    ),ServiceCardModel(
      imagePath: KAppPngs.kingdomArenaAlHilalSaudiFC,
      title: "Kingdom Arena Al-Hilal Saudi FC",
      place: "Kingdom Arena Al-Hilal Saudi FC,Riyadh City",
      price: 218,
      rating: 4.8,
      isSaved: true,
    ),

  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, left: 16.w, right: 16.w),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: pastServices.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomServiceCard(
            title: pastServices[index].title,
            place: pastServices[index].place,
            imagePath: pastServices[index].imagePath,
            price: pastServices[index].price,
            rating: pastServices[index].rating,
            isSaved: pastServices[index].isSaved,
          );
        },
      ),
    );
  }
}