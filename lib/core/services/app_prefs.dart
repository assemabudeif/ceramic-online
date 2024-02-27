import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import '/core/network/api_constance.dart';
import '/core/utilities/app_constance.dart';
import 'services_locator.dart';

enum SharedKey {
  token,
  language,
  isDarkMode,
}

class AppPreferences {
  final _sharedPreferences = sl<SharedPreferences>();
  Future<void> init() async {
    kAppLanguageCode = getAppLanguageCode();
    ApiConstance.token = getToken();

    await Future.delayed(const Duration(seconds: 1), () {
      log(ApiConstance.token, name: 'Token');
      log(kAppLanguageCode, name: 'Language Code');
    });
  }

  /// Save the token to the shared preferences
  Future<void> setToken(String token) async {
    await _sharedPreferences.setString(SharedKey.token.toString(), token);
  }

  /// Get the token from the shared preferences
  String getToken() {
    return _sharedPreferences.getString(SharedKey.token.toString()) ?? '';
  }

  /// Remove the token from the shared preferences
  Future<void> removeToken() async {
    await _sharedPreferences.remove(SharedKey.token.toString());
  }

  /// Save the token to the shared preferences
  Future<void> setAppLanguageCode(String languageCode) async {
    await _sharedPreferences.setString(
        SharedKey.language.toString(), languageCode);
  }

  /// Get the token from the shared preferences
  String getAppLanguageCode() {
    return _sharedPreferences.getString(SharedKey.language.toString()) ?? 'en';
  }

  /// Remove the token from the shared preferences
  Future<void> removeLanguageCode() async {
    await _sharedPreferences.remove(SharedKey.language.toString());
  }

  /// Clear all the shared preferences
  Future<void> clear() async {
    await _sharedPreferences.clear();
  }
}
