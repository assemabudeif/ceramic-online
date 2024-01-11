import 'package:ceramic_online/core/global/language/app_strings.dart';
import 'package:ceramic_online/core/global/theme/app_colors_light.dart';
import 'package:ceramic_online/core/utilities/assets_data.dart';
import 'package:ceramic_online/core/utilities/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

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
          Align(
            alignment: AlignmentDirectional.center,
            child: Column(
              children: [
                Text(
                  AppStrings.myProfile.tr,
                  style: context.textTheme.titleLarge,
                ),
                SizedBox(height: 20.h),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 70.r,
                      backgroundColor: Colors.grey,
                      backgroundImage: const NetworkImage(
                        'https://jobdeck.io/assets/images/new-testimonial-1.webp',
                      ),
                    ),
                    PositionedDirectional(
                      top: 0,
                      start: 0,
                      child: IconButton(
                        onPressed: () {},
                        color: kPrimaryColor,
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(kPrimaryColor),
                          shape: MaterialStateProperty.all(
                            const CircleBorder(),
                          ),
                        ),
                        icon: const Icon(
                          Icons.edit,
                          color: kWhiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Aymen Magdy',
                  style: context.textTheme.titleMedium,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.locationDot,
                color: kPrimaryColor,
                size: 11.r,
              ),
              SizedBox(width: 1.5.w),
              Text(
                'Cairo, Egypt',
                style: context.textTheme.bodySmall!.copyWith(
                  fontSize: 11.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Text(
            AppStrings.somethingAboutYou.tr,
            style: context.textTheme.titleSmall!.copyWith(
              fontWeight: kFontWeightBold,
            ),
          ),
          SizedBox(height: 5.h),
          TextFormField(),
          SizedBox(height: 20.h),
          Text(
            AppStrings.gender.tr,
            style: context.textTheme.titleSmall!.copyWith(
              fontWeight: kFontWeightBold,
            ),
          ),
          SizedBox(height: 5.h),
          TextFormField(),
          SizedBox(height: 20.h),
          Text(
            AppStrings.phoneNumber.tr,
            style: context.textTheme.titleSmall!.copyWith(
              fontWeight: kFontWeightBold,
            ),
          ),
          SizedBox(height: 5.h),
          TextFormField(),
          SizedBox(height: 20.h),
          Text(
            AppStrings.email.tr,
            style: context.textTheme.titleSmall!.copyWith(
              fontWeight: kFontWeightBold,
            ),
          ),
          SizedBox(height: 5.h),
          TextFormField(),
          SizedBox(height: 20.h),
          Text(
            '${AppStrings.location.tr} :',
            style: context.textTheme.titleSmall!.copyWith(
              fontWeight: kFontWeightBold,
            ),
          ),
          SizedBox(height: 10.h),
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
