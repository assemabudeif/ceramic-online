import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/services_locator.dart';
import '../../services/shared_key.dart';

enum Language { en, ar }

String get getAppLanguageCode =>
    sl<SharedPreferences>().getString(SharedKey.language.name) ??
    Get.deviceLocale?.languageCode ??
    'en';

void changeAppLanguage(BuildContext context) {
  if (getAppLanguageCode == 'en') {
    Get.updateLocale(const Locale('ar'));

    sl<SharedPreferences>().setString(SharedKey.language.name, 'ar');
  } else {
    Get.updateLocale(const Locale('en'));

    sl<SharedPreferences>().setString(SharedKey.language.name, 'en');
  }
  Phoenix.rebirth(context);
}

Future<void> firstTimeForLanguage() async {
  if (sl<SharedPreferences>().getString(SharedKey.language.name) == null) {
    await sl<SharedPreferences>().setString(
      SharedKey.language.name,
      getAppLanguageCode,
    );
  }
}
