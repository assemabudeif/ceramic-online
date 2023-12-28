import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/services_locator.dart';
import '../../services/shared_key.dart';

bool get appThemeModeIsDark =>
    sl<SharedPreferences>().getBool(SharedKey.isDarkMode.name) ?? false;

Future<void> changeAppThemeMode() async {
  if (appThemeModeIsDark) {
    await sl<SharedPreferences>().setBool(SharedKey.isDarkMode.name, false);
    Get.changeTheme(ThemeData.light());
    log("isDarkMode $appThemeModeIsDark ");
  } else {
    await sl<SharedPreferences>().setBool(SharedKey.isDarkMode.name, true);
    Get.changeTheme(ThemeData.dark());
    log("isDarkMode $appThemeModeIsDark ");
  }
}
