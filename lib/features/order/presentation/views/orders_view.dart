import 'dart:developer';

import 'package:ceramic_online/core/global/language/app_strings.dart';
import 'package:ceramic_online/core/global/theme/app_colors_light.dart';
import 'package:ceramic_online/core/utilities/app_constance.dart';
import 'package:ceramic_online/core/utilities/assets_data.dart';
import 'package:ceramic_online/core/utilities/font_manger.dart';
import 'package:ceramic_online/core/utilities/routes_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppStrings.yourOrders.tr,
            style: context.textTheme.titleLarge,
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding.w / 2,
                vertical: kDefaultPadding.h / 2,
              ),
              itemCount: 20,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      AssetsData.productCeramicSVG,
                    ),
                    SizedBox(width: 20.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                            style: context.textTheme.bodyMedium,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '06 November 2023 14:55',
                            style: context.textTheme.bodySmall,
                          ),
                          Text(
                            'Order ID: 1340888676',
                            style: context.textTheme.bodySmall,
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildOrderCustomButton(
                                context: context,
                                icon: FontAwesomeIcons.arrowsRotate,
                                title: AppStrings.reOrder.tr,
                                onTap: () {
                                  Get.toNamed(Routes.productDetailsPath);
                                },
                              ),
                              _buildOrderCustomButton(
                                context: context,
                                icon: FontAwesomeIcons.faceGrinBeam,
                                title: AppStrings.rate.tr,
                                onTap: () {
                                  _showRateDialog(context);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.orderDetailsPath);
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 20.h),
            ),
          ),
        ],
      ),
    );
  }

  _showRateDialog(BuildContext context) {
    showAdaptiveDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding.w,
          vertical: kDefaultPadding.h,
        ),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding.w,
                vertical: kDefaultPadding.h * 2.5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${AppStrings.howWasYourOrderFrom.tr} Brand Name?',
                    maxLines: 2,
                    style: context.textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.h),
                  RatingBar.builder(
                    initialRating: 0,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 30.sp,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: kPrimaryColor,
                    ),
                    onRatingUpdate: (rating) {
                      log(rating.toString());
                    },
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: 0.3.sw,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        AppStrings.rate.tr,
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: kWhiteColor,
                          fontWeight: kFontWeightBold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            PositionedDirectional(
              top: 0,
              start: 0,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close,
                  color: kTextDarkColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildOrderCustomButton({
    required BuildContext context,
    required String title,
    required IconData icon,
    required Function() onTap,
  }) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Row(
        children: [
          Icon(
            icon,
            size: 14.sp,
            color: kPrimaryColor,
          ),
          SizedBox(width: 5.w),
          Text(
            title,
            style: context.textTheme.bodySmall!.copyWith(
              color: kTextDarkColor,
              fontWeight: kFontWeightBold,
              fontSize: 11.sp,
            ),
          ),
        ],
      ),
    );
  }
}
