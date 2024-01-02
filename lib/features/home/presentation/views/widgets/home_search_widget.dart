import '/core/global/language/app_strings.dart';
import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/app_constance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '/core/utilities/assets_data.dart';

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({
    super.key,
    this.hasFilter = false,
    this.onTapFilter,
    required this.hintText,
    this.hasPadding = true,
  });
  final bool hasFilter;
  final Function? onTapFilter;
  final String hintText;
  final bool hasPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: hasPadding
          ? EdgeInsets.symmetric(
              horizontal: kDefaultPadding.w / 2,
            )
          : EdgeInsets.zero,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          prefixIconConstraints: BoxConstraints(
            minWidth: 40.w,
            // minHeight: 20.h,
          ),
          prefixIcon: SizedBox(
            width: 50.w,
            height: 20.h,
            child: SvgPicture.asset(
              AssetsData.searchIconSVG,
            ),
          ),
          suffixIcon: hasFilter
              ? InkWell(
                  onTap: () {
                    if (onTapFilter != null) {
                      onTapFilter!();
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: kTextFieldFillColor,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 7.5.h,
                    ),
                    width: 70.w,
                    height: 10.h,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          AppStrings.filter.tr,
                          style: context.textTheme.bodyMedium!.copyWith(
                            fontSize: 14.sp,
                            color: kDarkIconColor,
                          ),
                        ),
                        Icon(
                          FontAwesomeIcons.sliders,
                          size: 15.sp,
                          color: kDarkIconColor,
                        ),
                      ],
                    ),
                  ),
                )
              : null,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 10.h,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
