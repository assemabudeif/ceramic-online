import 'package:flutter/services.dart';

import '/core/global/language/app_strings.dart';
import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/app_constance.dart';
import '/core/utilities/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'default_required_widget.dart';

class ProductAreaCalculationWidget extends StatelessWidget {
  const ProductAreaCalculationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.areaCalculation.tr,
              style: context.textTheme.titleMedium!.copyWith(
                color: kTextDarkColor,
              ),
            ),
            const DefaultRequiredWidget(),
          ],
        ),
        SizedBox(height: kDefaultPadding.h / 3),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  AppStrings.height.tr,
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: kTextDarkColor,
                    fontWeight: kFontWeightSemiBold,
                  ),
                ),
                SizedBox(width: kDefaultPadding.w / 3),
                Container(
                  width: 0.2.sw,
                  height: 0.05.sh,
                  decoration: BoxDecoration(
                    color: kTextFieldFillColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding.w / 2,
                  ),
                  alignment: Alignment.center,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      // accept only digits and dots
                      FilteringTextInputFormatter.allow(
                        RegExp(r'[0-9.]'),
                      ),
                    ],
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: kTextDarkColor,
                      fontWeight: kFontWeightSemiBold,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '........M',
                      hintStyle: context.textTheme.bodyMedium!.copyWith(
                        color: kTextDarkColor,
                        fontWeight: kFontWeightSemiBold,
                      ),
                      contentPadding: EdgeInsets.zero,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  AppStrings.width.tr,
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: kTextDarkColor,
                    fontWeight: kFontWeightSemiBold,
                  ),
                ),
                SizedBox(width: kDefaultPadding.w / 3),
                Container(
                  width: 0.2.sw,
                  height: 0.05.sh,
                  decoration: BoxDecoration(
                    color: kTextFieldFillColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding.w / 2,
                  ),
                  alignment: Alignment.center,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      // accept only digits and dots
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                    ],
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: kTextDarkColor,
                      fontWeight: kFontWeightSemiBold,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '........M',
                      hintStyle: context.textTheme.bodyMedium!.copyWith(
                        color: kTextDarkColor,
                        fontWeight: kFontWeightSemiBold,
                      ),
                      contentPadding: EdgeInsets.zero,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: kDefaultPadding.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.piecesYouNeed.tr,
              style: context.textTheme.bodySmall!.copyWith(
                color: kTextDarkColor,
                fontWeight: kFontWeightBold,
              ),
            ),
            DefaultRequiredWidget(
              text: '30 ${AppStrings.piece.tr}',
            ),
          ],
        ),
        SizedBox(height: kDefaultPadding.h / 2),
      ],
    );
  }
}
