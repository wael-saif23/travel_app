import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../core/localization/app_localization.dart';
import '../core/enums/environment_mode.dart';
import '../res/keys.dart';
import 'model/response_models/auth_model.dart';

class AppSession {
  static String? registrationToken;
  static RemoteMessage? remoteMessageInBackground;

  static bool isEnLang(BuildContext context) => AppLocalizations.of(context)?.isEnLocale ?? false;

  static AuthModel? currentUser;
  static LatLng? currentLatLng;
  static EnvironmentMode? environmentMode = EnvironmentMode.dev;

  static Future<void> setFirstInstall(bool firstInstall) async {
    final box = Hive.box(KAppKeys.APP_HIVE_BOX);
    return box.put(KAppKeys.firstInstallKey, firstInstall);
  }

  static Future<bool> getFirstInstall() async {
    final box = Hive.box(KAppKeys.APP_HIVE_BOX);
    return await box.get(KAppKeys.firstInstallKey) ?? true;
  }

  static Future<void> setLangKey(String lang) async {
    final box = Hive.box(KAppKeys.APP_HIVE_BOX);
    return box.put(KAppKeys.langKey, lang);
  }

  static String getLangKey() {
    final box = Hive.box(KAppKeys.APP_HIVE_BOX);
    return box.get(KAppKeys.langKey) ?? 'ar';
  }
}
