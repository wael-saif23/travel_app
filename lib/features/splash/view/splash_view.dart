import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 

import 'package:travel_app/features/splash/cubit/splash_cubit.dart';
import 'package:travel_app/res/assets.dart';
import 'package:travel_app/routes/k_routes.dart';

import 'package:travel_app/widgets/customs/copy_right.dart';
import 'package:travel_app/widgets/customs/scaffold_pattern.dart';
import 'package:travel_app/widgets/splash/logo_name.dart';

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
                  child: SplashView2Logo(),
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

class SplashView2Logo extends StatelessWidget {
  const SplashView2Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double hight = 0;
    double animationValue = 1;
    return BlocBuilder<SplashCubit, SplashState>(
      builder: (context, state) {
        if (state is SplashInitial) {
          hight = MediaQuery.sizeOf(context).height * .12;
          animationValue = 0;
          Future.delayed(const Duration(milliseconds: 500), ()async {
            BlocProvider.of<SplashCubit>(context).setSplashAnimation(context: context);
          });
         
        }
        return SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                logoPiece(imagePath: KAppPngs.logoPiece1 , animationVatue: animationValue),
                animationHightBetwenLogoPieces(hight),
                logoPiece(imagePath: KAppPngs.logoPiece2 , animationVatue: animationValue),
                animationHightBetwenLogoPieces(hight),
                logoPiece(imagePath: KAppPngs.logoPiece3 , animationVatue: animationValue),
                animationHightBetwenLogoPieces(hight),
                logoPiece(imagePath: KAppPngs.logoPiece4 , animationVatue: animationValue),
                animationHightBetwenLogoPieces(hight),
                logoPiece(imagePath: KAppPngs.logoPiece5 , animationVatue: animationValue),
                animationHightBetwenLogoPieces(hight),
                logoPiece(imagePath: KAppPngs.logoPiece6 , animationVatue: animationValue),
                LogoName(animationVatue: animationValue),
              ],
            ),
          ),
        );
      },
    );
  }

  AnimatedContainer animationHightBetwenLogoPieces(double hight) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 2000),
      curve: Curves.easeInCirc,
      height: hight,
    );
  }

  AnimatedOpacity logoPiece({required String imagePath, required double animationVatue}) {
    return AnimatedOpacity(
      opacity: animationVatue,
      curve: Curves.easeInQuart,
      duration: Duration(milliseconds: 2000),
      child: Image.asset(
        imagePath,
        height: 40,
        width: 180,
        fit: BoxFit.cover,
      ),
    );
  }
}

