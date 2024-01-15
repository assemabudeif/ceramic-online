import '/core/global/language/app_strings.dart';

import '../../../../widgets/custom_search_widget.dart';
import '/features/widgets/single_product_item_widget.dart';

import '/core/utilities/app_constance.dart';
import '/core/utilities/dummy.dart';
import '/core/utilities/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoryDataViewBody extends StatelessWidget {
  const CategoryDataViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Shop',
            style: context.textTheme.titleLarge!.copyWith(
              fontWeight: kFontWeightBold,
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding.w),
            child: CustomSearchWidget(
              hintText: AppStrings.whatAreYouLookingFor.tr,
              hasFilter: true,
              onTapFilter: () {},
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding.w,
              vertical: kDefaultPadding.h,
            ),
            itemBuilder: (context, index) {
              return const SingleProductItemWidget(
                index: 0,
                isCategory: true,
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              height: kDefaultPadding.h,
            ),
            itemCount: kDummyProducts.length,
          ),
        ],
      ),
    );
  }
}
