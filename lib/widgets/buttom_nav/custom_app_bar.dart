import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/core/extension/context_extensions.dart';
import 'package:travel_app/core/extension/sizedbox_extention.dart';
import 'package:travel_app/core/utils/app_text_styles.dart';
import 'package:travel_app/res/assets.dart';
import 'package:travel_app/res/colors.dart';
import 'package:travel_app/routes/k_routes.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.isLogined = false,
    this.userName = 'Wael Saif',
    this.userLocation = 'Dakhlia, Elmansoura',
    this.userImage = KAppPngs.userExImage,
    this.isProfile = false,
    this.userEmail = 'waelSaif@gamil.com',
    this.userPhone = '00201234566789',
    this.onEditTap,
  });
  final bool isLogined;
  final String userName;
  final String userLocation;
  final String userImage;
  final String userEmail;
  final String userPhone;
  final bool isProfile;
  final VoidCallback? onEditTap;

// يستخدم في ثلاثة حالات وهيه صفحة الـ home
// وصفحة البروفيل اذا لم يكن تم التسجيل
// وصفحة البروفايل اذا تم التسجيل
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: 10.h, bottom: 25.h, left: 25.w, right: 25.w),
      decoration: BoxDecoration(
        color: KAppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.r),
          bottomRight: Radius.circular(25.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isProfile
              ? Text(
                  'My Profile',
                  style: KAppTextStyle.interSemiBold20.copyWith(
                    color: KAppColors.white,
                  ),
                )
              : SizedBox(),
          17.sH,
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                  width: isProfile ? 83.w : 60.w,
                  height: isProfile ? 83.h : 60.h,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: KAppColors.kBorderLighterGray,
                  ),
                  child: Image.asset(
                      isLogined ? userImage : KAppPngs.splashLogo,
                      fit: BoxFit.cover)),
              20.sW,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isLogined ? userName : 'Welcome to Rehlati',
                    style: KAppTextStyle.interSemiBold20.copyWith(
                      color: KAppColors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                  ),
                  8.sH,
                  isLogined && isProfile
                      ? Text(
                          userEmail,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: KAppTextStyle.interRegular12
                              .copyWith(color: KAppColors.white, fontSize: 14),
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: KAppColors.white,
                              size: 11.sp,
                            ),
                            3.sW,
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = isLogined
                                      ? () {}
                                      : () => context.navNamedTo(
                                            KAppRoutes.login,
                                          ),
                                text: isLogined ? 'Location:' : 'Sign In',
                                style: KAppTextStyle.interRegular12
                                    .copyWith(fontSize: 14)
                                    .copyWith(color: Colors.blue[900]),
                              ),
                              TextSpan(
                                text: ' ',
                              ),
                              TextSpan(
                                text: isLogined ? userLocation : '😃',
                                style: KAppTextStyle.interRegular12.copyWith(
                                    color: KAppColors.white, fontSize: 14),
                              ),
                            ])),
                          ],
                        ),
                  isProfile ? 8.sH : 0.sH,
                  isLogined && isProfile
                      ? Text(userPhone,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: KAppTextStyle.interRegular12
                              .copyWith(color: KAppColors.white, fontSize: 14))
                      : SizedBox(),
                ],
              ),
              Spacer(),
              isLogined && isProfile
                  ? InkWell(
                      onTap: onEditTap,
                      child: SvgPicture.asset(KAppSvgs.editIcon),
                    )
                  : SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}
