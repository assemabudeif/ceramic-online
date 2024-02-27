import 'package:ceramic_online/core/global/widgets/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/core/data/models/product_data_model.dart';
import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/app_constance.dart';
import '/core/utilities/routes_manger.dart';

class SingleProductItemWidget extends StatelessWidget {
  const SingleProductItemWidget({
    super.key,
    required this.product,
  });

  final ProductDataModel product;

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
              child: CustomNetworkImage(
                imageUrl: product.image,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              product.name,
              style: context.textTheme.titleMedium?.copyWith(
                color: kTextDarkColor,
              ),
            ),
            Text(
              product.description,
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
                  product.price.toString(),
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
