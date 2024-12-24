// import 'package:conditional_builder_null_safety/example/example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:travel_app/bloc_obs.dart';
import 'package:travel_app/res/keys.dart';
import 'package:travel_app/routes/k_routes.dart';

import '../app.dart';

import 'res/app_size.dart';


// Changes that have been completed:
// - add families fonts in pubspec.yaml file
// - add fonts in assets font files
// - add all text styles in app text style file
// - start login view UI
// - create auth head text widget for UI in login and signup views
// - add inter bold text style
// - add svg icon to assets file
// - add some app color to app color file
// - * create have or not account widget
// - * create or social sign widget
// - * make some edit in custom button
// - * create custom text form field widget
// - * create social login button widget

// ** finish signup view UI ** 
// - add key to en.json - localization-
// - *create home view file 
// - add navigation to home view and register view 
// - edit in auth head text to make widget more reusable
// - use context and sizedbox extensions in views UI 
// - * create register view body widget
//** forget password case views ** 
// - add forget password views icons
// - add lang texts to en.json 
// - * create forget password view and view body widgets 
// - * create otp verification view and view body widgets 
// - change app langkey to 'en' 
// - * add needed routes 


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Hive.initFlutter();
  await Hive.openBox(KAppKeys.APP_HIVE_BOX);
  bool hasConnection = await InternetConnectionChecker().hasConnection;
  String routeName = (hasConnection) ? KAppRoutes.splash : KAppRoutes.noInternetPage;
  runApp(
    ScreenUtilInit(
      designSize: Size(AppSize.figmaScreenW, AppSize.figmaScreenH),
      minTextAdapt: false,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (BuildContext context, Widget? child) {
        return  App(
            routeName: routeName,
            );
      },
    ),
  );
}
