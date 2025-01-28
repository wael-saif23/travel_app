import 'package:flutter/material.dart';
import 'package:travel_app/core/utils/app_text_styles.dart';
import 'package:travel_app/res/colors.dart';
import 'package:travel_app/widgets/customs/popup_menu_button_widget.dart';

class CurrencyPopupMenuButton extends StatelessWidget {
  final String selectedCurrency;
  final Function(String) onCurrencySelected;

  const CurrencyPopupMenuButton({
    super.key,
    required this.selectedCurrency,
    required this.onCurrencySelected,
  });

  @override
  Widget build(BuildContext context) {
    return GenericPopupMenuButton<String>(
      itemList: [r"$", "SAR", "LE"], // قائمة العملات
      onItemSelected: onCurrencySelected,
      itemToString: (currency) => currency,
      title: selectedCurrency, // العملة المحددة
      titleTextStyle: KAppTextStyle.sourceSansProBold18.copyWith(
        color: KAppColors.blacPrimaryColor,
        fontSize: 20,
      ),
    );
  }
}

