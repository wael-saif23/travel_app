import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../data/app_session.dart';
import 'logger.dart';

class LocationUtil {
  static Future<bool> checkPermissionAndGetCurrentLatLng() async {
    try {
      LocationPermission permission;
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (serviceEnabled) {
        permission = await Geolocator.requestPermission();
        Position? position = await Geolocator.getLastKnownPosition();
        AppSession.currentLatLng = LatLng(position?.latitude ?? 0, position?.longitude ?? 0);
        logger.i('the final value is ${AppSession.currentLatLng}');
        return true;
      } else {
        permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
            return Future.error('Location permissions are denied');
          } else if (permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
            Position? position = await Geolocator.getLastKnownPosition();
            AppSession.currentLatLng = LatLng(position?.latitude ?? 0, position?.longitude ?? 0);
            return true;
          }
        }
      }
      return false;
    } catch (e) {
      logger.e(e);
      return false;
    }
  }

  static Future<String?> getTranslatedAddress({LatLng? latLng}) async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    // bool canGetLocation = await checkPermissionAndGetLatLng();
    if (!serviceEnabled) {
      return null;
    }
    String addressOnMap = '';
    final appLanguage = AppSession.getLangKey();
    if (AppSession.currentLatLng != null) {
      setLocaleIdentifier(appLanguage);
      List<Placemark> placeMarks = await placemarkFromCoordinates(
        AppSession.currentLatLng!.latitude,
        AppSession.currentLatLng!.longitude,
      );

      Placemark place = placeMarks[0];
      logger.w(place.toJson());

      // '،' for ar  -  ',' for en
      if (AppSession.getLangKey() == 'ar') {
        addressOnMap =
            '${place.street.toString().split('،').first}، ${place.subAdministrativeArea}، ${place.administrativeArea}، ${place.country}';
      } else {
        addressOnMap =
            '${place.street.toString().split(',').first}, ${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.country}';
      }
      return addressOnMap;
    }
    return null;
  }
}
