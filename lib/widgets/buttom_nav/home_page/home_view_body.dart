import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/extension/context_extensions.dart';
import 'package:travel_app/core/extension/sizedbox_extention.dart';
import 'package:travel_app/data/model/category_model.dart';
import 'package:travel_app/features/bottom_nav/pages/home/custom_search_bar_widget.dart';
import 'package:travel_app/res/assets.dart';
import 'package:travel_app/widgets/buttom_nav/custom_app_bar.dart';
import 'package:travel_app/widgets/customs/custom_category_list_body_widget.dart';
import 'package:travel_app/widgets/customs/custom_head_category_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  final List<CategoryModel> touristPlaces = const [
    CategoryModel(imageUrlOrPath: KAppPngs.riyadCity, title: 'Riyadh'),
    CategoryModel(imageUrlOrPath: KAppPngs.geddahCity, title: 'Jeddah'),
    CategoryModel(imageUrlOrPath: KAppPngs.dmamCity, title: 'Dammam'),
    CategoryModel(imageUrlOrPath: KAppPngs.makaCity, title: 'Makah'),
    CategoryModel(imageUrlOrPath: KAppPngs.el3laCity, title: 'Elala'),
    CategoryModel(imageUrlOrPath: KAppPngs.haialCity, title: 'Haiel'),
    CategoryModel(imageUrlOrPath: KAppPngs.madinaCity, title: 'Elmadina'),
  ];
  final List<CategoryModel> services = const [
    CategoryModel(imageUrlOrPath: KAppPngs.rentCar, title: 'Rent Car'),
    CategoryModel(imageUrlOrPath: KAppPngs.bookHotel, title: 'Book Hotel'),
    CategoryModel(imageUrlOrPath: KAppPngs.resturants, title: 'Resturants'),
    CategoryModel(imageUrlOrPath: KAppPngs.shopping, title: 'Shopping'),
  ];

  final List<CategoryModel> offers = const [
    CategoryModel(
        imageUrlOrPath: KAppPngs.offer1,
        title: 'Riyadh & Jeddah Package',
        subTitle: 'Amazing 5 Days Riyadh & Jeddah Package',
        price: 3.143),
    CategoryModel(
        imageUrlOrPath: KAppPngs.offer2,
        title: 'Riyadh & Jeddah Package',
        subTitle: 'Amazing 5 Days Riyadh & Jeddah Package',
        price: 3.143),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(),
        10.sH,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: CustomSearchBarWidget(),
        ),
        10.sH,
        Expanded(
            child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: CustomHeadCategoryWidget(
                      headName: 'Tourist Places',
                      categoryList: touristPlaces,
                    ),
                  ),
                  13.sH,
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                    ),
                    child: SizedBox(
                      height: 116.h,
                      child: CustomCategoryListBodyWidget(
                        isImageCircle: true,
                        categoryList: touristPlaces,
                        borderRadius: 100,
                      ),
                    ),
                  ),
                  20.sH,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: CustomHeadCategoryWidget(
                      categoryList: services,
                      headName: context.translate("Services_We_Provide "),
                      subtitle: context
                          .translate("services_that_we_can_provide_to_you"),
                    ),
                  ),
                  8.sH,
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                    ),
                    child: SizedBox(
                      height: 116.h,
                      child: CustomCategoryListBodyWidget(
                        isImageCircle: false,
                        categoryList: services,
                        borderRadius: 12,
                        imageFit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  16.sH,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: CustomHeadCategoryWidget(
                      headName: 'Offers',
                      categoryList: offers,
                    ),
                  ),
                  6.sH,
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                    ),
                    child: SizedBox(
                      height: 230.h,
                      child: CustomCategoryListBodyWidget(
                        categoryList: offers,
                        isImageCircle: false,
                        aspectRatioContainer: 1.6176,
                        containerHeight: 170,
                        containerWidth: 275,
                        borderRadius: 10,
                        isHavePriceOnImage: true,
                        isHaveMark: true,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ))
      ],
    );
  }
}
