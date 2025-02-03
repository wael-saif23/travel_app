import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/core/enums/user_status.dart';
import 'package:travel_app/data/model/enigma_app_models/user_info_model.dart';
import 'package:travel_app/res/eni_assets.dart';

part 'enigma_bottom_nav_state.dart';

class EnigmaBottomNavCubit extends Cubit<EnigmaBottomNavState> {
  EnigmaBottomNavCubit() : super(NavigationActive(0));

  final List<UserInfoModel> contacts = [
    UserInfoModel(
      id: 1,
      name: "Jasikaaaa",
      userStatus: UserStatus.available,
      imageUrl: KAppPngsEni.jasikaaaaImage,
      lastMessage: "2:14",
      isLoggedIn: false,
      lastMessageTime: DateTime(2023, 10, 1, 11, 37),
    ),
    UserInfoModel(
      id: 2,
      name: "Jasmeennn",
      userStatus: UserStatus.busy,
      imageUrl: KAppPngsEni.jasmeennnImage ,
      lastMessage: "Hi, Good morning",
      isLoggedIn: true,
      lastMessageTime: DateTime(2023, 10, 1, 11, 37),
      unreedMessageCount: 1,
    ),
    UserInfoModel(
      id: 3,
      name: "Ziad Mezied",
      userStatus: UserStatus.atWork,
      imageUrl:  KAppPngsEni.ziadMeziedImage,
      lastMessage: "I Love You",
      isLoggedIn: false,
      lastMessageTime: DateTime(2023, 10, 1, 11, 37),
    ),
    UserInfoModel(
      id: 4,
      name: "Aya Ahmed",
      userStatus: UserStatus.atTheGym,
      imageUrl: KAppPngsEni.ayaAhmedImage,
      lastMessage: "Good Night. I will see you soon",
      isLoggedIn: false,
      lastMessageTime: DateTime(2023, 10, 1, 11, 37),
      unreedMessageCount: 1,
    ),
    UserInfoModel(
      id: 5,
      name: "Yasmeen Adel",
      userStatus: UserStatus.sleeping,
      imageUrl:  KAppPngsEni.yasmeenAdelImage  ,
      lastMessage: "Noooo, I don't agree",
      isLoggedIn: true,
      lastMessageTime: DateTime(2023, 10, 1, 11, 37),
      unreedMessageCount: 1,
    ),
    UserInfoModel(
      id: 6,
      name: "Hasokshaaaa",
      userStatus: UserStatus.inAMeeting,
      imageUrl:   KAppPngsEni.hasokshaaaaImage ,
      lastMessage: "Okay Habebit",
      isLoggedIn: true,
      lastMessageTime: DateTime(2023, 10, 1, 11, 37),
    ),
    UserInfoModel(
      id: 7,
      name: "Esraa Ayman",
      userStatus: UserStatus.available,
      imageUrl:  KAppPngsEni.esraaAymanImage ,
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
