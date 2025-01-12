import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/core/utils/app_text_styles.dart';
import 'package:travel_app/res/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.borderColorCode,
    this.borderWidht,
    this.enabledBorderColorCode,
    this.enabledBorderWidht,
    this.focusedBorderColorCode,
    this.focusedBorderWidht,
    this.errorBorderColorCode,
    this.errorBorderWidht,
    required this.hintText,
    this.prefixIconName,
    this.backgroundFillColor,
    this.suffixIconName,
    this.onSuffixIconPressed,
    this.obscureText, this.textAlign,
  });

  final int? borderColorCode;
  final double? borderWidht;

  final int? enabledBorderColorCode;
  final double? enabledBorderWidht;

  final int? focusedBorderColorCode;
  final double? focusedBorderWidht;

  final int? errorBorderColorCode;
  final double? errorBorderWidht;

  final String hintText;
  final String? prefixIconName;
  final String? suffixIconName;
  final Color? backgroundFillColor;
  final VoidCallback? onSuffixIconPressed;
  final bool? obscureText;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: textAlign ?? TextAlign.start,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        prefixIcon: prefixIconName != null
            ? SvgPicture.asset(
                prefixIconName ?? '',
                fit: BoxFit.scaleDown,
              )
            : null,
        fillColor: backgroundFillColor ?? Colors.transparent,
        filled: true,
        suffixIcon: IconButton(
          onPressed: onSuffixIconPressed,
          icon: suffixIconName != null
              ? SvgPicture.asset(
                  suffixIconName ?? '',
                  fit: BoxFit.scaleDown,
                )
              : SizedBox(),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        hintText: hintText,
        hintStyle: KAppTextStyle.interSemiBold16.copyWith(
          color: KAppColors.kGray,
        ),
        helperMaxLines: 1,
        

        
        border: decorationOutBorder(
          borderColorCode: borderColorCode,
          borderWidht: borderWidht,
          
        ),
        enabledBorder: decorationOutBorder(
          borderColorCode: enabledBorderColorCode,
          borderWidht: enabledBorderWidht,
        ),
        focusedBorder: decorationOutBorder(
          borderColorCode: focusedBorderColorCode,
          borderWidht: focusedBorderWidht,
        ),
        errorBorder: decorationOutBorder(
          borderColorCode: errorBorderColorCode,
          borderWidht: errorBorderWidht,
        ),
      ),
    );
  }

  OutlineInputBorder decorationOutBorder(
      {double? borderWidht, int? borderColorCode}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: borderColorCode != null
            ? Color(borderColorCode)
            : KAppColors.kBorderLighterGray,
        width: borderWidht ?? 1,
      ),
    );
  }
}
