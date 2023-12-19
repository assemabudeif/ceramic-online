import 'dart:developer';

import 'package:ceramic_online/core/utilities/app_strings.dart';

import '/features/auth/presentation/views/login_view.dart';
import '/features/splash/presentation/views/splash_view.dart';
import 'package:get/get.dart';

import 'app_constance.dart';

/// Routes names
class Routes {
  static const String splash = '/';
  static const String home = '/home';
  static const String login = '/login';
}

/// App Routes
List<GetPage<dynamic>> get appRoutes => [
      GetPage(
        name: Routes.splash,
        page: () => const SplashView(),
        transition: kDefaultRouteTransition,
        transitionDuration: kDefaultTransitionTime,
      ),
      GetPage(
        name: Routes.login,
        page: () => const LoginView(),
        transition: kDefaultRouteTransition,
        transitionDuration: kDefaultTransitionTime,
      ),
    ];

/// Middleware to log the page name
class MyMiddleware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    log(page?.name.toString() ?? AppStrings.invalidPageName.tr);
    return super.onPageCalled(page);
  }
}
