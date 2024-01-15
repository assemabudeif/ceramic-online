import '/features/widgets/show_add_to_cart_widget.dart';

import '/core/global/language/app_strings.dart';
import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/app_constance.dart';
import '/core/utilities/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductAddToCartWidget extends StatelessWidget {
  const ProductAddToCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhiteColor,
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding.w,
        vertical: kDefaultPadding.h,
      ),
      child: MaterialButton(
        onPressed: () {
          showAddToCartDialog();
          // Get.offAllNamed(Routes.homeLayoutPath);
        },
        color: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        minWidth: 1.sw,
        height: 50.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.addToCart.tr,
              style: context.textTheme.bodyLarge!.copyWith(
                color: kWhiteColor,
              ),
            ),
            Text(
              AppStrings.priceOnSelection.tr,
              style: context.textTheme.bodySmall!.copyWith(
                color: kWhiteColor,
                fontWeight: kFontWeightSemiBold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
