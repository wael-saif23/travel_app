import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/res/assets.dart';

class LogoName extends StatelessWidget {
  const LogoName({
    super.key,
    required this.animationVatue,
  });

  final double animationVatue;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: animationVatue,
      curve: Curves.easeInQuart,
      duration: Duration(milliseconds: 2000),
      child: AnimatedScale(
        duration: Duration(milliseconds: 2000), 
        scale: animationVatue,
        curve: Curves.easeInQuart,
        child: SvgPicture.asset(
          KAppSvgs.splashTitle,
          height: 83.h,
          width: 141.w,
        ),
      ),
    );
  }
}
