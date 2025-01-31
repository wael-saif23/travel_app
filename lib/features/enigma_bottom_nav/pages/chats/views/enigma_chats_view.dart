import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/features/enigma_add_friend/views/add_friend_view.dart';
import 'package:travel_app/features/enigma_bottom_nav/pages/chats/cubit/chats_cubit_cubit.dart';
import 'package:travel_app/res/eni_colors.dart';
import 'package:travel_app/widgets/customs/scaffold_pattern.dart';
import 'package:travel_app/widgets/enigma_bottom_nav/chats_view_body.dart';

class EnigmaChatsView extends StatelessWidget {
  const EnigmaChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPattern(
      appBarBackgroundColor: KAppENIColors.blackColor,
      statusBarIsLight: false,
      backgroundColor: KAppENIColors.blackColor,
      child: BlocProvider(
        create: (context) => ChatsCubit(),
        child: BlocBuilder<ChatsCubit, ChatsCubitState>(
          builder: (context, state) {
            if(state is AddFriendviewState) {
            return AddFriendPage();}
            else{
              return ChatsViewBody();
            }
          },
        ),
      ),
    );
  }
}

