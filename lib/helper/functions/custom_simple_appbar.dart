  import 'package:flutter/material.dart';
import 'package:travel_app/core/extension/context_extensions.dart';
import 'package:travel_app/core/utils/app_text_styles.dart';
import 'package:travel_app/res/colors.dart';

AppBar customSimpleAppbar({required BuildContext context, required String title , VoidCallback? onleadingButtonTap}) {
    return AppBar(
        backgroundColor: KAppColors.primaryColor,
        leading: IconButton(
          onPressed: onleadingButtonTap?? ()=>context.pop,
          icon: Icon(Icons.arrow_back_sharp, color: KAppColors.white),
        ),
        centerTitle: true,
        title: Text(
          context.translate(title),
          style: KAppTextStyle.interSemiBold20.copyWith(
            color: KAppColors.white,
          ),
        ),
      );
  }
