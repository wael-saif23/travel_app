import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/extension/context_extensions.dart';
import '../../core/utils/app_text_styles.dart';
import '../../res/assets.dart';
import '../../res/colors.dart';
import '../../res/keys.dart';

class ZeroHeightAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ZeroHeightAppBar({
    super.key,
    this.color = Colors.white,
    this.statusBarIsLight = true,
  });

  final Color color;
  final bool statusBarIsLight;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color, // IOS status bar color
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: statusBarIsLight ? Brightness.dark : Brightness.light,
        // Android status bar icons color
        statusBarBrightness: statusBarIsLight ? Brightness.light : Brightness.dark,
        // IOS status bar icons color
        statusBarColor: color, // Android status bar color
      ),
      toolbarHeight: 0,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 0);
}

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({
    super.key,
    this.title,
    this.bottomWidget,
    this.backWidget,
    this.hasSearch = true,
    this.hasNotification = true,
    this.hasCart = true,
    this.hasBottomShadow = true,
    this.backWidth = 28,
  });

  final Widget? bottomWidget;
  final Widget? backWidget;
  final String? title;
  final bool hasSearch;
  final bool hasNotification;
  final bool hasCart;
  final bool hasBottomShadow;
  final double? backWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 20.w,
            ),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 50.h,
                    child: title != null
                        ? Center(
                            child: Text(
                              title ?? '',
                              style: KAppTextStyle.boldTextStyle.copyWith(
                                fontSize: 18.sp,
                                color: KAppColors.blackColor,
                              ),
                            ),
                          )
                        : Image.asset(KAppPngs.appbarLogo),
                  ),
                ),
                Row(
                  children: [
                    (backWidget != null)
                        ? SizedBox(
                            width: (backWidth != null) ? backWidth!.w : null,
                            child: backWidget,
                          )
                        : GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              context.pop();
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.h),
                              child: SizedBox(
                                width: 26.r,
                                child: SvgPicture.asset(
                                  (KAppKeys.langKey == 'ar') ? KAppSvgs.backArIcon : KAppSvgs.backEnIcon,
                                ),
                              ),
                            ),
                          ),
                    const Spacer(),
                    if (hasNotification)
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        // onTap:() => context.navNamedTo(KAppRoutes.notification),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          child: SizedBox(
                            width: 22.w,
                            child: SvgPicture.asset(KAppSvgs.notificationIcon),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          if (bottomWidget != null) bottomWidget!,
        ],
      ),
    );
  }
}
