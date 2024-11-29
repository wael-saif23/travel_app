import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../data/api/utils/ui_messages.dart';
import 'logger.dart';

class UrlLauncherHelper {
  static void openWhatsapp(BuildContext context, String? phone) async {
    if (phone != null && phone != '') {
      String whatsappUrl = 'whatsapp://send?phone=$phone';

      if (await canLaunchUrlString(whatsappUrl)) {
        logger.i('******** Can Launch : ');
        await launchUrlString(whatsappUrl);
      } else {
        logger.e('******** Can *not* Launch : ');
        Future.delayed(Duration.zero, () {
          showToast(context: context, msg: 'لا يمكن فتح التطبيق تأكد من وجود التطبيق لديك');
        });
      }
    } else {
      showToast(context: context, msg: 'عفوا لا يوجد رقم واتس');
    }
  }

  static Future<void> openLink(BuildContext context, String path) async {
    if (path.isNotEmpty) {
      Uri url = Uri.parse(path);
      if (await canLaunchUrl(url)) {
        logger.i('******** Can Launch : ');
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        logger.e('******** Can *not* Launch : ');
        Future.delayed(Duration.zero, () {
          showToast(context: context, msg: 'لا يمكن فتح اللينك');
        });
      }
    } else {
      showToast(context: context, msg: 'عفوا اللينك فارغ');
    }
  }

  static Future<void> makeCall(BuildContext context, String phoneNumber) async {
    // await FlutterPhoneDirectCaller.callNumber(phoneNumber);
    if (phoneNumber.isNotEmpty) {
      String url = 'tel://$phoneNumber';
      Uri urlUri = Uri.parse(url);
      if (await canLaunchUrl(urlUri)) {
        logger.i('******** Can Launch : ');
        await launchUrl(urlUri, mode: LaunchMode.externalApplication);
      } else {
        logger.e('******** Can *not* Launch : ');
        Future.delayed(Duration.zero, () {
          showToast(context: context, msg: 'لا يمكن اجراء المكالمة');
        });
      }
    } else {
      showToast(context: context, msg: 'عفوا لا يوجد رقم هاتف');
    }
  }

  static void sendEmail({required String emailAddress, String? subject, String? body}) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: emailAddress,
      queryParameters: {
        'subject': subject,
        'body': body,
      },
    );
    launchUrl(emailLaunchUri);
  }
}
