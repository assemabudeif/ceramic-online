import '/core/utilities/assets_data.dart';

import '/core/global/language/app_strings.dart';
import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/app_constance.dart';
import '/core/utilities/dummy.dart';
import '/core/utilities/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProductDetailsHeaderWidget extends StatefulWidget {
  const ProductDetailsHeaderWidget({super.key});

  @override
  State<ProductDetailsHeaderWidget> createState() =>
      _ProductDetailsHeaderWidgetState();
}

class _ProductDetailsHeaderWidgetState
    extends State<ProductDetailsHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          kDummyProducts[0].image,
          width: 1.sw,
          // height: 0.3.sh,
          fit: BoxFit.cover,
        ),
        Text(
          kDummyProducts[0].name,
          style: context.textTheme.titleMedium!.copyWith(
            fontWeight: kFontWeightBold,
          ),
        ),
        Text(
          kDummyProducts[0].description,
          style: context.textTheme.bodyMedium!.copyWith(
            color: kHintColor,
          ),
          maxLines: 10,
        ),
        const SizedBox(height: kDefaultPadding),
        Text(
          AppStrings.priceOnSelection.tr,
          style: context.textTheme.bodyLarge!.copyWith(
            color: kPrimaryColor,
            fontWeight: kFontWeightBold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'EGP ${kDummyProducts[0].price}',
              style: context.textTheme.bodyMedium!.copyWith(
                color: kPrimaryColor,
                fontWeight: kFontWeightBold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    if (kDummyProducts[0].quantity > 1) {
                      setState(() {
                        kDummyProducts[0].quantity--;
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    width: 0.09.sw,
                    padding: EdgeInsets.all(5.r),
                    alignment: Alignment.center,
                    child: Text(
                      '-',
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: kWhiteColor,
                        fontWeight: kFontWeightBlack,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding.w,
                  ),
                  child: Text(
                    '${kDummyProducts[0].quantity}',
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      kDummyProducts[0].quantity++;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    width: 0.09.sw,
                    padding: EdgeInsets.all(5.r),
                    alignment: Alignment.center,
                    child: Text(
                      '+',
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: kWhiteColor,
                        fontWeight: kFontWeightBlack,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
