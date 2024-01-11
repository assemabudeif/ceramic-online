import 'package:ceramic_online/core/global/language/app_strings.dart';
import 'package:ceramic_online/core/utilities/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderDetailsSummaryWidget extends StatelessWidget {
  const OrderDetailsSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
