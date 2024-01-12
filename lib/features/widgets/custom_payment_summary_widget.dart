import '/core/global/language/app_strings.dart';
import '/core/utilities/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomPaymentSummaryWidget extends StatelessWidget {
  const CustomPaymentSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.paymentSummary.tr,
          style: context.textTheme.titleMedium,
        ),
        SizedBox(height: 10.h),
        ...[
          'Ceramic Black',
          'Tap Black',
        ].map(
          (e) {
            return Container(
              padding: EdgeInsetsDirectional.only(start: 10.w),
              margin: EdgeInsetsDirectional.only(bottom: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    e,
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontWeight: kFontWeightBold,
                    ),
                  ),
                  Text(
                    'EGP 20.00',
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontWeight: kFontWeightBold,
                    ),
                  ),
                ],
              ),
            );
          },
        ).followedBy(
          [
            Container(
              padding: EdgeInsetsDirectional.only(start: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.totalAmount.tr,
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontWeight: kFontWeightBold,
                    ),
                  ),
                  Text(
                    'EGP 40.00',
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontWeight: kFontWeightBold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
