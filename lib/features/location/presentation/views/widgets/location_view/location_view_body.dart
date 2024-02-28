import 'package:ceramic_online/core/services/services_locator.dart';
import 'package:ceramic_online/features/location/presentation/view_models/locations_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/core/global/language/app_strings.dart';
import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/app_constance.dart';
import '/core/utilities/font_manger.dart';
import '/core/utilities/routes_manger.dart';
import '/features/widgets/custom_search_widget.dart';
import 'choose_regions_list_widget.dart';

class LocationViewBody extends StatelessWidget {
  const LocationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final locationsCubit = sl<LocationsCubit>();
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      child: Column(
        children: [
          /// Search
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding.w,
              vertical: kDefaultPadding.h,
            ),
            child: const CustomSearchWidget(
              hintText: 'Egypt',
            ),
          ),

          /// Use current location
          Container(
            color: kWhiteColor,
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding.w,
              vertical: kDefaultPadding.h,
            ),
            child: InkWell(
              onTap: () {},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 4.5.h),
                    child: Icon(
                      Icons.my_location_outlined,
                      color: kPrimaryColor,
                      size: 20.w,
                    ),
                  ),
                  SizedBox(width: 3.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.useCurrentLocation.tr,
                        style: context.textTheme.bodyLarge!.copyWith(
                          color: kTextDarkColor,
                          fontWeight: kFontWeightBold,
                        ),
                      ),
                      Text(
                        AppStrings.seeAllInEgypt.tr,
                        style: context.textTheme.bodySmall!.copyWith(
                          color: kPrimaryColor,
                          fontWeight: kFontWeightBold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          /// Recent title
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: kDefaultPadding.h / 2,
              horizontal: kDefaultPadding.w,
            ),
            child: Row(
              children: [
                Text(
                  AppStrings.recent.tr,
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: kTextDarkColor,
                    fontWeight: kFontWeightBold,
                  ),
                ),
              ],
            ),
          ),

          /// Recent list
          Container(
            color: kWhiteColor,
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding.w,
                vertical: kDefaultPadding.h / 2,
              ),
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Egypt',
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: kTextDarkColor,
                        fontWeight: kFontWeightBold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.locationDetailsPath);
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 15.w,
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 5.h),
              itemCount: 2,
            ),
          ),

          /// Choose region title
          Container(
            padding: EdgeInsets.symmetric(
              vertical: kDefaultPadding.h / 2,
              horizontal: kDefaultPadding.w,
            ),
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              AppStrings.chooseRegion.tr,
              style: context.textTheme.bodyMedium!.copyWith(
                color: kTextDarkColor,
                fontWeight: kFontWeightBold,
              ),
            ),
          ),

          /// Choose region list
          ChooseRegionsListWidget(
            locationsCubit: locationsCubit,
          ),
        ],
      ),
    );
  }
}
