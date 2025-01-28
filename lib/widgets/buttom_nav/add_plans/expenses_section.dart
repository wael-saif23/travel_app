import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/core/extension/sizedbox_extention.dart';
import 'package:travel_app/core/utils/app_text_styles.dart';
import 'package:travel_app/data/model/place_model.dart';
import 'package:travel_app/features/bottom_nav/pages/add_plans/add_plans_cubit/add_plans_cubit.dart';
import 'package:travel_app/res/colors.dart';
import 'package:travel_app/widgets/customs/popup_menu_button_widget.dart';

class ExpensesSection extends StatelessWidget {
  final List<Place> places;
  final ExpensesSortOrder sortOrder;
  final Function(ExpensesSortOrder) onSortOrderChanged;
  final bool isExpanded;

  const ExpensesSection({
    super.key,
    required this.places,
    required this.sortOrder,
    required this.onSortOrderChanged,
    required this.isExpanded,
  });

  @override
  Widget build(BuildContext context) {
    final sortedPlaces = _sortPlaces(places, sortOrder);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    isExpanded ? Icons.expand_more : Icons.expand_less,
                    size: 28,
                    color: KAppColors.blacPrimaryColor,
                  ),
                  onPressed: () {
                    context.read<AddPlansCubit>().toggleExpensesExpansion();
                  },
                ),
                Text(
                  "Expenses",
                  style: KAppTextStyle.sourceSansProBold24
                      .copyWith(color: KAppColors.blacPrimaryColor),
                ),
              ],
            ),
            Row(
              children: [
                Text('Sort:',
                    style: KAppTextStyle.sourceSansProBold16
                        .copyWith(color: KAppColors.blacPrimaryColor)),
                GenericPopupMenuButton<ExpensesSortOrder>(
                  itemList: ExpensesSortOrder.values.toList(),
                  onItemSelected: (selectedOrder) {
                    onSortOrderChanged(
                        selectedOrder); // تحديث الحالة عند الاختيار
                  },
                  itemToString: (order) =>
                      _getSortOrderLabel(order), // تحويل العنصر إلى نص
                  title: _getSortOrderLabel(sortOrder),
                  titleTextStyle: KAppTextStyle.sourceSansProRegular16
                      .copyWith(color: KAppColors.kLighterGrayInAUTH),
                ),
                16.sW,
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
          crossFadeState:
              isExpanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          firstChild: Column(
            children: sortedPlaces.map((place) {
              return Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: KAppColors.kBorderLighterGray,
                      child: Icon(
                        place.icon ?? Icons.temple_buddhist,
                        color: KAppColors.kLighterGrayInAUTH,
                      ),
                    ),
                    title: Text(
                      place.name,
                      style: KAppTextStyle.sourceSansProBold16
                          .copyWith(color: KAppColors.blacPrimaryColor),
                    ),
                    subtitle: Text(
                      "${place.date} - ${place.placetype}",
                      style: KAppTextStyle.sourceSansProRegular14
                          .copyWith(color: KAppColors.kGray),
                    ),
                    trailing: Text(
                      place.price.toString(),
                      style: KAppTextStyle.sourceSansProBold16
                          .copyWith(color: KAppColors.blacPrimaryColor),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: KAppColors.kGray,
                    endIndent: 16,
                    indent: 16,
                  ),
                ],
              );
            }).toList(),
          ),
          secondChild: Container(), // فارغ عندما تكون القائمة مطوية
        ),
        16.sH,
      ],
    );
  }

  // دالة لترتيب المصروفات
  List<Place> _sortPlaces(List<Place> places, ExpensesSortOrder sortOrder) {
    switch (sortOrder) {
      case ExpensesSortOrder.dateNewestFirst:
        return places..sort((a, b) => b.time.compareTo(a.time));
      case ExpensesSortOrder.dateOldestFirst:
        return places..sort((a, b) => a.time.compareTo(b.time));
      case ExpensesSortOrder.priceHighestFirst:
        return places..sort((a, b) => b.price.compareTo(a.price));
      case ExpensesSortOrder.priceLowestFirst:
        return places..sort((a, b) => a.price.compareTo(b.price));
    }
  }

  // دالة للحصول على نص خيار الترتيب
  String _getSortOrderLabel(ExpensesSortOrder order) {
    switch (order) {
      case ExpensesSortOrder.dateNewestFirst:
        return "Date (newest first)";
      case ExpensesSortOrder.dateOldestFirst:
        return "Date (oldest first)";
      case ExpensesSortOrder.priceHighestFirst:
        return "Price (highest first)";
      case ExpensesSortOrder.priceLowestFirst:
        return "Price (lowest first)";
    }
  }
}

