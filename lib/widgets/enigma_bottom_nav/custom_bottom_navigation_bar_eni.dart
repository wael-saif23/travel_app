import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/features/bottom_nav/model/item_nav_bar_model.dart';
import 'package:travel_app/features/enigma_bottom_nav/enigma_bottom_nav_cubit/enigma_bottom_nav_cubit.dart';
import 'package:travel_app/res/eni_colors.dart';
import 'package:travel_app/widgets/enigma_bottom_nav/bottom_nav_item_enigma.dart';

class CustomBottomNavigationBarEni extends StatelessWidget {
  const CustomBottomNavigationBarEni({
    super.key,
    required List<ItemNavBarModel> navItems,
    required this.currentIndex,
    required this.cubit,
  }) : _navItems = navItems;

  final List<ItemNavBarModel> _navItems;
  final int currentIndex;
  final EnigmaBottomNavCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 99.5.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          stops: [.3, 1],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            KAppENIColors.secondaryColor,
            KAppENIColors.blackColor,
          ],
        ),
        ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_navItems.length, (index) {
          final item = _navItems[index];
          return BottomNavItemEni(
            itemNumber: _navItems.length,
            label: item.label,
            iconUnselected: item.iconUnselected,
            iconSelected: item.iconSelected,
            isSelected: currentIndex == index,
            onSelect: () {
              cubit.updateTabIndex(index);
            },
          );
        }),
      ),
    );
  }
}