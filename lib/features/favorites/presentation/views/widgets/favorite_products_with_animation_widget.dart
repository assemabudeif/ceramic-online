import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dismissible_tile/flutter_dismissible_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

import '/core/global/language/app_strings.dart';
import '/core/global/theme/app_colors_light.dart';
import '/core/global/widgets/custom_empty_widget.dart';
import '/core/global/widgets/custom_error_widget.dart';
import '/core/global/widgets/custom_loading_widget.dart';
import '/core/utilities/app_constance.dart';
import '/core/utilities/assets_data.dart';
import '/features/favorites/presentation/view_models/favorite_cubit.dart';
import '/features/favorites/presentation/views/widgets/favorite_icons_widget.dart';
import '/features/widgets/single_product_item_widget.dart';

class FavoriteProductsWithAnimationWidget extends StatelessWidget {
  const FavoriteProductsWithAnimationWidget({
    super.key,
    required this.cubit,
  });
  final FavoriteCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<FavoriteCubit, FavoriteState>(
          bloc: cubit..getProducts(),
          builder: (context, state) {
            if (cubit.allProductsModel == null &&
                cubit.allProductsErrors.isEmpty) {
              return const CustomLoadingWidget(
                isFullScreen: false,
              );
            } else if (cubit.allProductsErrors.isNotEmpty) {
              return CustomErrorWidget(
                height: 200.h,
                message: cubit.allProductsErrors,
                onRetry: () {
                  cubit.allProductsModel = null;
                  cubit.allProductsErrors = '';
                  cubit.getProducts();
                },
              );
            } else if (cubit.allProductsModel!.data.data.isEmpty) {
              return CustomEmptyWidget(
                height: 200.h,
              );
            }
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding.w / 2),
              child: Stack(
                children: [
                  for (int i = 0; i < cubit.products.length; i++)
                    Transform.rotate(
                      angle: i == cubit.products.length - 1
                          ? 0
                          : i % 2 == 0
                              ? 0.3
                              : -0.1,
                      child: DismissibleTile(
                        onDismissed: (direction) {
                          if (direction ==
                              DismissibleTileDirection.leftToRight) {
                            cubit.onDismissLeftToRight(
                              cubit.products[i].id.toString(),
                            );
                          } else {
                            cubit.onDismissRightToLeft(
                              cubit.products[i].id.toString(),
                            );
                          }
                        },
                        ltrDismissedColor: kTransparentColor,
                        rtlDismissedColor: kTransparentColor,
                        rtlBackground: Container(
                          padding: EdgeInsetsDirectional.only(
                            end: kDefaultPadding.w,
                          ),
                          height: 100.h,
                          alignment: AlignmentDirectional.center,
                          color: kTransparentColor,
                          child: Icon(
                            Icons.heart_broken,
                            color: kDarkIconColor,
                            size: 100.r,
                          ),
                        ),
                        ltrBackground: Container(
                          padding: EdgeInsetsDirectional.only(
                            start: kDefaultPadding.w,
                          ),
                          alignment: AlignmentDirectional.center,
                          color: kTransparentColor,
                          child: Icon(
                            Icons.favorite,
                            color: kPrimaryColor,
                            size: 100.r,
                          ),
                        ),
                        key: UniqueKey(),
                        child: SingleProductItemWidget(
                          product: cubit.allProductsModel!.data.data[i],
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),

        SizedBox(height: 50.h),

        /// Icons Favorite and Heart
        BlocBuilder<FavoriteCubit, FavoriteState>(
          bloc: cubit,
          builder: (context, state) {
            return FavoriteIconsWidget(
              favoriteIconSize: cubit.favoriteIconSize,
              heartIconSize: cubit.heartIconSize,
            );
          },
        ),

        /// Hand Animation
        SizedBox(
          width: 0.5.sw,
          height: 0.15.sw,
          child: const RiveAnimation.asset(
            AssetsData.favouriteAnimation,
            fit: BoxFit.fitWidth,
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          AppStrings.swipeRightToAddThisBrand.tr,
          style: context.theme.textTheme.bodyMedium!.copyWith(
            color: kTextDarkColor,
          ),
          textAlign: TextAlign.center,
          maxLines: 3,
        ),
      ],
    );
  }
}
