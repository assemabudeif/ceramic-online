import '/core/global/language/app_strings.dart';
import '/core/utilities/assets_data.dart';
import '/core/utilities/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'widgets/profile_custom_text_form_field_widget.dart';
import 'widgets/profile_user_details_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 20.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProfileUserDetailsWidget(),
          SizedBox(height: 20.h),
          ProfileCustomTextFormFieldWidget(
            title: AppStrings.somethingAboutYou.tr,
          ),
          ProfileCustomTextFormFieldWidget(
            title: AppStrings.gender.tr,
          ),
          ProfileCustomTextFormFieldWidget(
            title: AppStrings.phoneNumber.tr,
          ),
          ProfileCustomTextFormFieldWidget(
            title: AppStrings.email.tr,
          ),
          Text(
            '${AppStrings.location.tr} :',
            style: context.textTheme.titleSmall!.copyWith(
              fontWeight: kFontWeightBold,
            ),
          ),
          SvgPicture.asset(
            AssetsData.mapLocationImageSVG,
            alignment: AlignmentDirectional.center,
            width: 1.sw,
          ),
        ],
      ),
    );
  }
}
