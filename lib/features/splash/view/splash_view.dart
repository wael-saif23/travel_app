import 'package:flutter/material.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     
    );

    // BlocProvider(
    //   create: (context) => SplashCubit()..gitInitialRoute(context),
    //   child: BlocConsumer<SplashCubit, SplashState>(
    //     listener: (context, state) {},
    //     builder: (context, state) {
    //       return ScaffoldPattern(
    //         backPatternPath: KAppSvgs.splashBG,
    //         child: Stack(
    //           children: [
    //             Align(
    //               alignment: AlignmentDirectional.center,
    //               child: GestureDetector(
    //                 onTap: () {
    //                   // context.navNamedTo(KAppRoutes.login);
    //                   // context.navNamedTo(KAppRoutes.settings);
    //                   // context.navNamedTo(KAppRoutes.homePage);
    //                   // context.navNamedTo(KAppRoutes.bottomNav);
    //                   // context.navNamedTo(KAppRoutes.productsPage);
    //                 },
    //                 child: Image.asset(
    //                   KAppPngs.splashLogo,
    //                   height: 140.h,
    //                 ),
    //               ),
    //             ),
    //             const Align(
    //               alignment: AlignmentDirectional.bottomCenter,
    //               child: CopyRightWidget(appName: 'تطبيق ميك'),
    //             ),
    //           ],
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
