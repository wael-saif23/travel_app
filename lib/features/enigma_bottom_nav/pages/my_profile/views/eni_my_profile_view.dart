import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/extension/context_extensions.dart';
import 'package:travel_app/core/extension/sizedbox_extention.dart';
import 'package:travel_app/res/eni_assets.dart';
import 'package:travel_app/res/eni_colors.dart';
import 'package:travel_app/widgets/customs/scaffold_pattern.dart';
import 'package:travel_app/widgets/enigma_bottom_nav/custom_appbar_eni_app.dart';
import 'package:travel_app/widgets/enigma_bottom_nav/delete_account_widget.dart';
import 'package:travel_app/widgets/enigma_bottom_nav/linked_accounts_section_widget.dart';
import 'package:travel_app/widgets/enigma_bottom_nav/log_out_button.dart';
import 'package:travel_app/widgets/enigma_bottom_nav/nickname_widget.dart';
import 'package:travel_app/widgets/enigma_bottom_nav/profile_image_with_action.dart';
import 'package:travel_app/widgets/enigma_bottom_nav/section_name_widget.dart';
import 'package:travel_app/widgets/enigma_bottom_nav/setting_section_widget.dart';
import 'package:travel_app/widgets/enigma_bottom_nav/show_delete_dialog.dart';

class EniMyProfileView extends StatelessWidget {
  const EniMyProfileView({super.key});

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
            title: 'My Profile',
            pngActionIcon: KAppPngsEni.qrCodeIcon,
            onActionPressed: () {},
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 16.h,
                    ),
                    child: Column(
                      children: [
                        SectionNameWidget(
                            sectionName: context.translate(
                              "Profile Picture and nickname",
                            ),
                            horizontalPadding: 22.w),
                        21.sH,
                        ProfileImageWithAction(
                          // networkUrlImage: ,
                          imageRadius: 64.5.r,
                          actionBackgroundRadius: 22.r,
                          actionBackgroundColor: KAppENIColors.primaryColor,
                          positionBottom: -10,
                          positionRight: -10,
                          actionChild: IconButton(
                            onPressed: () {
                              // اضافة الصورة الشخصية سواء بالكاميرا او فتح المعرض
                              // مع اضافة المسار الخاص بالصورة في networkUrlImage
                              // ربط المسار الخاص بالصورة في صفحة البروفايل بالصورة في الـ custom app bar
                            },
                            icon: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ),
                        16.sH,
                        Padding(
                          padding: EdgeInsets.only(left: 22.w, right: 42.w),
                          child: Column(
                            children: [
                              NicknameWidget(
                                nickname: "Toqa Mezied",
                                onEditPressed: () {
                                  // handle edit nickname
                                },
                              ),
                              10.sH,
                              LinkedAccountsSection(),
                              8.sH,
                              SettingSection(),
                            ],
                          ),
                        ),
                        LogOutButton(onTap: () {}),
                        5.sH,
                        DeleteAccountWidget(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return ShowDeleteDialog(onDeleted: () {
                                    // handle delete account
                                  }, onCancel: () {
                                    Navigator.pop(context);
                                  });
                                });
                          },
                        )
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
