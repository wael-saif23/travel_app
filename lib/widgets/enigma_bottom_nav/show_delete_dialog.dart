import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/extension/context_extensions.dart';
import 'package:travel_app/core/extension/sizedbox_extention.dart';
import 'package:travel_app/core/utils/eni_app_text_styles.dart';
import 'package:travel_app/res/eni_assets.dart';
import 'package:travel_app/res/eni_colors.dart';

class ShowDeleteDialog extends StatelessWidget {
  const ShowDeleteDialog({
    super.key, this.onDeleted, this.onCancel,
  });
final VoidCallback? onDeleted;
final VoidCallback? onCancel;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              width: 333.w,
              height: 229.h,
              decoration: BoxDecoration(
                  color:
                      KAppENIColors.primaryColor,
                  borderRadius:
                      BorderRadius.circular(
                          44.r)),
              child: Center(
                  child: Transform.translate(
                      offset: Offset(0, -76.h),
                      child: Text(
                        context.translate(
                            "Enigma Chat"),
                        style: KAppTextStyleEni
                            .segoeUIBold21,
                      ))),
            ),
            Positioned(
              top: 90.h,
              child: Container(
                width: 272.w,
                height: 242.h,
                decoration: BoxDecoration(
                    color: KAppENIColors
                        .ligherBlackColor,
                    borderRadius:
                        BorderRadius.circular(
                            34.r)),
                child: Column(
                  children: [
                    25.5.sH,
                    Text(
                      context.translate(
                          "Remove Account"),
                      style: KAppTextStyleEni
                          .segoeUIBold18,
                    ),
                    29.sH,
                    Image.asset(
                      KAppPngsEni.deletIcon,
                      height: 71.4.h,
                    ),
                    32.5.sH,
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .center,
                      children: [
                        TextButton(
                            onPressed:onDeleted,
                            child: Text(
                              context.translate(
                                  "Delete"),
                              style: KAppTextStyleEni
                                  .segoeUIsemibold11GrayOpacity,
                            )),
                        55.sW,
                        ElevatedButton(
                            onPressed: onCancel,
                            style: ElevatedButton
                                .styleFrom(
                                    backgroundColor:
                                        KAppENIColors
                                            .greyColor,
                                    shape:
                                        RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(
                                              12.r),
                                    )),
                            child: Text(
                                context.translate(
                                    "Cancel"),
                                style: KAppTextStyleEni
                                    .segoeUIsemibold14))
                      ],
                    )
                  ],
                ),
              ),
            )
          ]),
    );
  }
}
