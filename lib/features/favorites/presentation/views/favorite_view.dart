import '/core/global/language/language_manger.dart';
import '/core/global/language/app_strings.dart';
import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/app_constance.dart';
import '/core/utilities/assets_data.dart';
import '/core/utilities/dummy.dart';
import '/features/widgets/single_product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dismissible_tile/flutter_dismissible_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  double favoriteIconSize = 30.w;

  double heartIconSize = 30.w;

  List<ProductModel> products = [];
  _changeHeartIconSizeWithAnimation(double progress) {
    setState(() {
      heartIconSize = 35.w;
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        heartIconSize = 40.w;
      });
    });
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        heartIconSize = 45.w;
      });
    });
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        heartIconSize = 40.w;
      });
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        heartIconSize = 35.w;
      });
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        heartIconSize = 30.w;
      });
    });
  }

  _changeFavoriteIconSizeWithAnimation(
    double progress,
  ) {
    setState(() {
      favoriteIconSize = 35.w;
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        favoriteIconSize = 40.w;
      });
    });
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        favoriteIconSize = 45.w;
      });
    });
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        favoriteIconSize = 40.w;
      });
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        favoriteIconSize = 35.w;
      });
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        favoriteIconSize = 30.w;
      });
    });
  }

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
                            products.add(kDummyProducts[i]);
                            _changeFavoriteIconSizeWithAnimation(0);
                          });
                        } else {
                          setState(() {
                            _changeHeartIconSizeWithAnimation(0);
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

          /// Icons In English language
          Visibility(
            visible: getAppLanguageCode == 'en',
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding.w,
              ),
              height: 0.1.sw,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.heart_broken,
                    color: kHintColor,
                    size: heartIconSize,
                    // size: 30.w,
                  ),
                  Icon(
                    Icons.favorite,
                    color: kPrimaryColor,
                    size: favoriteIconSize,
                  ),
                ],
              ),
            ),
          ),

          /// Icons In Arabic language
          Visibility(
            visible: getAppLanguageCode == 'ar',
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding.w,
              ),
              height: 0.1.sw,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.favorite,
                    color: kPrimaryColor,
                    size: favoriteIconSize,
                  ),
                  Icon(
                    Icons.heart_broken,
                    color: kHintColor,
                    size: heartIconSize,
                    // size: 30.w,
                  ),
                ],
              ),
            ),
          ),
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
            visible: products.isNotEmpty,
            child: Column(
              children: [
                Text(
                  AppStrings.yourFavorites.tr,
                  style: context.theme.textTheme.titleLarge,
                ),
                SizedBox(height: 10.h),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: products.length,
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
}
