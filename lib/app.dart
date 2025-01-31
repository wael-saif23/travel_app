import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/base_cubit/lang/lang_cubit.dart';
import 'package:travel_app/routes/k_routes_enigma.dart';

import 'routes/k_routes.dart';
import 'core/localization/app_localizations_setup.dart';
import 'res/keys.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    this.routeName
  });

  final String? routeName;

  @override
  Widget build(BuildContext context) {
    _applySystemChrome();
    return 
         MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (BuildContext context) => LangCubit(),
            ),
          ],
          child: BlocConsumer<LangCubit, LangState>(
            listener: (context, state) {},
            buildWhen: (previousState, currentState) => previousState != currentState,
            builder: (_, localeState) =>
        MaterialApp(
      title: 'Rehlati app',
      navigatorKey: KAppKeys.navigatorKey,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizationSetup.localizationsDelegate,
      supportedLocales: AppLocalizationSetup.supportedLocales,
      locale: const Locale('en'),     
      
      onGenerateRoute: KAppRoutesEni.generateRoute,
      initialRoute:
          routeName ??
          KAppRoutes.splash,
      ),
      ),
    ); 
  }

  _applySystemChrome() async {
    SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }
}
