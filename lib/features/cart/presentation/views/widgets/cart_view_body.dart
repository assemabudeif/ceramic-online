import '/core/global/language/app_strings.dart';
import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/app_constance.dart';
import '/core/utilities/assets_data.dart';
import '/core/utilities/font_manger.dart';
import '/features/cart/presentation/views/widgets/cart_footer_widget.dart';
import '../../../../widgets/custom_payment_summary_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'cart_products_list_widget.dart';
import 'cart_title_widget.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding.w,
              vertical: kDefaultPadding.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CartTitleWidget(
                  title: AppStrings.basket.tr,
                ),
                SizedBox(height: 20.h),
                const CartProductsListWidget(),
                SizedBox(height: 20.h),
                Text(
                  AppStrings.specialRequest.tr,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 10.h),
                Container(
                  margin: EdgeInsetsDirectional.only(start: 10.w),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(AssetsData.noteIconSVG),
                          SizedBox(width: 10.w),
                          Text(
                            AppStrings.addANote.tr,
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontWeight: kFontWeightBold,
                                    ),
                          ),
                        ],
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: AppStrings.anythingElseWeNeedToKnow.tr,
                          hintStyle: Theme.of(context).textTheme.bodyMedium,
                          border: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 8.h,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                const Divider(
                  color: kHintColor,
                  thickness: 0.5,
                ),
                SizedBox(height: 20.h),
                const CustomPaymentSummaryWidget(),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
        const CartFooterWidget(),
      ],
    );
  }
}
