import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/core/enums/user_status.dart';
import 'package:travel_app/data/model/enigma_app_models/user_info_model.dart';

part 'enigma_bottom_nav_state.dart';

class EnigmaBottomNavCubit extends Cubit<EnigmaBottomNavState> {
  EnigmaBottomNavCubit() : super(NavigationActive(0));

  final List<UserInfoModel> contacts = [
    UserInfoModel(
      name: "Jasikaaaa",
      userStatus: UserStatus.available,
      imageUrl: "path_to_image",
      lastMessage: "2:14",
      isLoggedIn: false,
      lastMessageTime: DateTime(2023, 10, 1, 11, 37),
    ),
    UserInfoModel(
      name: "Jasmeennn",
      userStatus: UserStatus.busy,
      imageUrl: "path_to_image",
      lastMessage: "Hi, Good morning",
      isLoggedIn: true,
      lastMessageTime: DateTime(2023, 10, 1, 11, 37),
      unreedMessageCount: 1,
    ),
    UserInfoModel(
      name: "Ziad Mezied",
      userStatus: UserStatus.atWork,
      imageUrl: "path_to_image",
      lastMessage: "I Love You",
      isLoggedIn: false,
      lastMessageTime: DateTime(2023, 10, 1, 11, 37),
    ),
    UserInfoModel(
      name: "Aya Ahmed",
      userStatus: UserStatus.atTheGym,
      imageUrl: "path_to_image",
      lastMessage: "Good Night. I will see you soon",
      isLoggedIn: false,
      lastMessageTime: DateTime(2023, 10, 1, 11, 37),
      unreedMessageCount: 1,
    ),
    UserInfoModel(
      name: "Yasmeen Adel",
      userStatus: UserStatus.sleeping,
      imageUrl: "path_to_image",
      lastMessage: "Noooo, I don't agree",
      isLoggedIn: true,
      lastMessageTime: DateTime(2023, 10, 1, 11, 37),
      unreedMessageCount: 1,
    ),
    UserInfoModel(
      name: "Hasokshaaaa",
      userStatus: UserStatus.inAMeeting,
      imageUrl: "path_to_image",
      lastMessage: "Okay Habebit",
      isLoggedIn: true,
      lastMessageTime: DateTime(2023, 10, 1, 11, 37),
    ),
    UserInfoModel(
      name: "Esraa Ayman",
      userStatus: UserStatus.available,
      imageUrl: "path_to_image",
      lastMessage: "Okay Habebit",
      isLoggedIn: false,
      lastMessageTime: DateTime(2023, 10, 1, 11, 37),
    ),
  ];

  final PageController pageController = PageController();
  final itemIndex = 0;

  void updateTabIndex(int index) {
    pageController.jumpToPage(index);
    emit(NavigationActive(index)); // الصفحة النشطة الجديدة
  }

  void disableTab(int index) {
    emit(NavigationDisabled(index));
  }

  void restoreTab(int index) {
    emit(NavigationRestored(index));
    emit(NavigationActive(index));
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
