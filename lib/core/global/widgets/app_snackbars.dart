import 'package:get/get.dart';

import '/core/global/theme/app_colors_light.dart';

class AppSnackBars {
  static showSuccessSnackBar({
    required String message,
    required String title,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: kSuccessColor,
      colorText: kWhiteColor,
    );
  }

  static showErrorSnackBar({
    required String message,
    required String title,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: kErrorColor,
      colorText: kWhiteColor,
    );
  }
}
