import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/core/global/theme/theme_data/theme_data_dark.dart';
import '/core/global/theme/theme_data/theme_data_light.dart';
import '/core/utilities/app_constance.dart';
import '/core/utilities/routes_manger.dart';
import 'global/language/app_translations.dart';
import 'global/language/language_manger.dart';
import 'global/theme/theme_manger.dart';
import 'services/app_prefs.dart';
import 'services/services_locator.dart';

class CeramicOnlineApp extends StatefulWidget {
  const CeramicOnlineApp({
    super.key,
  });

  @override
  State<CeramicOnlineApp> createState() => _CeramicOnlineAppState();
}

class _CeramicOnlineAppState extends State<CeramicOnlineApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: sl<AppPreferences>().init(),
      builder: (context, snapshot) {
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
      },
    );
  }
}
