import '/core/global/language/app_strings.dart';
import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomQrCodeTitleWidget extends StatelessWidget {
  const CustomQrCodeTitleWidget({super.key, required this.code});

  final String code;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.orderCode.tr,
          style: context.textTheme.titleMedium,
        ),
        SizedBox(height: 10.h),
        GestureDetector(
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
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            AppStrings.pressedLongTimesOnCodeToCopy.tr,
            style: context.textTheme.bodySmall!.copyWith(
              color: kPrimaryColor.withOpacity(0.5),
              fontWeight: kFontWeightBold,
            ),
          ),
        ),
      ],
    );
  }
}
