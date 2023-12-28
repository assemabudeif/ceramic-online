import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'global/language/language_manger.dart';

import 'global/language/app_translations.dart';
import 'package:get/get.dart';

import '/core/global/theme/theme_data/theme_data_dark.dart';
import '/core/global/theme/theme_data/theme_data_light.dart';
import '/core/utilities/routes_manger.dart';
import '/core/utilities/app_constance.dart';
import 'package:flutter/material.dart';

import 'global/theme/theme_manger.dart';

class CeramicOnlineApp extends StatelessWidget {
  const CeramicOnlineApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: kAppName,
          debugShowCheckedModeBanner: false,
          theme: getThemeDataLight,
          darkTheme: getThemeDataDark,
          themeMode: appThemeModeIsDark ? ThemeMode.dark : ThemeMode.light,
          getPages: appRoutes,
          translations: AppTranslations(),
          locale: Locale(getAppLanguageCode),
          fallbackLocale: kDefaultLocale,
          initialRoute: Routes.splashPath,
          defaultTransition: kDefaultRouteTransition,
          transitionDuration: kDefaultTransitionTime,
        );
      },
    );
  }
}
