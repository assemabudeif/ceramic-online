import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';

import '../../services/app_prefs.dart';
import '/core/services/services_locator.dart';
import '/core/utilities/app_constance.dart';

enum Language { en, ar }

final _appPrefs = sl<AppPreferences>();

String get getAppLanguageCode => _appPrefs.getAppLanguageCode();

Future<void> changeAppLanguage(BuildContext context) async {
  if (_appPrefs.getAppLanguageCode() == 'en') {
    Get.updateLocale(const Locale('ar'));
    kAppLanguageCode = 'ar';
    _appPrefs.setAppLanguageCode('ar');
  } else {
    Get.updateLocale(const Locale('en'));
    kAppLanguageCode = 'en';
    _appPrefs.setAppLanguageCode('en');
  }
  Phoenix.rebirth(context); // Restarting app
  Get.reset(); // res
}

Future<void> firstTimeForLanguage() async {
  if (_appPrefs.getAppLanguageCode() == '') {
    await _appPrefs.setAppLanguageCode(
      Get.deviceLocale?.languageCode ?? 'en',
    );
  }
}
