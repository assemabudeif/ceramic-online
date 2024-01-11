import 'package:action_slider/action_slider.dart';
import 'package:ceramic_online/core/global/language/app_strings.dart';
import 'package:ceramic_online/core/global/theme/app_colors_light.dart';
import 'package:ceramic_online/core/global/widgets/custom_app_bar.dart';
import 'package:ceramic_online/core/utilities/app_constance.dart';
import 'package:ceramic_online/core/utilities/assets_data.dart';
import 'package:ceramic_online/core/utilities/font_manger.dart';
import 'package:ceramic_online/features/order/presentation/views/widgets/order_details_qr_code_widget.dart';
import 'package:ceramic_online/features/order/presentation/views/widgets/order_details_summary_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:rive/rive.dart';

import 'widgets/default_product_details_divider_widget.dart';
import 'widgets/order_details_code_widget.dart';
import 'widgets/order_details_products_details_widget.dart';
import 'widgets/order_details_slider_button_widget.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.orderDetails.tr,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding.w,
            vertical: kDefaultPadding.h,
          ),
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Details
              const OrderDetailsProductsDetailsWidget(),
              const DefaultProductDetailsDividerWidget(),

              // Brand Details
              Text(
                AppStrings.brandAddress.tr,
                style: context.textTheme.titleMedium,
              ),
              SizedBox(height: 10.h),

              // Brand Details text
              Padding(
                padding: EdgeInsetsDirectional.only(start: 10.w),
                child: Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                  style: context.textTheme.bodyMedium,
                  maxLines: 10,
                ),
              ),
              const DefaultProductDetailsDividerWidget(),

              // Payment Summary
              Text(
                AppStrings.paymentSummary.tr,
                style: context.textTheme.titleMedium,
              ),
              SizedBox(height: 10.h),
              const OrderDetailsSummaryWidget(),
              const DefaultProductDetailsDividerWidget(),

              // Qr-Code Text
              Text(
                "Qr-Code",
                style: context.textTheme.titleMedium,
              ),
              SizedBox(height: 10.h),

              // Qr-Code Image
              const OrderDetailsQrCodeWidget(code: 'AA45ER845'),
              const DefaultProductDetailsDividerWidget(),

              // Order Code Text
              Text(
                AppStrings.orderCode.tr,
                style: context.textTheme.titleMedium,
              ),
              SizedBox(height: 10.h),
              const OrderDetailsCodeWidget(code: 'AA45ER845'),
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
              SizedBox(height: 25.h),

              // Order Details Slider Button
              const OrderDetailsSliderButtonWidget(),
              SizedBox(height: 15.h),

              // Order Details Slider Animation
              SizedBox(
                height: 40.h,
                child: const RiveAnimation.asset(
                  AssetsData.favouriteAnimation,
                  // fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
              SizedBox(height: 15.h),
              Align(
                alignment: Alignment.center,
                child: Text(
                  AppStrings.swipeRightToApproveOrderToDismissItSwipeLeft.tr,
                  style: context.textTheme.bodyMedium,
                  maxLines: 3,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 15.h),
            ],
          ),
        ),
      ),
    );
  }
}
