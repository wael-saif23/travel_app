import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/api/utils/ui_messages.dart';

class LinkLauncher {
  void openWhatsapp(String? phone) async {
    if (phone != null && phone != '') {
      await launchUrl(Uri.parse("https://wa.me/$phone"), mode: LaunchMode.externalApplication);
    }
  }

  Future<void> openLink(BuildContext context, String? path) async {
    Uri url = Uri.parse('$path');
    await canLaunchUrl(url)
        ? await launchUrl(url, mode: LaunchMode.externalApplication)
        : await Future.delayed(Duration.zero, () {
            showToast(context: context, msg: 'توجد مشكلة');
          });
  }

  Future<void> makeCall(BuildContext context, String phoneNumber) async {
    // await FlutterPhoneDirectCaller.callNumber(phoneNumber);
    String url = 'tel://$phoneNumber';
    Uri urlUri = Uri.parse(url);

    await canLaunchUrl(urlUri)
        ? await launchUrl(urlUri, mode: LaunchMode.externalApplication)
        : await Future.delayed(Duration.zero, () {
            showToast(context: context, msg: 'توجد مشكلة');
          });
  }
}
