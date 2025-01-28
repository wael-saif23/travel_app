import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/extension/context_extensions.dart';
import 'package:travel_app/core/utils/app_text_styles.dart';
import 'package:travel_app/features/bottom_nav/pages/add_plans/add_plans_cubit/add_plans_cubit.dart';
import 'package:travel_app/res/assets.dart';
import 'package:travel_app/res/colors.dart';
import 'package:travel_app/widgets/customs/scaffold_pattern.dart';

class TripDetailsView extends StatelessWidget {
  const TripDetailsView({super.key});

  @override
  Widget build(BuildContext context) {

    //  final cubit = BlocProvider.of<AddPlansCubit>(context);
    final scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.offset > 100) { // تغيير القيمة حسب الحاجة
        // cubit.updateScrollState(false, false);
      } else {
        // cubit.updateScrollState(true, true);
      }
    });

    bool isCenterTitle = true;
    bool isExpanded = true;
    return ScaffoldPattern(
        child: CustomScrollView(
      slivers: [
        SliverAppBar(
          onStretchTrigger: () async {
            isCenterTitle = false;
            isExpanded = true;
          },
          stretch: true,
          floating: true,
          pinned: true,
          forceElevated: true,
          expandedHeight: 308,
          // collapsedHeight: 150,
          title: !isExpanded
              ? Text('Trip Details', style: KAppTextStyle.poppinsBold18)
              : null,

          leading: Transform.translate(
            offset: Offset(10, 0),
            child: Container(
              margin: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: KAppColors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Icon(Icons.arrow_back),
            ),
          ),
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: isCenterTitle,
            titlePadding: EdgeInsets.only(bottom: 14, left: 8),
            title: Text.rich(TextSpan(children: [
              TextSpan(
                text: context.translate(
                  "Trip to ",
                ),
                style: KAppTextStyle.sourceSansProRegular16.copyWith(
                  fontSize: 26.sp,
                  color: KAppColors.white,
                ),
              ),
              TextSpan(
                text: 'Riyadh City',
                style: KAppTextStyle.sourceSansProBold34.copyWith(
                  fontSize: 26.sp,
                  color: KAppColors.white,
                ),
              ),
            ])),
            background: Image.asset(
              KAppPngs.tripDetailsRiyadh,
              fit: BoxFit.fill,
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              color: Colors.red,
            ),
          ),
          childCount: 10,
        ))
      ],
    ));
  }
}
