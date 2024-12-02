import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/features/splash/cubit/splash_cubit.dart';
import 'package:travel_app/res/assets.dart';
import 'package:travel_app/widgets/customs/copy_right.dart';
import 'package:travel_app/widgets/customs/scaffold_pattern.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..gitInitialRoute(context),
      child: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ScaffoldPattern(
            backPatternPath: KAppPngs.splashBG,
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional.center,
                  child: GestureDetector(
                      onTap: () {
                        // context.navNamedTo(KAppRoutes.login);
                        // context.navNamedTo(KAppRoutes.settings);
                        // context.navNamedTo(KAppRoutes.homePage);
                        // context.navNamedTo(KAppRoutes.bottomNav);
                        // context.navNamedTo(KAppRoutes.productsPage);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            KAppPngs.splashLogo,
                            height: 241.92.h,
                            width: 180.w,
                            fit: BoxFit.cover,
                          ),
                          SvgPicture.asset(
                            KAppSvgs.splashTitle,
                            height: 83.h,
                            width: 141.w,
                          ),
                        ],
                      )),
                ),
                const Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: CopyRightWidget(appName: 'Rehlati'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
