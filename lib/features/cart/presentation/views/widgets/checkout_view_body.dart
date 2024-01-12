import 'package:ceramic_online/core/global/language/app_strings.dart';
import 'package:ceramic_online/core/global/theme/app_colors_light.dart';
import 'package:ceramic_online/core/utilities/font_manger.dart';
import 'package:ceramic_online/core/utilities/routes_manger.dart';
import 'package:ceramic_online/features/cart/presentation/views/widgets/cart_title_widget.dart';
import 'package:ceramic_online/features/widgets/custom_payment_summary_widget.dart';
import 'package:ceramic_online/features/widgets/custom_qr_code_title_widget.dart';
import 'package:ceramic_online/features/widgets/custom_qr_code_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CartTitleWidget(title: AppStrings.checkout.tr),
          SizedBox(height: 20.h),
          CustomQrCodeWidget(
            code: 'AA45ER845',
            size: 0.6.sw,
          ),
          SizedBox(height: 25.h),
          const CustomQrCodeTitleWidget(
            code: 'AA45ER845',
          ),
          SizedBox(height: 20.h),
          Divider(
            color: context.theme.dividerColor,
            thickness: 0.5,
          ),
          SizedBox(height: 20.h),
          const CustomPaymentSummaryWidget(),
          SizedBox(height: 25.h),
          Text(
            AppStrings.successful.tr,
            style: context.textTheme.titleLarge,
          ),
          Text(
            AppStrings.goToBrandAndScanQrCodeToBuyItems.tr,
            style: context.textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25.h),
          SizedBox(
            width: 0.4.sw,
            child: ElevatedButton(
              onPressed: () {
                Get.offAllNamed(Routes.homeLayoutPath);
              },
              child: Text(
                AppStrings.home.tr,
                style: context.textTheme.bodyMedium!.copyWith(
                  fontWeight: kFontWeightBold,
                  color: kWhiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
