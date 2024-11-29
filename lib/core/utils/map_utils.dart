


import 'package:url_launcher/url_launcher.dart';

class MapUtils {

  MapUtils._();

  static Future<void> openGoogleMap({double? lat, double? long}) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$lat,$long';
    if (await canLaunchUrl(Uri.parse(googleUrl))) {
      await launchUrl(Uri.parse(googleUrl));
    } else {
      throw 'Could not open the map.';
    }
  }


}