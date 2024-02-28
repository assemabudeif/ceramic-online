import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '/core/global/language/app_strings.dart';
import '/core/global/theme/app_colors_light.dart';
import '/core/services/services_locator.dart';
import '/core/utilities/app_constance.dart';
import '/core/utilities/assets_data.dart';
import '/features/favorites/presentation/view_models/favorite_cubit.dart';
import 'widgets/favorite_items_widget.dart';
import 'widgets/favorite_products_with_animation_widget.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = sl<FavoriteCubit>();

    return BlocProvider(
      create: (context) => cubit,
      child: RefreshIndicator(
        onRefresh: () async {
          return cubit.favoriteRefresh();
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding.w,
          ),
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppStrings.favorites.tr,
                style: context.theme.textTheme.titleLarge,
              ),
              SizedBox(height: 10.h),

              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  AppStrings.addToFavorites.tr,
                  style: context.theme.textTheme.titleMedium!.copyWith(
                    color: kPrimaryColor,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      AppStrings.saveYourFavoritesPlaces.tr,
                      style: context.theme.textTheme.bodyMedium!.copyWith(
                        color: kTextDarkColor,
                      ),
                      maxLines: 3,
                    ),
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.only(bottom: 20.h),
                    child: SvgPicture.asset(AssetsData.favoriteIconSVG),
                  ),
                ],
              ),
              SizedBox(height: 40.h),

              /// Dismissible Items to add to favorite list
              FavoriteProductsWithAnimationWidget(cubit: cubit),
              SizedBox(height: 40.h),

              /// Favorite products Items
              FavoriteItemsWidget(
                cubit: cubit,
              ),

              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }
}
