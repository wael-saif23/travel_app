import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/data/model/service_card.dart';
import 'package:travel_app/res/assets.dart';
import 'package:travel_app/widgets/customs/custom_service_card.dart';

class CanceledView extends StatelessWidget {
  const CanceledView({super.key});
  final List<ServiceCardModel> canceledServices = const [
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
        itemCount: canceledServices.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomServiceCard(
            title: canceledServices[index].title,
            place: canceledServices[index].place,
            imagePath: canceledServices[index].imagePath,
            price: canceledServices[index].price,
            rating: canceledServices[index].rating,
            isSaved: canceledServices[index].isSaved,
          );
        },
      ),
    );
  }
}
