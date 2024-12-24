import 'package:flutter/material.dart';
import 'package:travel_app/features/home/views/home_view.dart';
import 'package:travel_app/features/login/view/forget_password_view.dart';
import 'package:travel_app/features/login/view/login_view.dart';
import 'package:travel_app/features/login/view/otp_verification_view.dart';
import 'package:travel_app/features/register/view/register_view.dart';

import '../core/utils/no_internet/no_internet_page.dart';
import '../features/splash/view/splash_view.dart';

class KAppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgetPassword = '/forgetPassword';
  static const String otpVerificationView = '/OtpVerificationView';
  static const String home = '/home';

  static const String noInternetPage = '/noInternetPage';

  static Route<dynamic>? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        return createRoute(const SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordView());
      case otpVerificationView:
        return MaterialPageRoute(builder: (_) => const OtpVerificationView());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeView());
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
