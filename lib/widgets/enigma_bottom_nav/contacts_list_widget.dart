import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/enums/user_status.dart';
import 'package:travel_app/core/extension/sizedbox_extention.dart';
import 'package:travel_app/core/utils/eni_app_text_styles.dart';
import 'package:travel_app/core/utils/format_time.dart';
import 'package:travel_app/data/model/enigma_app_models/user_info_model.dart';
import 'package:travel_app/res/eni_assets.dart';
import 'package:travel_app/res/eni_colors.dart';
import 'package:travel_app/widgets/enigma_bottom_nav/circle_button_with_icon.dart';
import 'package:travel_app/widgets/enigma_bottom_nav/profile_image_with_action.dart';

class ContactsListWidget extends StatelessWidget {
  const ContactsListWidget(
      {super.key,
      required this.contactsList,
      required this.isChatsView,
      required this.index});
  final bool isChatsView;
  final List<UserInfoModel> contactsList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: ListTile(
            leading: ProfileImageWithAction(
              imageAssetPng: contactsList[index].imageUrl ?? "",
              isLoggedIn: contactsList[index].isLoggedIn,
              positionBottom: 0,
              positionRight: 0,
              imageRadius: 25.r,
              actionBackgroundRadius: 5.r,
            ),
            title: Text(
              contactsList[index].name ?? "",
              style: KAppTextStyleEni.segoeUIRegular13,
            ),
            subtitle: isChatsView
                ? Text(
                    contactsList[index].lastMessage ?? "",
                    style: KAppTextStyleEni.segoeUIsemibold11GrayOpacity
                        .copyWith(fontSize: 12),
                  )
                : Text(
                    contactsList[index].userStatus?.toStringValue() ?? "",
                    style: KAppTextStyleEni.segoeUIsemibold11GrayOpacity
                        .copyWith(fontSize: 12),
                  ),
            trailing: isChatsView
                ? SizedBox(
                    height: 50.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        contactsList[index].lastMessageTime != null
                            ? Text(
                                formatTime(
                                    contactsList[index].lastMessageTime!),
                                style: contactsList[index].unreedMessageCount !=
                                        null
                                    ? KAppTextStyleEni.segoeUIRegular13
                                        .copyWith(fontSize: 10)
                                    : KAppTextStyleEni.segoeUIRegular11Gray
                                        .copyWith(fontSize: 10))
                            : SizedBox(),
                        9.sH,
                        contactsList[index].unreedMessageCount != null
                            ? CircleAvatar(
                                radius: 10.r,
                                backgroundColor: KAppENIColors.primaryColor,
                                child: Text(
                                  contactsList[index].unreedMessageCount != null
                                      ? contactsList[index]
                                          .unreedMessageCount
                                          .toString()
                                      : '',
                                  style: KAppTextStyleEni.segoeUIsemibold14
                                      .copyWith(fontSize: 8),
                                ),
                              )
                            : SizedBox(
                                height: 10.h,
                              )
                      ],
                    ),
                  )
                : SizedBox(
                    width: 81.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleButtonWithIcon(
                          onTap: () {},
                          svgiconPath: KAppSvgsEni.chatsUnselectedIcon,
                        ),
                        17.sW,
                        CircleButtonWithIcon(
                          onTap: () {},
                          pngiconPath: KAppPngsEni.deletIcon,
                        ),
                      ],
                    ),
                  ),
          ),
        ),
        contactsList.length - 1 == index
            ? SizedBox()
            : Divider(
                height: 22.h,
                color: KAppENIColors.greyColor,
                endIndent: 24.w,
                indent: 24.w,
              )
      ],
    );
  }
}
