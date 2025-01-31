import 'package:flutter/material.dart';
import 'package:travel_app/core/utils/eni_app_text_styles.dart';
import 'package:travel_app/widgets/enigma_bottom_nav/editIcon_container_widget.dart';

class NicknameWidget extends StatelessWidget {
  const NicknameWidget({
    super.key,
    required this.nickname, this.onEditPressed,
  });
  final String nickname;
  final VoidCallback? onEditPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          nickname,
          style: KAppTextStyleEni.segoeUIRegular22,
        ),
        EditIconContainerWidget(
          onEditPressed: onEditPressed,
        )
      ],
    );
  }
}