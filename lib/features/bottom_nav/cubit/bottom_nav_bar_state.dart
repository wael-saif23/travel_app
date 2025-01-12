part of 'bottom_nav_bar_cubit.dart';

@immutable
sealed class BottomNavBarState {}

class NavigationActive extends BottomNavBarState {
  final int currentIndex;

  NavigationActive(this.currentIndex);
}

class NavigationDisabled extends BottomNavBarState {
  final int disabledIndex;

  NavigationDisabled(this.disabledIndex);
}

class NavigationRestored extends BottomNavBarState {
  final int restoredIndex;

  NavigationRestored(this.restoredIndex);
}
