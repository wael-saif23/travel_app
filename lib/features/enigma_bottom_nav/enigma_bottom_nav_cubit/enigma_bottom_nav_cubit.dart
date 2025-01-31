import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'enigma_bottom_nav_state.dart';

class EnigmaBottomNavCubit extends Cubit<EnigmaBottomNavState> {
  EnigmaBottomNavCubit() : super(NavigationActive(0));

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
