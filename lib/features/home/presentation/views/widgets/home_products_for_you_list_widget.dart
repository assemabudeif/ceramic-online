import 'package:ceramic_online/core/global/widgets/custom_empty_widget.dart';
import 'package:ceramic_online/core/global/widgets/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/core/data/models/product_data_model.dart';
import '/core/global/language/app_strings.dart';
import '/core/global/theme/app_colors_light.dart';
import '/core/global/widgets/custom_error_widget.dart';
import '/core/global/widgets/custom_loading_widget.dart';
import '/core/utilities/font_manger.dart';
import '/core/utilities/routes_manger.dart';
import '/features/home/presentation/view_models/home_cubit.dart';
import '/features/widgets/show_add_to_cart_widget.dart';

class HomeProductsForYouListWidget extends StatelessWidget {
  const HomeProductsForYouListWidget({super.key, required this.cubit});

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.45.sh,
      child: BlocBuilder<HomeCubit, HomeState>(
        bloc: cubit..getHomeProducts(),
        builder: (context, state) {
          if (cubit.productsModel == null && cubit.productsError.isEmpty) {
            return const CustomLoadingWidget();
          } else if (cubit.productsError.isNotEmpty) {
            return CustomErrorWidget(
              message: cubit.productsError,
              height: 0.2.sh,
              onRetry: () {
                cubit.productsModel = null;
                cubit.productsError = '';

                cubit.getHomeProducts();
              },
            );
          } else if (cubit.productsModel?.data.data.isEmpty ?? false) {
            return CustomEmptyWidget(
              height: 0.2.sh,
            );
          }
          return ListView.separated(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            scrollDirection: Axis.horizontal,
            itemCount: cubit.productsModel!.data.data.length,
            itemBuilder: (context, index) {
              return _buildItem(
                context: context,
                product: cubit.productsModel!.data.data[index],
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 10.w);
            },
          );
        },
      ),
    );
  }

  InkWell _buildItem({
    required ProductDataModel product,
    required BuildContext context,
  }) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          Routes.productDetailsPath,
          arguments: product.id,
        );
      },
      child: Container(
        width: 0.6.sw,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: kWhiteColor,
        ),
        padding: EdgeInsets.all(10.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CustomNetworkImage(
                imageUrl: product.image,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              product.name,
              style: context.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              product.description,
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
                  '\$${product.price}',
                  style: context.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                BlocBuilder<HomeCubit, HomeState>(
                  bloc: cubit,
                  builder: (context, state) {
                    return IconButton(
                      onPressed: () {
                        cubit.addRemoveFavorite(product.id.toString());
                      },
                      icon: Icon(
                        product.favorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: kPrimaryColor,
                        size: 20.w,
                      ),
                    );
                  },
                ),
              ],
            ),
            // SizedBox(height: 5.h),
            Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      showAddToCartDialog(
                        isInHome: true,
                      );
                    },
                    color: kPrimaryColor,
                    height: 0.04.sh,
                    padding: EdgeInsets.zero,
                    child: Text(
                      AppStrings.addToCart.tr,
                      style: context.textTheme.bodySmall!.copyWith(
                        color: kWhiteColor,
                        fontWeight: kFontWeightSemiBold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            if (product.quantity > 1) {
                              cubit.changeProductQuantity(
                                quantity: --product.quantity,
                                id: product.id.toString(),
                              );
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 4.w,
                              vertical: 2.h,
                            ),
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
                      ),
                      Expanded(
                        child: Text(
                          '${product.quantity}',
                          style: context.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            cubit.changeProductQuantity(
                              quantity: ++product.quantity,
                              id: product.id.toString(),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            // width: 0.09.sw,
                            padding: EdgeInsets.symmetric(
                              horizontal: 4.w,
                              vertical: 2.h,
                            ),
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
  }
}
