import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/helper/functions/custom_simple_appbar.dart';
import 'package:travel_app/res/colors.dart';
import 'package:travel_app/widgets/buttom_nav/add_plans/my_plans_view_body.dart';
import 'package:travel_app/widgets/buttom_nav/add_plans/floating_new_plan_button.dart';
import 'package:travel_app/widgets/customs/scaffold_pattern.dart';

class MyPlansView extends StatelessWidget {
  const MyPlansView({
    super.key, 
  });
 
  @override
  Widget build(BuildContext context) {
    return ScaffoldPattern(
      appBarBackgroundColor: KAppColors.primaryColor,
      statusBarIsLight: false,
      backgroundColor: KAppColors.secondScafoldColor,
      appBar: customSimpleAppbar(context: context, title: 'My_Plans'),
      floatingActionButton: FloatingNewPlanButton(
        onButtonTap: () {},
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: MyPlansViewBody(),
      ),
    );
  }
}
