import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/res/assets.dart';
import 'package:travel_app/widgets/buttom_nav/custom_app_bar.dart';
import 'package:travel_app/widgets/buttom_nav/profile/custom_profile_button.dart';
import 'package:travel_app/widgets/customs/scaffold_pattern.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPattern(
        child: Column(
          children: [
            CustomAppBar(
              isLogined: true,
              isProfile: true,
              userName: 'Wael Saif',
              userLocation: 'Dakhlia, Elmansoura',
              userImage: KAppPngs.userExImage,
              userEmail: 'waelSaif@gamil.com',
              userPhone: '00201234566789',
              onEditTap: () {},
            ),
            Expanded(
              child: CustomScrollView(slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(24.dg),
                    child: Column(
                      children: [
                        CustomProfileButton(
                          onTap: () {},
                          buttonText: 'My Bookings',
                          leadingIconPath: KAppSvgs.myBookingsIcon,
                        ),
                        CustomProfileButton(
                          onTap: () {},
                          buttonText: 'Saved Places',
                          leadingIconPath: KAppSvgs.savedPlacesIcon,
                        ),
                        CustomProfileButton(
                          onTap: () {},
                          buttonText: 'My Plans',
                          leadingIconPath: KAppSvgs.myPlansIcon,
                        ),
                        CustomProfileButton(
                          onTap: () {},
                          buttonText: 'Terms and Conditions',
                          leadingIconPath: KAppSvgs.termsAndConditionsIcon,
                        ),
                        CustomProfileButton(
                          onTap: () {},
                          buttonText: 'Contact Us',
                          leadingIconPath: KAppSvgs.contactUsIcon,
                        ),
                        CustomProfileButton(
                          onTap: () {},
                          buttonText: 'Register Your Business',
                          leadingIconPath: KAppSvgs.registerYourBusinessIcon,
                        ),
                        CustomProfileButton(
                          onTap: () {},
                          buttonText: 'Important Numbers',
                          leadingIconPath: KAppSvgs.importantNumbersIcon,
                        ),
                        CustomProfileButton(
                          onTap: () {},
                          buttonText: 'Log Out',
                          leadingIconPath: KAppSvgs.logOutIcon,
                          showDivider: false,
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            )
          ],
        ));
  }
}
