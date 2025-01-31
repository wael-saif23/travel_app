import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/extension/context_extensions.dart';
import 'package:travel_app/core/extension/sizedbox_extention.dart';
import 'package:travel_app/core/utils/eni_app_text_styles.dart';
import 'package:travel_app/res/eni_assets.dart';

class StartSearchingStateWidget extends StatelessWidget {
  const StartSearchingStateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            KAppPngsEni.bigSearchIcon,
            height: 228.h,
          ),
          21.sH,
          Text(
            context.translate("Start Searching"),
            style: KAppTextStyleEni.segoeUIsemibold25,
          ),
          12.sH,
          Text(
            context.translate("You didn`t made any conversation"),
            style: KAppTextStyleEni.segoeUIRegular14grayOpacity,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}