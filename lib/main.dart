// import 'package:conditional_builder_null_safety/example/example.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:travel_app/bloc_obs.dart';
import 'package:travel_app/res/colors.dart';
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
// ** create navigation bar view **
// - add needed icons
// - add needed routes for the pages
// - * create bottom nav bar cubit
// - * create item nav bar model
// - * create pages for page view and cubit for each page
// - * create main nav bar widget to control pages using bottom navigation bar
// - * edit in bottom nav item widget to make it fit for this app
// - * create custom bottom navigation bar fit for the app
// ** create custom app bar for home and profile pages **
// - try to change status bar color in main file
// - * create custom app bar
// ** finish home feature UI **
// - add needed assets and text
// - * create category model
// - * create custom search bar widget
// - * build home view body UI
// - * create custom category list body widget
// - * create custom head category widget
// ** add popup menu button in home view category **
// - * create view all popup menu button widget
// - handling other widget to connect with popup menu widget
// ** finish add plans UI view ** 
// - * create plans model 
// - * build add plans view UI 
// - * create custom simple app bar to use in all app 
// - * build add plans view body widget
// - * create floating new plan button widget
// - * create custom trip plan widget 
// - * add floating action button property in scaffold pattern widget
// ** create tap bar to control booking views **
// - * create cubit and cubit stats to control taps and booking views 
// - * create file for each view in booking views folder 
// - * create app bar and tap bar for booking view and control the booking
// views in booking views app bar method 
// - * create custom tap item widget file 
// -  add bottom property to custom simple app bar for
// adding bottom tap bar if needed .
// ** finish booking view UI ** 
// - add needed assets 
// - * create service card model 
// - * create custom service card 
// - * build canceled, past and active views UI using
// custom service card

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: KAppColors.primaryColor, // navigation bar color
    statusBarColor: KAppColors.primaryColor, // status bar color
  ));
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Hive.initFlutter();
  await Hive.openBox(KAppKeys.APP_HIVE_BOX);
  bool hasConnection = await InternetConnectionChecker().hasConnection;
  String routeName =
      (hasConnection) ? KAppRoutes.splash : KAppRoutes.noInternetPage;
  runApp(
    ScreenUtilInit(
      designSize: Size(AppSize.figmaScreenW, AppSize.figmaScreenH),
      minTextAdapt: false,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (BuildContext context, Widget? child) {
        return App(
          routeName: routeName,
        );
      },
    ),
  );
}
