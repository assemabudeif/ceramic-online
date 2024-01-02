import '/core/global/language/app_strings.dart';
import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/core/utilities/app_constance.dart';
import '/core/utilities/routes_manger.dart';
import '../../../../home/presentation/views/widgets/home_search_widget.dart';

class LocationDetailsViewBody extends StatelessWidget {
  const LocationDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      child: Column(
        children: [
          //
          //* Search
          //
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding.w,
              vertical: kDefaultPadding.h,
            ),
            child: const HomeSearchWidget(
              hintText: 'Search in Egypt',
            ),
          ),

          //
          //* See Ads in All Egypt
          //
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

          //
          //* All in Egypt
          //
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

          //
          //* Location Details List
          //
          Container(
            color: kWhiteColor,
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.offAllNamed(Routes.homeLayoutPath);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPadding.w,
                      vertical: kDefaultPadding.h / 2,
                    ),
                    child: Text(
                      'Lorem Ipsum is simply dummy text',
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: kTextDarkColor,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                color: kDividerColor,
                height: 1.h,
              ),
              itemCount: 15,
            ),
          ),
        ],
      ),
    );
  }
}
