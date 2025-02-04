import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/features/bottom_nav/model/item_nav_bar_model.dart';
import 'package:travel_app/features/enigma_bottom_nav/contacts_cubit/contacts_cubit.dart';
import 'package:travel_app/features/enigma_bottom_nav/enigma_bottom_nav_cubit/enigma_bottom_nav_cubit.dart';
import 'package:travel_app/features/enigma_bottom_nav/pages/chats/views/enigma_chats_view.dart';
import 'package:travel_app/features/enigma_bottom_nav/pages/contacts/views/eni_contacts_view.dart';
import 'package:travel_app/features/enigma_bottom_nav/pages/my_profile/views/eni_my_profile_view.dart';
import 'package:travel_app/res/eni_assets.dart';
import 'package:travel_app/widgets/customs/scaffold_pattern.dart';
import 'package:travel_app/widgets/enigma_bottom_nav/custom_bottom_navigation_bar_eni.dart';

class MainNavViewEni extends StatelessWidget {
  const MainNavViewEni({super.key});

  final List<Widget> pages = const [
    EnigmaChatsView(),
    EniContactsView(),
    EniMyProfileView(),
  ];
  final List<ItemNavBarModel> _navItems = const [
    ItemNavBarModel(
        label: 'Chats',
        iconSelected: KAppSvgsEni.chatsSelectedIcon,
        iconUnselected: KAppSvgsEni.chatsUnselectedIcon),
    ItemNavBarModel(
        label: 'Contacts',
        iconSelected: KAppSvgsEni.contactsSelectedIcon,
        iconUnselected: KAppSvgsEni.contactsUnselectedIcon),
    ItemNavBarModel(
        label: 'My Profile',
        iconSelected: KAppSvgsEni.myProfileSelectedIcon,
        iconUnselected: KAppSvgsEni.myProfileUnselectedIcon),
  ];
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EnigmaBottomNavCubit(),
        ),
        BlocProvider(
          create: (context) => ContactsCubit()..loadContacts(),
        ),
      ],
      child: BlocBuilder<EnigmaBottomNavCubit, EnigmaBottomNavState>(
        builder: (context, state) {
          final cubit = context.read<EnigmaBottomNavCubit>();
          int currentIndex = 0;
          if (state is NavigationActive) {
            currentIndex = state.currentIndex;
          }
          return ScaffoldPattern(
            bottomNavigationBar: CustomBottomNavigationBarEni(
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
