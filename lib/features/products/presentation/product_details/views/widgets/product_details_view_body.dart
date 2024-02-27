import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/core/global/language/app_strings.dart';
import '/core/global/theme/app_colors_light.dart';
import '/core/services/services_locator.dart';
import '/core/utilities/app_constance.dart';
import '/features/home/presentation/views/widgets/home_best_sales_list_widget.dart';
import '/features/home/presentation/views/widgets/home_products_for_you_list_widget.dart';
import 'default_product_details_divider.dart';
import 'product_add_to_cart_widget.dart';
import 'product_area_calculation_widget.dart';
import 'product_choice_size_widget.dart';
import 'product_details_header_widget.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.productId});

  final int productId;

  @override
  Widget build(BuildContext context) {
    log("Product Id: $productId", name: "Product Details View Body");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Body of Product  Details
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Product Details
                ProductDetailsHeaderWidget(
                  productId: productId,
                ),
                const DefaultProductDetailsDivider(),

                /// Your Choice of Size
                const ProductChoiceSizeWidget(),

                const DefaultProductDetailsDivider(),

                /// Area Calculation
                const ProductAreaCalculationWidget(),
                const DefaultProductDetailsDivider(),

                /// Often orders with title
                Text(
                  AppStrings.oftenOrdersWith.tr,
                  style: context.textTheme.titleMedium!.copyWith(
                    color: kTextDarkColor,
                  ),
                ),
                SizedBox(height: kDefaultPadding.h),

                /// Often orders with List
                HomeProductsForYouListWidget(
                  cubit: sl(),
                ),
                SizedBox(height: kDefaultPadding.h),
                const DefaultProductDetailsDivider(),

                /// Other Brands title
                Text(
                  AppStrings.otherBrands.tr,
                  style: context.textTheme.titleMedium!.copyWith(
                    color: kTextDarkColor,
                  ),
                ),
                SizedBox(height: kDefaultPadding.h),

                /// Other Brands List
                const HomeBestSalesListWidget(),
                SizedBox(
                  height: 20.h,
                )
              ],
            ),
          ),
        ),

        /// Add To Cart Footer
        const ProductAddToCartWidget(),
      ],
    );
  }
}
