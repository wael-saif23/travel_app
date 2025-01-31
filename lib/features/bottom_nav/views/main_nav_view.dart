import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/features/bottom_nav/cubit/bottom_nav_bar_cubit.dart';
import 'package:travel_app/features/bottom_nav/model/item_nav_bar_model.dart';
import 'package:travel_app/features/bottom_nav/pages/add_plans/views/add_plans_view.dart';
import 'package:travel_app/features/bottom_nav/pages/booking/views/booking_view.dart';
import 'package:travel_app/features/bottom_nav/pages/home/views/home_view.dart';
import 'package:travel_app/features/bottom_nav/pages/profile/views/profile_view.dart';
import 'package:travel_app/res/assets.dart';
import 'package:travel_app/widgets/buttom_nav/custom_bottom_navigation_bar.dart';
import 'package:travel_app/widgets/widgets.dart';

class MainNavView extends StatelessWidget {
  const MainNavView({super.key});

  final List<Widget> pages = const [
    HomeView(),
    AddPlansView(),
    BookingView(),
    ProfileView(),
  ];
  final List<ItemNavBarModel> _navItems = const [
    ItemNavBarModel(
        label: 'Home',
        iconSelected: KAppSvgs.homeIconSelected,
        iconUnselected: KAppSvgs.homeIconUnselected),
    ItemNavBarModel(
        label: 'Add Plans',
        iconSelected: KAppSvgs.addPlansIconSelected,
        iconUnselected: KAppSvgs.addPlansIconUnselected),
    ItemNavBarModel(
        label: 'Booking',
        iconSelected: KAppSvgs.bookingIconSelected,
        iconUnselected: KAppSvgs.bookingIconUnselected),
    ItemNavBarModel(
        label: 'Profile',
        iconSelected: KAppSvgs.profileIconSelected,
        iconUnselected: KAppSvgs.profileIconUnselected),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBarCubit(),
      child: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (context, state) {
          final cubit = context.read<BottomNavBarCubit>();
          int currentIndex = 0;
          if (state is NavigationActive) {
            currentIndex = state.currentIndex;
          }
          return ScaffoldPattern(
            bottomNavigationBar: CustomBottomNavigationBar(
              navItems: _navItems,
              currentIndex: currentIndex,
              cubit: cubit,
              
            ),
            child: PageView(
              controller: cubit.pageController,
              children: pages,
              onPageChanged: (index) {
                cubit.updateTabIndex(index);
              },
            ),
          );
        },
      ),
    );
  }
}
