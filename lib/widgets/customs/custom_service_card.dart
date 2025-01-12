import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/core/extension/sizedbox_extention.dart';
import 'package:travel_app/core/utils/app_text_styles.dart';
import 'package:travel_app/res/assets.dart';
import 'package:travel_app/res/colors.dart';

class CustomServiceCard extends StatelessWidget {
  const CustomServiceCard(
      {super.key,
      required this.title,
      required this.place,
      required this.imagePath,
      required this.price,
      this.rating,
      required this.isSaved});
  final String title;
  final String place;
  final String imagePath;
  final double price;
  final double? rating;
  final bool isSaved;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                AspectRatio(
                    aspectRatio: 360 / 141,
                    child: Container(
                      foregroundDecoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              KAppColors.primaryColor,
                              KAppColors.primaryColor.withOpacity(0.0),
                            ],
                            stops: const [
                              0.005,
                              0.2,
                            ]),
                      ),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    )),
                Positioned(
                    top: 10.h,
                    left: 10.w,
                    child: Container(
                      width: 50.w,
                      height: 22.66.h,
                      decoration: BoxDecoration(
                          color: KAppColors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.r))),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              rating.toString(),
                              style: TextStyle(
                                  color: KAppColors.blackColor,
                                  fontSize: 12.sp),
                            ),
                            3.sW,
                            SvgPicture.asset(
                              KAppSvgs.starIcon,
                            ),
                          ]),
                    )),
                Positioned(
                    top: 8.h,
                    right: 10.w,
                    child: InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        isSaved
                            ? KAppSvgs.markSelected
                            : KAppSvgs.markUnselected,
                        height: 20.h,
                      ),
                    )),
              ],
            ),
            Container(
              color: KAppColors.white,
              child: Padding(
                padding: EdgeInsets.all(12.dg),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: KAppTextStyle.plusJakartaSansBold14
                              .copyWith(color: KAppColors.blacPrimaryColor),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "\$$price",
                                style: KAppTextStyle.plusJakartaSansBold14
                                    .copyWith(color: KAppColors.primaryColor),
                              ),
                              TextSpan(
                                text: "/ticket",
                                style: KAppTextStyle.plusJakartaSansMedium12
                                    .copyWith(color: KAppColors.kGray),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    3.sH,
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: KAppColors.kGray,
                          size: 10.dg,
                        ),
                        3.sW,
                        Text(
                          place,
                          style: KAppTextStyle.plusJakartaSansMedium12
                              .copyWith(color: KAppColors.kGray),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
