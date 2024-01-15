import '/core/global/language/app_strings.dart';
import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/app_constance.dart';
import '/core/utilities/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

showAddToCartDialog({
  bool isInHome = false,
}) {
  Get.defaultDialog(
    title: AppStrings.addToCart.tr,
    titleStyle: Get.textTheme.titleLarge,
    content: Text(
      AppStrings.addedToCartSuccessfully.tr,
      style: Get.textTheme.bodyLarge!.copyWith(
        fontWeight: kFontWeightBold,
      ),
    ),
    contentPadding: EdgeInsets.symmetric(
      horizontal: kDefaultPadding.w * 2,
      vertical: kDefaultPadding.h,
    ),
    textConfirm: AppStrings.goToBack.tr,
    confirmTextColor: kWhiteColor,
    onConfirm: () {
      Get.back();
      isInHome ? null : Get.back();
    },
  );
}
