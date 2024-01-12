import '/core/global/language/app_strings.dart';
import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/app_constance.dart';
import '/core/utilities/font_manger.dart';
import '/core/utilities/routes_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CartFooterWidget extends StatelessWidget {
  const CartFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhiteColor,
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding.w,
        vertical: kDefaultPadding.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MaterialButton(
            onPressed: () {
              Get.offAllNamed(Routes.homeLayoutPath);
            },
            color: kWhiteColor,
            minWidth: 0.4.sw,
            height: 0.06.sh,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.r),
              side: BorderSide(
                color: kPrimaryColor,
              ),
            ),
            child: Text(
              AppStrings.addItems.tr,
              style: context.textTheme.bodyMedium!.copyWith(
                color: kPrimaryColor,
                fontWeight: kFontWeightBold,
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              Get.toNamed(Routes.checkoutPath);
            },
            color: kPrimaryColor,
            minWidth: 0.4.sw,
            height: 0.06.sh,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Text(
              AppStrings.checkout.tr,
              style: context.textTheme.bodyMedium!.copyWith(
                color: kWhiteColor,
                fontWeight: kFontWeightBold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
