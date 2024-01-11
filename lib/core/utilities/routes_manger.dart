import 'dart:developer';

import 'package:ceramic_online/features/order/presentation/views/order_details_view.dart';

import '/features/chat_with_support/presentation/view/chat_with_support_view.dart';

import '/features/categories/presentation/views/categories_view.dart';
import '/features/categories/presentation/views/category_data_view.dart';
import '/features/product_details/presentation/views/product_details_view.dart';

import '/features/location/presentation/views/location_details_view.dart';

import '../../features/auth/presentation/views/auth_sign_phone_number_view.dart';
import '../../features/auth/presentation/views/reset_password_view.dart';
import '../../features/home/presentation/views/home_layout_view.dart';
import '../../features/location/presentation/views/location_view.dart';
import '/features/auth/presentation/views/auth_otp_view.dart';

import '/core/global/language/app_strings.dart';

import '/features/auth/presentation/views/signup_view.dart';
import '/features/auth/presentation/views/login_view.dart';
import '/features/splash/presentation/views/splash_view.dart';
import 'package:get/get.dart';

/// Routes names
class Routes {
  // Main Routes
  static const String splashPath = '/';
  static const String homePath = '/home';
  static const String homeLayoutPath = '/homeLayout';

  // Auth Routes
  static const String loginPath = '/login';
  static const String signUpPath = '/signUp';
  static const String otpPath = '/otp';
  static const String phoneSignPath = '/phoneSign';
  static const String resetPasswordPath = '/resetPassword';

  // Location Routes
  static const String locationPath = '/location';
  static const String locationDetailsPath = '/locationDetails';

  // Categories Routes
  static const String categoriesPath = '/categories';
  static const String categoryDataPath = '/categoryData';

  // Product Routes
  static const String productDetailsPath = '/productDetails';

  // Chat with support Routes
  static const String chatWithSupportPath = '/chatWithSupport';

  // Order Details Routes
  static const String orderDetailsPath = '/orderDetails';
}

/// App Routes
List<GetPage<dynamic>> get appRoutes => [
      // Splash Screen
      GetPage(
        name: Routes.splashPath,
        page: () => const SplashView(),
      ),

      // Main Screens
      GetPage(
        name: Routes.homeLayoutPath,
        page: () => const HomeLayoutView(),
      ),

      // Auth Screens
      GetPage(
        name: Routes.loginPath,
        page: () => const LoginView(),
      ),
      GetPage(
        name: Routes.signUpPath,
        page: () => const SignUpView(),
      ),
      GetPage(
        name: Routes.otpPath,
        page: () => AuthOtpView(
          isForgetPassword: Get.arguments ?? false,
        ),
      ),
      GetPage(
        name: Routes.phoneSignPath,
        page: () => AuthSignPhoneNumberView(
          isForgetPassword: Get.arguments ?? false,
        ),
      ),
      GetPage(
        name: Routes.resetPasswordPath,
        page: () => const ResetPasswordView(),
      ),

      // Location Screens
      GetPage(
        name: Routes.locationPath,
        page: () => const LocationView(),
      ),
      GetPage(
        name: Routes.locationDetailsPath,
        page: () => const LocationDetailsView(),
      ),

      // Categories Screens
      GetPage(
        name: Routes.categoriesPath,
        page: () => const CategoriesView(),
      ),
      GetPage(
        name: Routes.categoryDataPath,
        page: () => const CategoryDataView(),
      ),

      // Product Details Screens
      GetPage(
        name: Routes.productDetailsPath,
        page: () => const ProductDetailsView(),
      ),

      // Chat with Support
      GetPage(
        name: Routes.chatWithSupportPath,
        page: () => const ChatWithSupportView(),
      ),

      // Order Details
      GetPage(
        name: Routes.orderDetailsPath,
        page: () => const OrderDetailsView(),
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
