import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/core/global/language/language_manger.dart';
import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/app_constance.dart';

class FavoriteIconsWidget extends StatelessWidget {
  const FavoriteIconsWidget({
    super.key,
    required this.favoriteIconSize,
    required this.heartIconSize,
  });

  final double favoriteIconSize;
  final double heartIconSize;

  @override
  Widget build(BuildContext context) {
    return getAppLanguageCode == 'en'
        ? Container(
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
          )
        : Container(
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
          );
  }
}
