import '/core/services/language/app_translations.dart';
import 'package:get/get.dart';

import '/core/global/theme/theme_data/theme_data_dark.dart';
import '/core/global/theme/theme_data/theme_data_light.dart';
import '/core/utilities/routes_manger.dart';
import '/core/utilities/app_constance.dart';
import 'package:flutter/material.dart';

class CeramicOnlineApp extends StatelessWidget {
  const CeramicOnlineApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: kAppName,
      theme: getThemeDataLight(),
      darkTheme: getThemeDataDark(),
      themeMode: Get.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      getPages: appRoutes,
      translations: AppTranslations(),
      locale: Get.deviceLocale,
      fallbackLocale: kDefaultLocale,
      initialRoute: Routes.splash,
    );
  }
}
