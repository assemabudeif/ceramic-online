import '/core/utilities/dummy.dart';
import '/core/utilities/routes_manger.dart';

import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '/core/global/language/app_strings.dart';

class HomeProductsForYouListWidget extends StatefulWidget {
  const HomeProductsForYouListWidget({super.key});

  @override
  State<HomeProductsForYouListWidget> createState() =>
      _HomeProductsForYouListWidgetState();
}

class _HomeProductsForYouListWidgetState
    extends State<HomeProductsForYouListWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.45.sh,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        scrollDirection: Axis.horizontal,
        itemCount: kDummyProducts.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.toNamed(Routes.productDetailsPath);
            },
            child: Container(
              // height: 200.h,
              width: 0.6.sw,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(10.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SvgPicture.asset(
                      kDummyProducts[index].image,
                      width: 0.6.sw,
                    ),
                  ),
                  Text(
                    kDummyProducts[index].name,
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    kDummyProducts[index].description,
                    style: context.textTheme.bodySmall!.copyWith(
                      fontSize: 10.sp,
                    ),
                    maxLines: 3,
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${kDummyProducts[index].price}',
                        style: context.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite,
                          color: kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(height: 5.h),
                  Row(
                    children: [
                      MaterialButton(
                        onPressed: () {},
                        color: kPrimaryColor,
                        minWidth: 0.09.sw,
                        height: 0.04.sh,
                        child: Text(
                          AppStrings.addToCart.tr,
                          style: context.textTheme.bodySmall!.copyWith(
                            color: kWhiteColor,
                            fontWeight: kFontWeightSemiBold,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                if (kDummyProducts[index].quantity > 1) {
                                  setState(() {
                                    kDummyProducts[index].quantity--;
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
                            Text(
                              '${kDummyProducts[index].quantity}',
                              style: context.textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  kDummyProducts[index].quantity++;
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 10.w);
        },
      ),
    );
  }
}
