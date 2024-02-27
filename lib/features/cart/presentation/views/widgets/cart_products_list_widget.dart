import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/assets_data.dart';
import '/core/utilities/dummy.dart';
import '/core/utilities/font_manger.dart';

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
                      SizedBox(
                        width: 0.25.sw,
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (kDummyProducts[0].quantity > 1) {
                                      kDummyProducts[0].quantity--;
                                    }
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 5.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.remove,
                                    color: kWhiteColor,
                                    size: 18.w,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                kDummyProducts[0].quantity.toString(),
                                style: Theme.of(context).textTheme.bodyMedium,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    kDummyProducts[0].quantity++;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 5.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.add,
                                    color: kWhiteColor,
                                    size: 18.w,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          SvgPicture.asset(
            AssetsData.productCeramicSVG,
            width: 0.3.sw,
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }
}
