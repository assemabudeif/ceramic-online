import '/core/global/language/app_strings.dart';
import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/app_constance.dart';
import '/core/utilities/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DefaultRequiredWidget extends StatelessWidget {
  const DefaultRequiredWidget({super.key, this.text});
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kTextFieldFillColor,
        borderRadius: BorderRadius.circular(25.r),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding.w,
        vertical: kDefaultPadding.h / 2,
      ),
      child: Text(
        text ?? AppStrings.required.tr,
        style: context.textTheme.bodyMedium!.copyWith(
          color: kPrimaryColor,
          fontWeight: kFontWeightBold,
        ),
      ),
    );
  }
}
