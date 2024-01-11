import 'package:ceramic_online/core/utilities/assets_data.dart';

import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/app_constance.dart';
import '/core/utilities/dummy.dart';
import '/core/utilities/routes_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SingleProductItemWidget extends StatelessWidget {
  const SingleProductItemWidget({
    super.key,
    required this.index,
    this.isCategory = false,
  });
  final int index;
  final bool isCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.productDetailsPath);
      },
      child: Container(
        height: 0.37.sh,
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding.w,
          vertical: kDefaultPadding.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: SvgPicture.asset(
                  isCategory
                      ? AssetsData.product2CeramicSVG
                      : kDummyProducts[index].image,
                  width: 1.sw,
                  fit: BoxFit.cover,
                  // height: 0.3.sw,
                ),
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              kDummyProducts[index].name,
              style: context.textTheme.titleMedium?.copyWith(
                color: kTextDarkColor,
              ),
            ),
            Text(
              kDummyProducts[index].description,
              style: context.textTheme.bodyMedium?.copyWith(
                color: kTextColor,
              ),
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'EGP',
                  style: context.textTheme.headlineMedium?.copyWith(
                    color: kTextDarkColor,
                  ),
                ),
                SizedBox(width: kDefaultPadding.w / 3),
                Text(
                  kDummyProducts[index].price,
                  style: context.textTheme.headlineMedium?.copyWith(
                    color: kTextDarkColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
