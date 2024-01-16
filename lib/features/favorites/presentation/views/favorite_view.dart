import 'package:flutter_dismissible_tile/flutter_dismissible_tile.dart';
import 'package:rive/rive.dart';

import '/core/global/language/app_strings.dart';
import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/app_constance.dart';
import '/core/utilities/assets_data.dart';
import '/core/utilities/dummy.dart';
import '/features/widgets/single_product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'widgets/favorite_dismissible_items_widget.dart';
import 'widgets/favorite_icons_widget.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  double _favoriteIconSize = 30.w;

  double _heartIconSize = 30.w;
  List<ProductModel> kFavoriteProducts = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          /// Dismissible Items to add to favorite list
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding.w / 2),
            child: Stack(
              children: [
                for (int i = 0; i < kDummyProducts.length; i++)
                  Transform.rotate(
                    angle: i == kDummyProducts.length - 1
                        ? 0
                        : i % 2 == 0
                            ? 0.3
                            : -0.1,
                    child: DismissibleTile(
                      onDismissed: (direction) {
                        if (direction == DismissibleTileDirection.leftToRight) {
                          setState(() {
                            kFavoriteProducts.add(kDummyProducts[i]);
                            _changeFavoriteIconSizeWithAnimation();
                          });
                        } else {
                          setState(() {
                            _changeHeartIconSizeWithAnimation();
                          });
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
                        index: i,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 50.h),

          /// Icons Favorite and Heart
          FavoriteIconsWidget(
            favoriteIconSize: _favoriteIconSize,
            heartIconSize: _heartIconSize,
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
          SizedBox(height: 40.h),

          /// Show this widget if user have favorite products
          Visibility(
            visible: kFavoriteProducts.isNotEmpty,
            child: Column(
              children: [
                Text(
                  AppStrings.yourFavorites.tr,
                  style: context.theme.textTheme.titleLarge,
                ),
                SizedBox(height: 10.h),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: kFavoriteProducts.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return const SingleProductItemWidget(
                      index: 1,
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 10.h),
                  // itemCount: products.length,
                )
              ],
            ),
          ),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }

  _changeHeartIconSizeWithAnimation() {
    setState(() {
      _heartIconSize = 35.w;
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _heartIconSize = 40.w;
      });
    });
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _heartIconSize = 45.w;
      });
    });
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _heartIconSize = 40.w;
      });
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _heartIconSize = 35.w;
      });
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _heartIconSize = 30.w;
      });
    });
  }

  _changeFavoriteIconSizeWithAnimation() {
    setState(() {
      _favoriteIconSize = 35.w;
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _favoriteIconSize = 40.w;
      });
    });
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _favoriteIconSize = 45.w;
      });
    });
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _favoriteIconSize = 40.w;
      });
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _favoriteIconSize = 35.w;
      });
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _favoriteIconSize = 30.w;
      });
    });
  }
}
