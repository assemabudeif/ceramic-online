import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/core/global/language/app_strings.dart';
import '/core/services/services_locator.dart';
import '/core/utilities/app_constance.dart';
import '/features/home/presentation/view_models/home_cubit.dart';
import '/features/home/presentation/views/home_layout_view.dart';
import '/features/home/presentation/views/widgets/home_categories_list_widget.dart';
import '/features/home/presentation/views/widgets/home_title_widget.dart';
import '/features/widgets/custom_search_widget.dart';
import 'widgets/home_banner_widget.dart';
import 'widgets/home_best_sales_list_widget.dart';
import 'widgets/home_header_widget.dart';
import 'widgets/home_products_for_you_list_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _cubit = sl<HomeCubit>();

  @override
  void initState() {
    super.initState();

    _cubit.init();
  }

  @override
  void dispose() {
    _cubit.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: RefreshIndicator(
        onRefresh: () {
          return _cubit.homeRefresh();
        },
        child: GestureDetector(
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
                  /// Header
                  const HomeHeaderWidget(),
                  SizedBox(height: 10.h),

                  /// Search
                  CustomSearchWidget(
                    hintText: AppStrings.whatAreYouLookingFor.tr,
                  ),
                  SizedBox(height: 10.h),

                  /// Banner
                  HomeBannerWidget(cubit: _cubit),
                  SizedBox(height: 10.h),

                  /// Categories title
                  HomeTitleWidget(
                    title: AppStrings.categories.tr,
                    onPressed: () {
                      HomeLayoutView.changeIndex(context: context, index: 1);
                    },
                    haveSeeAll: true,
                  ),
                  SizedBox(height: 10.h),

                  /// Categories
                  HomeCategoriesListWidget(cubit: _cubit),

                  /// Products for you title
                  HomeTitleWidget(title: AppStrings.productsForYou.tr),
                  SizedBox(height: 10.h),

                  /// Products for you list
                  HomeProductsForYouListWidget(cubit: _cubit),
                  SizedBox(height: 20.h),

                  /// Best sales title
                  HomeTitleWidget(title: AppStrings.bestSales.tr),
                  SizedBox(height: 10.h),

                  /// Best sales list
                  const HomeBestSalesListWidget(),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
