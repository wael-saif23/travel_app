import 'package:flutter/material.dart';

import 'package:travel_app/features/auth/forget_password/views/forget_password_view.dart';
import 'package:travel_app/features/auth/login/view/login_view.dart';
import 'package:travel_app/features/auth/otp_verification/views/otp_verification_view.dart';
import 'package:travel_app/features/auth/register/view/register_view.dart';
import 'package:travel_app/features/bottom_nav/pages/add_plans/views/add_plans_view.dart';
import 'package:travel_app/features/bottom_nav/pages/booking/views/booking_view.dart';
import 'package:travel_app/features/bottom_nav/pages/home/views/home_view.dart';
import 'package:travel_app/features/bottom_nav/pages/profile/views/profile_view.dart';
import 'package:travel_app/features/bottom_nav/views/main_nav_view.dart';

import '../core/utils/no_internet/no_internet_page.dart';
import '../features/splash/view/splash_view.dart';

class KAppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgetPassword = '/forgetPassword';
  static const String otpVerificationView = '/OtpVerificationView';
  static const String mainNavView = '/MainNavView';
  static const String homeView = '/HomeView';
  static const String addPlansView = '/AddPlansView';
  static const String bookingView = '/BookingView';
  static const String profileView = '/ProfileView';
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
      case mainNavView:
        return MaterialPageRoute(builder: (_) => const MainNavView());
      case homeView:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case addPlansView:
        return MaterialPageRoute(builder: (_) => const AddPlansView());
      case bookingView:
        return MaterialPageRoute(builder: (_) => const BookingView());
      case profileView:
        return MaterialPageRoute(builder: (_) => const ProfileView());
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
