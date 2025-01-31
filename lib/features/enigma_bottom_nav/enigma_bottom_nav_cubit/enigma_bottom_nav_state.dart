part of 'enigma_bottom_nav_cubit.dart';

sealed class EnigmaBottomNavState  {
  const EnigmaBottomNavState();
}


class NavigationActive extends EnigmaBottomNavState {
  final int currentIndex;

  NavigationActive(this.currentIndex);
}

class NavigationDisabled extends EnigmaBottomNavState {
  final int disabledIndex;

  NavigationDisabled(this.disabledIndex);
}

class NavigationRestored extends EnigmaBottomNavState {
  final int restoredIndex;

  NavigationRestored(this.restoredIndex);
}