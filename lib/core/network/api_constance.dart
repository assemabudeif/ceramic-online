import '/core/utilities/app_constance.dart';

class ApiConstance {
  static String baseUrl = "https://ceramic.lineerp.live/";
  static String token = "";

  /// Auth
  static String loginPath() => "$kAppLanguageCode/api/auth/client/login";

  // TODO: Social Login
  static String socialLoginPath() => "$kAppLanguageCode/api/auth/client/social";
  static String registerPath() => "$kAppLanguageCode/api/auth/client/register";

  // TODO: Send SMS
  static String sendSMSPath() => "$kAppLanguageCode/api/auth/client/sms";
  static String logoutPath() => "$kAppLanguageCode/api/auth/client/logout";
  static String getProfileDetailsPath() =>
      "$kAppLanguageCode/api/auth/client/profile";

  // TODO: Update Profile
  static String updateProfileDetailsPath() =>
      "$kAppLanguageCode/api/auth/client/profile";

  // TODO: Reset Password
  static String resetPasswordPath() => "reset/password";

  /// Home
  static String getSlidersPath() => "$kAppLanguageCode/api/sliders";

  // TODO: Get Home Data
  static String getHomePath() => "$kAppLanguageCode/api/home";

  /// Categories
  static String getCategoriesPath() => "$kAppLanguageCode/api/categories";

  /// Products
  static String getProductsPath() => "$kAppLanguageCode/api/products";
  static String showSingleProductPath(int id) =>
      "$kAppLanguageCode/api/products/$id";

  /// Vendors
  // TODO: Get Vendors
  static String getVendorsPath() => "$kAppLanguageCode/api/vendors";

  /// Cart
  // TODO: Get Cart
  static String getCartPath() => "$kAppLanguageCode/api/carts";

  // TODO: Add To Cart
  static String addToCartPath() => "$kAppLanguageCode/api/carts";

  // TODO: Delete Cart
  static String deleteCartPath(String cartId) =>
      "$kAppLanguageCode/api/carts/$cartId";

  // TODO: Delete Cart Item
  static String deleteCartItemPath(String cartId) =>
      "$kAppLanguageCode/api/carts/$cartId";

  // TODO: Single Area Calculation in Cart
  static String areaSingleCalculationPath() =>
      "$kAppLanguageCode/api/area/single/calcu";

  // TODO: Single Multi Calculation in Cart
  static String areaMultiCalculationPath() =>
      "$kAppLanguageCode/api/area/multi/calcu";

  /// Orders
  // TODO: Get Orders
  static String getOrdersPath() => "$kAppLanguageCode/api/orders";

  // TODO: Create new Order
  static String createOrderPath() => "$kAppLanguageCode/api/orders";

  // TODO: Show Order
  static String showOrderPath(String orderId) =>
      "$kAppLanguageCode/api/orders/$orderId";

  // TODO: finish Order
  static String finishOrderPath(String orderId) =>
      "$kAppLanguageCode/api/orders/$orderId";

  /// wishlist
  // TODO: Get Wishlist
  static String getWishlistPath() => "$kAppLanguageCode/api/wishlist";

  // TODO: Add and remove item from Wishlist
  static String addRemoveWishlistPath() => "$kAppLanguageCode/api/wishlist";

  /// support
  // TODO: Get Support
  static String getSupportPath(String supportId) =>
      "$kAppLanguageCode/api/supports/$supportId";

  // TODO: send Message to Support
  static String sendMessageToSupportPath() => "$kAppLanguageCode/api/supports";

  /// Governments
  static String getGovernmentsPath() => "$kAppLanguageCode/api/gouvernments";
  static String getGovernmentsRegionsPath(String governmentId) =>
      "$kAppLanguageCode/api/gouvernments/$governmentId";
}
