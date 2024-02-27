import 'package:ceramic_online/core/global/theme/app_colors_light.dart';
import 'package:ceramic_online/core/utilities/app_constance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dismissible_tile/flutter_dismissible_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/core/global/language/app_strings.dart';
import '/core/global/widgets/custom_empty_widget.dart';
import '/core/global/widgets/custom_error_widget.dart';
import '/core/global/widgets/custom_loading_widget.dart';
import '/features/favorites/presentation/view_models/favorite_cubit.dart';
import '/features/widgets/single_product_item_widget.dart';

class FavoriteItemsWidget extends StatefulWidget {
  const FavoriteItemsWidget({super.key, required this.cubit});

  final FavoriteCubit cubit;

  @override
  State<FavoriteItemsWidget> createState() => _FavoriteItemsWidgetState();
}

class _FavoriteItemsWidgetState extends State<FavoriteItemsWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      bloc: widget.cubit..getFavorites(),
      builder: (context, state) {
        if (widget.cubit.favoriteModel == null &&
            widget.cubit.favoriteErrors.isEmpty) {
          return const CustomLoadingWidget(
            isFullScreen: false,
          );
        } else if (widget.cubit.favoriteErrors.isNotEmpty) {
          return CustomErrorWidget(
            height: 200.h,
            message: widget.cubit.favoriteErrors,
            onRetry: () {
              widget.cubit.getFavorites();
            },
          );
        } else if (widget.cubit.favoriteModel?.data.isEmpty ?? false) {
          return CustomEmptyWidget(
            height: 200.h,
          );
        }
        return Column(
          children: [
            Text(
              AppStrings.yourFavorites.tr,
              style: context.theme.textTheme.titleLarge,
            ),
            SizedBox(height: 10.h),
            ListView.separated(
              shrinkWrap: true,
              itemCount: widget.cubit.favoriteModel?.data.length ?? 0,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return DismissibleTile(
                  key: UniqueKey(),
                  ltrDismissedColor: kTransparentColor,
                  rtlDismissedColor: kTransparentColor,
                  rtlBackground: Container(
                    padding: EdgeInsetsDirectional.only(
                      end: kDefaultPadding.w,
                    ),
                    height: 100.h,
                    alignment: Alignment.centerRight,
                    color: kTransparentColor,
                    child: Icon(
                      Icons.delete,
                      color: kErrorColor,
                      size: 50.r,
                    ),
                  ),
                  ltrBackground: Container(
                    padding: EdgeInsetsDirectional.only(
                      start: kDefaultPadding.w,
                    ),
                    alignment: Alignment.centerLeft,
                    color: kTransparentColor,
                    child: Icon(
                      Icons.delete,
                      color: kErrorColor,
                      size: 50.r,
                    ),
                  ),
                  onDismissed: (direction) {
                    widget.cubit.addRemoveFavorite(
                      widget.cubit.favoriteModel!.data[index].id.toString(),
                    );
                  },
                  child: SingleProductItemWidget(
                    product: widget.cubit.favoriteModel!.data[index],
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 10.h),
            )
          ],
        );
      },
    );
  }
}
