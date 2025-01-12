import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(NavigationActive(0));

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
