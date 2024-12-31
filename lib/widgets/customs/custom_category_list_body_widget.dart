import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/core/extension/sizedbox_extention.dart';
import 'package:travel_app/core/utils/app_text_styles.dart';
import 'package:travel_app/data/model/category_model.dart';
import 'package:travel_app/res/assets.dart';
import 'package:travel_app/res/colors.dart';

class CustomCategoryListBodyWidget extends StatelessWidget {
  const CustomCategoryListBodyWidget({
    super.key,
    required this.categoryList,
    this.padding,
    this.containerHeight,
    this.containerWidth,
    this.imagWidth,
    this.imagHeight,
    this.imagePath,
    this.borderWidth,
    this.borderColor,
    this.title,
    this.titleTextStyle,
    this.titleFontSize,
    this.titleColor,
    this.subTitle,
    this.subTitleTextStyle,
    this.subTitleFontSize,
    this.subTitleColor,
    this.onTap,
    required this.isImageCircle,
    this.imageFit,
    this.borderRadius,
    this.aspectRatioContainer,
    this.isHavePriceOnImage = false,
    this.isHaveMark = false,
    this.ismarked = false,
    this.onTapMark,
    this.mainAxisTextAlignment = MainAxisAlignment.center,
  });

  final List<CategoryModel> categoryList;
  final EdgeInsetsGeometry? padding;
  final double? containerHeight;
  final double? containerWidth;
  final double? imagWidth;
  final double? imagHeight;
  final String? imagePath;
  final BoxFit? imageFit;
  final double? borderWidth;
  final Color? borderColor;
  final double? borderRadius;
  final String? title;
  final TextStyle? titleTextStyle;
  final double? titleFontSize;
  final Color? titleColor;
  final String? subTitle;
  final TextStyle? subTitleTextStyle;
  final double? subTitleFontSize;
  final Color? subTitleColor;
  final VoidCallback? onTap;
  final double? aspectRatioContainer;
  final bool isImageCircle;
  final bool isHavePriceOnImage;
  final bool isHaveMark;
  final bool ismarked;
  final VoidCallback? onTapMark;
  final MainAxisAlignment mainAxisTextAlignment;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: categoryList.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 7.5),
          child: Transform.translate(
            offset: Offset(-7.5, 0),
            child: Column(
              children: [
                SizedBox(
                  width: containerWidth?.w ?? 85.w,
                  height: containerHeight?.h ?? 85.h,
                  child: Stack(children: [
                    AspectRatio(
                      aspectRatio: aspectRatioContainer ?? 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: KAppColors.white,
                          borderRadius: BorderRadius.all(
                              Radius.circular(borderRadius?.r ?? 0.r)),
                          border: Border.all(
                              color: borderColor ?? KAppColors.primaryColor,
                              width: borderWidth ?? 2.r),
                        ),
                        child: isImageCircle
                            ? ClipOval(
                                child: categoryItemImage(index),
                              )
                            : categoryItemImage(index),
                      ),
                    ),
                    isHavePriceOnImage
                        ? Positioned(
                            top: 0,
                            left: 0,
                            child: SizedBox(
                              width: 90.w,
                              height: 25.h,
                              child: AspectRatio(
                                aspectRatio: 90 / 25,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: KAppColors.primaryColor,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(
                                          borderRadius?.r ?? 0.r),
                                      topLeft: Radius.circular(
                                          borderRadius?.r ?? 0.r),
                                      topRight: Radius.circular(
                                          borderRadius?.r ?? 0.r),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                              text: 'SAR',
                                              style: KAppTextStyle
                                                  .poppinsRegular12
                                                  .copyWith(
                                                color: KAppColors.white,
                                                fontSize: 14.sp,
                                              )),
                                          TextSpan(text: '  '),
                                          TextSpan(
                                            text: categoryList[index].price !=
                                                    null
                                                ? "${categoryList[index].price}"
                                                : '00.00',
                                            style: KAppTextStyle
                                                .poppinsSemiBold14
                                                .copyWith(
                                              color: KAppColors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ))
                        : SizedBox(),
                    isHaveMark
                        ? Positioned(
                            top: 4.h,
                            right: 16.w,
                            child: InkWell(
                              onTap: onTapMark,
                              child: SvgPicture.asset(
                                ismarked
                                    ? KAppSvgs.markSelected
                                    : KAppSvgs.markUnselected,
                                height: 20.h,
                              ),
                            ))
                        : SizedBox(),
                  ]),
                ),
                3.sH,
                Column(
                  crossAxisAlignment: categoryList[index].subTitle != null
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center,
                  children: [
                    Text(
                      title ?? categoryList[index].title ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: KAppTextStyle.poppinsMedium16.copyWith(
                        color: titleColor ?? KAppColors.blacPrimaryColor,
                      ),
                    ),
                    categoryList[index].subTitle != null
                        ? Text(
                            subTitle ?? categoryList[index].subTitle ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: KAppTextStyle.poppinsRegular12.copyWith(
                              color: titleColor ?? KAppColors.kGray,
                            ),
                          )
                        : SizedBox(),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Image categoryItemImage(int index) {
    return Image.asset(
      imagePath ??
          categoryList[index].imageUrlOrPath ??
          KAppPngs.noImageFounded,
      fit: imageFit ?? BoxFit.cover,
      width: imagWidth ?? 85.w,
      height: imagHeight ?? 85.h,
    );
  }
}
