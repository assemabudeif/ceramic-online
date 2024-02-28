import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/core/data/models/product_data_model.dart';
import '/core/global/language/app_strings.dart';
import '/core/utilities/app_constance.dart';
import '/core/utilities/dummy.dart';
import '/core/utilities/font_manger.dart';
import '/features/categories/data/models/categories_model.dart';
import '/features/widgets/custom_search_widget.dart';
import '/features/widgets/single_product_item_widget.dart';

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
              return SingleProductItemWidget(
                product: ProductDataModel(
                  id: 1,
                  name: 'Product Name',
                  description: 'Product Description',
                  image:
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/330px-Image_created_with_a_mobile_phone.png',
                  price: 22.00,
                  categoryId: 1,
                  userId: 1,
                  createdAt: '',
                  updatedAt: '',
                  type: 'null',
                  size: 'null',
                  vendorId: 'null',
                  favorite: false,
                  category: const CategoryModel(
                    id: 1,
                    createdAt: 'createdAt',
                    updatedAt: 'updatedAt',
                    name: 'name',
                    translations: [],
                  ),
                ),
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
