import '../global/theme/app_colors_light.dart';
import 'package:flutter/material.dart';

class AppSnackBars {
  static showSuccessSnackBar({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: kWhiteColor),
        ),
        backgroundColor: kSuccessColor,
        duration: duration,
      ),
    );
  }

  static showErrorSnackBar({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
        ),
        backgroundColor: kErrorColor,
        duration: duration,
      ),
    );
  }
}
