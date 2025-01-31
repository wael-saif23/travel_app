import 'package:flutter/material.dart';
import 'package:travel_app/core/utils/no_internet/no_internet_page.dart';
import 'package:travel_app/features/enigma_add_friend/views/add_friend_view.dart';
import 'package:travel_app/features/enigma_bottom_nav/pages/chats/views/enigma_chats_view.dart';
import 'package:travel_app/features/enigma_bottom_nav/pages/contacts/views/eni_contacts_view.dart';
import 'package:travel_app/features/enigma_bottom_nav/pages/my_profile/views/eni_my_profile_view.dart';
import 'package:travel_app/features/enigma_bottom_nav/pages/my_profile/views/privacy_policy_page.dart';
import 'package:travel_app/features/enigma_bottom_nav/views/enigma_main_nav_view.dart';

class KAppRoutesEni {
  static const String mainNavViewEni = '/';
  static const String enigmaChatsView = '/EnigmaChatsView';
  static const String eniContactsView = '/EniContactsView';
  static const String eniMyProfileView = '/EniMyProfileView';
  static const String noInternetPage = '/noInternetPage';
  static const String privacyPolicyPage = '/privacyPolicyPage';
  static const String addFriendView = '/addFriendView';

  static Route<dynamic>? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case mainNavViewEni:
        return createRoute(const MainNavViewEni());
      case enigmaChatsView:
        return createRoute(const EnigmaChatsView());
      case eniContactsView:
        return createRoute(const EniContactsView());
      case eniMyProfileView:
        return createRoute(const EniMyProfileView());
      case privacyPolicyPage:
        return createRoute(const PrivacyPolicyPage());
      case addFriendView:
        return createRoute(const AddFriendPage());
      case noInternetPage:
        return createRoute(const NoInternetPage());
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
