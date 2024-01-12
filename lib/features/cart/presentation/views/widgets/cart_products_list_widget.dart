import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/assets_data.dart';
import '/core/utilities/dummy.dart';
import '/core/utilities/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CartProductsListWidget extends StatelessWidget {
  const CartProductsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      separatorBuilder: (context, index) => Divider(
        color: kHintColor,
        thickness: 0.5,
        height: 20.h,
      ),
      itemBuilder: (context, index) => Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  kDummyProducts[0].name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  kDummyProducts[0].description,
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 3,
                ),
                SizedBox(height: 10.h),
                StatefulBuilder(builder: (context, setState) {
                  return Row(
                    children: [
                      Expanded(
                        child: Text(
                          'EGP ${kDummyProducts[0].price}',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontWeight: kFontWeightBold,
                                  ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (kDummyProducts[0].quantity > 1) {
                              kDummyProducts[0].quantity--;
                            }
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 5.h,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: const Icon(
                            Icons.remove,
                            color: kWhiteColor,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        kDummyProducts[0].quantity.toString(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(width: 10.w),
                      InkWell(
                        onTap: () {
                          setState(() {
                            kDummyProducts[0].quantity++;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 5.h,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: kWhiteColor,
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
          SvgPicture.asset(
            AssetsData.productCeramicSVG,
          ),
        ],
      ),
    );
  }
}
