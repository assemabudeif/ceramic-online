import 'package:ceramic_online/core/global/language/app_strings.dart';
import 'package:ceramic_online/core/global/theme/app_colors_light.dart';
import 'package:ceramic_online/core/utilities/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderDetailsCodeWidget extends StatelessWidget {
  const OrderDetailsCodeWidget({super.key, required this.code});

  final String code;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Clipboard.setData(
          const ClipboardData(text: 'AA45ER845'),
        );
        Get.snackbar(
          AppStrings.copied.tr,
          AppStrings.copiedCodeSuccessfully.tr,
          backgroundColor: kSuccessColor,
          colorText: kWhiteColor,
          snackPosition: SnackPosition.BOTTOM,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 15.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: kHintColor,
          ),
        ),
        width: 1.sw,
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        alignment: Alignment.center,
        child: Text(
          code,
          style: context.textTheme.bodyMedium!.copyWith(
            fontWeight: kFontWeightBold,
          ),
        ),
      ),
    );
  }
}
