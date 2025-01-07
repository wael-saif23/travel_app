import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/utils/app_text_styles.dart';
import 'package:travel_app/features/bottom_nav/pages/booking/cubit/booking_cubit.dart';
import 'package:travel_app/features/bottom_nav/pages/booking/views/active_view.dart';
import 'package:travel_app/features/bottom_nav/pages/booking/views/canceled_view.dart';
import 'package:travel_app/features/bottom_nav/pages/booking/views/past_view.dart';
import 'package:travel_app/helper/functions/custom_simple_appbar.dart';
import 'package:travel_app/res/colors.dart';
import 'package:travel_app/widgets/buttom_nav/booking/custom_tap_item_widget.dart';
import 'package:travel_app/widgets/customs/scaffold_pattern.dart';

class BookingView extends StatelessWidget {
  const BookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookingCubit(),
      child: DefaultTabController(
        length: 3,
        child: ScaffoldPattern(
          appBar: bookingViewAppBar(context),
          child: BlocBuilder<BookingCubit, BookingState>(
            builder: (context, state) {
              if (state is BookingLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is BookingPastLoadedState) {
                return const PastView();
              } else if (state is BookingCanceledLoadedState) {
                return const CanceledView();
              } else {
                return const ActiveView();
              }
            },
          ),
        ),
      ),
    );
  }

  AppBar bookingViewAppBar(BuildContext context) {
    return customSimpleAppbar(
      context: context,
      title: 'Bookings',
      bottomTapBarWidget: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Container(
          height: 60.h,
          color: KAppColors.secondScafoldColor,
          child: BlocBuilder<BookingCubit, BookingState>(
            builder: (context, state) {
              final activeTab = context.read<BookingCubit>().activeTab;
              return TabBar(
                onTap: (index) {
                  context.read<BookingCubit>().changeTab(index);
                },
                unselectedLabelColor: KAppColors.blacPrimaryColor,
                labelColor: KAppColors.primaryColor,
                labelStyle: KAppTextStyle.poppinsMedium16,
                indicator: const BoxDecoration(),
                tabs: [
                  CustomTapItemWidget(
                    tapItemText: 'Active',
                    isSelected: activeTab == 0,
                  ),
                  CustomTapItemWidget(
                    tapItemText: 'Past',
                    isSelected: activeTab == 1,
                  ),
                  CustomTapItemWidget(
                    tapItemText: 'Canceled',
                    isSelected: activeTab == 2,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
