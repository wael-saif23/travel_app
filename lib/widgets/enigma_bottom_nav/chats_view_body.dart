import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/features/enigma_bottom_nav/pages/chats/cubit/chats_cubit_cubit.dart';
import 'package:travel_app/res/eni_assets.dart';
import 'package:travel_app/widgets/enigma_bottom_nav/add_friend_button.dart';
import 'package:travel_app/widgets/enigma_bottom_nav/custom_appbar_eni_app.dart';

class ChatsViewBody extends StatelessWidget {
  const ChatsViewBody({
    super.key,
  });
  final bool isChatsView = true;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBarEniApp(
            title: "Chats",
            pngActionIcon: KAppPngsEni.qrCodeIcon,
            onActionPressed: () {},
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                
                ),
              ],
            ),
          ),
        ],
      ),
      Positioned(
          bottom: 14.5.h,
          right: 21.w,
          child: AddFriendButton(
            onTap: () {
              context.read<ChatsCubit>().showAddFriendView();
            },
          ))
    ]);
  }
}
