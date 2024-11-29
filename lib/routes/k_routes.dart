import 'package:flutter/material.dart';

import '../core/utils/no_internet/no_internet_page.dart';
import '../features/splash/view/splash_view.dart';

class KAppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String noInternetPage = '/noInternetPage';

  static Route<dynamic>? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        return createRoute(const SplashScreen());
      case noInternetPage:
        return MaterialPageRoute(builder: (_) => const NoInternetPage());
    }
    return null;
  }

  static Route createRoute(Widget page, {RouteSettings? settings}) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => page,
    );
  }
}
