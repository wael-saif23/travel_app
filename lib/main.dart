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

// void main(List<String> args) {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return
//     MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(
//           appBar: AppBar(
//             title: const Text('Travel App'),
//           ),
//         ));
//   }
// }
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
