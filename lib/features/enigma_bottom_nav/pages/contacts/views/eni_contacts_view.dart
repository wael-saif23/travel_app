import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/core/extension/sizedbox_extention.dart';
import 'package:travel_app/data/model/enigma_app_models/user_info_model.dart';
import 'package:travel_app/features/enigma_bottom_nav/enigma_bottom_nav_cubit/enigma_bottom_nav_cubit.dart';
import 'package:travel_app/res/eni_assets.dart';
import 'package:travel_app/res/eni_colors.dart';
import 'package:travel_app/widgets/customs/scaffold_pattern.dart';
import 'package:travel_app/widgets/enigma_bottom_nav/contacts_list_widget.dart';
import 'package:travel_app/widgets/enigma_bottom_nav/custom_appbar_eni_app.dart';

class EniContactsView extends StatelessWidget {
  const EniContactsView({super.key});
  get networkUrlImage => null;

  @override
  Widget build(BuildContext context) {
    final List<UserInfoModel> contactsList =
        BlocProvider.of<EnigmaBottomNavCubit>(context).contacts;
    return ScaffoldPattern(
      appBarBackgroundColor: KAppENIColors.blackColor,
      statusBarIsLight: false,
      backgroundColor: KAppENIColors.blackColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBarEniApp(
            title: "Contacts",
            pngActionIcon: KAppPngsEni.qrCodeIcon,
            onActionPressed: () {},
          ),
          31.sH,
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverList.builder(
                    itemCount: contactsList.length,
                    itemBuilder: (context, index) => Column(
                          children: [
                            ContactsListWidget(
                              isChatsView: false,
                              contactsList: contactsList,
                              index: index,
                            ),
                          ],
                        )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
