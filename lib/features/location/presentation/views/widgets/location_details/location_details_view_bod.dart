import 'package:ceramic_online/features/location/presentation/view_models/locations_cubit.dart';
import 'package:ceramic_online/features/location/presentation/views/widgets/location_details/location_details_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/core/global/language/app_strings.dart';
import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/app_constance.dart';
import '/core/utilities/font_manger.dart';
import '/features/widgets/custom_search_widget.dart';

class LocationDetailsViewBody extends StatelessWidget {
  const LocationDetailsViewBody({
    super.key,
    required this.governmentId,
    required this.locationsCubit,
  });

  final String governmentId;
  final LocationsCubit locationsCubit;

  @override
  Widget build(BuildContext context) {
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
              hintText: 'Search in Egypt',
            ),
          ),

          /// See Ads in All Egypt
          Container(
            color: kWhiteColor,
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding.w,
              vertical: kDefaultPadding.h,
            ),
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              AppStrings.seeAdsInAllEgypt.tr,
              style: context.textTheme.bodyLarge!.copyWith(
                color: kPrimaryColor,
                fontWeight: kFontWeightBold,
              ),
            ),
          ),

          /// All in Egypt
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding.w,
              vertical: kDefaultPadding.h / 2.5,
            ),
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              AppStrings.allInEgypt.tr.toUpperCase(),
              style: context.textTheme.bodyLarge!.copyWith(
                color: kTextDarkColor,
                fontWeight: kFontWeightBold,
              ),
            ),
          ),

          /// Location Details List
          LocationDetailsListWidget(
            governmentId: governmentId,
            locationsCubit: locationsCubit,
          ),
        ],
      ),
    );
  }
}
