import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/features/bottom_nav/cubit/bottom_nav_bar_cubit.dart';
import 'package:travel_app/features/bottom_nav/model/item_nav_bar_model.dart';
import 'package:travel_app/widgets/buttom_nav/bottom_nav_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required List<ItemNavBarModel> navItems,
    required this.currentIndex,
    required this.cubit,
  }) : _navItems = navItems;

  final List<ItemNavBarModel> _navItems;
  final int currentIndex;
  final BottomNavBarCubit cubit;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 10.r,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_navItems.length, (index) {
            final item = _navItems[index];
            return BottomNavItem(
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
      ),
    );
  }
}
