import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/core/extension/sizedbox_extention.dart';
import 'package:travel_app/core/utils/app_text_styles.dart';
import 'package:travel_app/data/model/place_model.dart';
import 'package:travel_app/res/assets.dart';
import 'package:travel_app/res/colors.dart';

class PlaceWidget extends StatelessWidget {
  final Place place;

  const PlaceWidget({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(alignment: Alignment.center, children: [
              SvgPicture.asset(KAppSvgs.placeNumperIcon),
              Positioned(
                top: 1,
                child: Text(
                  (place.placeId).toString(),
                  style: KAppTextStyle.sourceSansProBold16
                      .copyWith(color: KAppColors.white),
                ),
              ),
            ]),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.name.toString(),
                    style: KAppTextStyle.sourceSansProBold16
                        .copyWith(color: KAppColors.blacPrimaryColor),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 16,
                        color: KAppColors.kLighterGrayInAUTH,
                      ),
                      Text(
                        place.location.toString(),
                        style: KAppTextStyle.sourceSansProRegular12
                            .copyWith(color: KAppColors.kLighterGrayInAUTH),
                      ),
                    ],
                  ),
                  8.sH,
                  Row(
                    children: [
                      timeAndPriceContainer(
                        text: place.time.toString(),
                      ),
                      6.sW,
                      timeAndPriceContainer(
                        text: place.price.toString(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.delete_forever_outlined,
                color: KAppColors.kLighterGrayInAUTH,
              ),
              onPressed: () {
                // حذف المكان
              },
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  Container timeAndPriceContainer({required String text}) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: KAppColors.lighterPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: Text(
        text,
        style: KAppTextStyle.sourceSansProBold12
            .copyWith(color: KAppColors.primaryColor),
      ),
    );
  }
}

