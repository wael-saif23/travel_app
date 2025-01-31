import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/core/extension/sizedbox_extention.dart';
import 'package:travel_app/res/eni_assets.dart';
import 'package:travel_app/res/eni_colors.dart';
import 'package:travel_app/widgets/customs/scaffold_pattern.dart';
import 'package:travel_app/widgets/enigma_bottom_nav/custom_appbar_eni_app.dart';
import 'package:travel_app/widgets/enigma_bottom_nav/start_searching_state_widget.dart';

class AddFriendPage extends StatelessWidget {
  const AddFriendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPattern(
      appBarBackgroundColor: KAppENIColors.blackColor,
      statusBarIsLight: false,
      backgroundColor: KAppENIColors.blackColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBarEniApp(
            title: "Add Friend",
            pngActionIcon: KAppPngsEni.qrCodeIcon,
            onActionPressed: () {},
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      children: [
                        49.sH,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: SearchBar(
                                onChanged: (value) {},
                                hintText: 'Search for friends',
                                hintStyle: const WidgetStatePropertyAll(
                                    TextStyle(color: KAppENIColors.greyColor)),
                                backgroundColor: WidgetStatePropertyAll(
                                    KAppENIColors.darkGreenColor
                                        .withOpacity(.6)),
                                leading: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.search,
                                      color: KAppENIColors.whiteColor,
                                    )),
                              ),
                            ),
                            20.sW,
                            GestureDetector(
                              onTap: () {},
                              child: CircleAvatar(
                                radius: 24.r,
                                backgroundColor: KAppENIColors.primaryColor,
                                child: SvgPicture.asset(
                                    KAppSvgsEni.filterSearchIcon),
                              ),
                            )
                          ],
                        ),
                        74.sH,
                        StartSearchingStateWidget(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




