import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/core/extension/sizedbox_extention.dart';
import 'package:travel_app/features/enigma_bottom_nav/contacts_cubit/contacts_cubit.dart';
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
            child: BlocBuilder<ContactsCubit, ContactsState>(
              builder: (context, state) {
                if (state is ContactsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ContactsLoaded) {
                  return CustomScrollView(
                    slivers: [
                      SliverList.builder(
                        itemCount: state.contacts.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            ContactsListWidget(
                              isChatsView: false,
                              contactsList: state.contacts,
                              index: index,
                              onDeleteContact: () {
                                final cubit = context.read<ContactsCubit>();
                                cubit.deleteContact(state.contacts[index].id);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (state is ContactsError) {
                  return Center(child: Text(state.message));
                } else {
                  return const Center(child: Text("Unknown state"));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
