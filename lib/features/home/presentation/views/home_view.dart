import '/core/global/language/app_strings.dart';
import '/features/home/presentation/views/widgets/home_categories_list_widget.dart';
import '/features/home/presentation/views/widgets/home_title_widget.dart';
import 'package:get/get.dart';

import '/core/utilities/app_constance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/home_banner_widget.dart';
import 'widgets/home_best_sales_list_widget.dart';
import 'widgets/home_header_widget.dart';
import 'widgets/home_products_for_you_list_widget.dart';
import 'widgets/home_search_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding.w,
        ),
        child: SafeArea(
          child: Column(
            children: [
              //
              //* Header
              //
              const HomeHeaderWidget(),
              SizedBox(height: 10.h),

              //
              //* Search
              //
              HomeSearchWidget(
                hintText: AppStrings.whatAreYouLookingFor.tr,
                hasFilter: true,
                onTapFilter: () {},
              ),
              SizedBox(height: 10.h),

              //
              //* Banner
              //
              const HomeBannerWidget(),
              SizedBox(height: 10.h),

              //
              //* Categories title
              //
              HomeTitleWidget(
                  title: AppStrings.categories.tr, onPressed: () {}),
              SizedBox(height: 10.h),

              //
              //* Categories
              //
              const HomeCategoriesListWidget(),

              //
              //* Products for you title
              //
              HomeTitleWidget(
                title: AppStrings.productsForYou.tr,
                onPressed: () {},
              ),
              SizedBox(height: 10.h),

              //
              //* Products for you list
              //
              const HomeProductsForYouListWidget(),
              SizedBox(height: 20.h),

              //
              //* Best sales title
              //
              HomeTitleWidget(
                title: AppStrings.bestSales.tr,
                onPressed: () {},
              ),
              SizedBox(height: 10.h),

              //
              //* Best sales list
              //
              const HomeBestSalesListWidget(),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
