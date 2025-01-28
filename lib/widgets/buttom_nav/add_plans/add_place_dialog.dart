import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/core/extension/context_extensions.dart';
import 'package:travel_app/core/extension/sizedbox_extention.dart';
import 'package:travel_app/core/utils/app_text_styles.dart';
import 'package:travel_app/res/assets.dart';
import 'package:travel_app/res/colors.dart';
import 'package:travel_app/widgets/buttom_nav/add_plans/currency_popup_menu_button.dart';
import 'package:travel_app/widgets/customs/custom_button.dart';
import 'package:travel_app/widgets/customs/custom_text_form_field.dart';

class AddPlaceDialog extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController priceController;
  final TextEditingController typeController;
  final TextEditingController dateController;
  final TextEditingController descriptionController;
  final String selectedCurrency;
  final Function(String) onCurrencySelected;
  final Function() onSave;

  const AddPlaceDialog({
    super.key,
    required this.titleController,
    required this.priceController,
    required this.typeController,
    required this.dateController,
    required this.descriptionController,
    required this.selectedCurrency,
    required this.onCurrencySelected,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              top: 10,
              right: 10,
              child: CircleAvatar(
                  radius: 16,
                  backgroundColor: KAppColors.kBorderLighterGray,
                  child: IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: Icon(
                      Icons.close,
                      color: KAppColors.kLighterGrayInAUTH,
                      size: 18,
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(34),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    context.translate("Add New Place"),
                    style: KAppTextStyle.sourceSansProBold24
                        .copyWith(color: KAppColors.blacPrimaryColor),
                  ),
                  22.sH,
                  CustomTextFormField(
                    controller: titleController,
                    hintText: context.translate("Place Title"),
                    textAlign: TextAlign.center,
                  ),
                  10.sH,
                  CustomTextFormField(
                    controller: priceController,
                    prefixWidget: IntrinsicHeight(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: CurrencyPopupMenuButton(
                              selectedCurrency: selectedCurrency,
                              onCurrencySelected: onCurrencySelected,
                            ),
                          ),
                          VerticalDivider(
                            color: KAppColors.kBorderLighterGray,
                            thickness: 2,
                          ),
                        ],
                      ),
                    ),
                    hintText: context.translate("Price"),
                    textAlign: TextAlign.center,
                  ),
                  10.sH,
                  CustomTextFormField(
                    controller: typeController,
                    onSuffixIconPressed: () {},
                    suffixIconColor: KAppColors.blacPrimaryColor,
                    prefixWidget: Icon(
                      Icons.temple_buddhist,
                      color: KAppColors.blacPrimaryColor,
                    ),
                    suffixIconName: KAppSvgs.arrowForwardIcon,
                    hintText: context.translate("Place Type"),
                    textAlign: TextAlign.center,
                  ),
                  10.sH,
                  CustomTextFormField(
                    controller: dateController,
                    onSuffixIconPressed: () async {
                      final selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (selectedDate != null) {
                        dateController.text =
                            DateFormat('yyyy-MM-dd').format(selectedDate);
                      }
                    },
                    suffixIconColor: KAppColors.blacPrimaryColor,
                    prefixWidget: Icon(
                      Icons.calendar_month,
                      color: KAppColors.blacPrimaryColor,
                    ),
                    suffixIconName: KAppSvgs.arrowForwardIcon,
                    hintText: context.translate("Visit Date"),
                    textAlign: TextAlign.center,
                  ),
                  10.sH,
                  CustomTextFormField(
                    controller: descriptionController,
                    lableText: context.translate("Add description"),
                    labelStyle: KAppTextStyle.sourceSansProBold16.copyWith(
                      color: KAppColors.kGray,
                    ),
                    maxLines: 3,
                    textAlign: TextAlign.center,
                  ),
                  10.sH,
                  CustomButton(
                    onPressed: onSave,
                    text: context.translate("Save"),
                    hMargin: 0,
                    vMargin: 0,
                    verticalPadding: 10,
                    borderRadius: 8,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
