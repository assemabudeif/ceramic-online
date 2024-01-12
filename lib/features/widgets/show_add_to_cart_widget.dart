import 'package:ceramic_online/core/global/language/app_strings.dart';
import 'package:ceramic_online/core/global/theme/app_colors_light.dart';
import 'package:ceramic_online/core/utilities/app_constance.dart';
import 'package:ceramic_online/core/utilities/font_manger.dart';
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
