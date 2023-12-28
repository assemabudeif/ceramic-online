import '/core/global/language/app_strings.dart';
import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/app_constance.dart';
import '/core/utilities/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '/core/utilities/assets_data.dart';
import '/core/utilities/routes_manger.dart';
import 'auth_otp_numbers_builder_widget.dart';

class AuthOtpViewBody extends StatelessWidget {
  const AuthOtpViewBody({super.key, required this.isForgetPassword});

  final bool isForgetPassword;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding.w,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AssetsData.phoneOtpSvg,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            AppStrings.waitingToAutomaticallyDetectAnSMSSentTo.tr,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('01096537165'),
              SizedBox(
                width: 8.w,
              ),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Text(
                  AppStrings.wrongNumber.tr,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: kFontWeightBold,
                      ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            AppStrings.enterTheOTP.tr,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(
            height: 10.h,
          ),
          const AuthOTPNumbersBuilderWidget(),
          SizedBox(
            height: 20.h,
          ),
          Text(
            AppStrings.enter6DigitCode.tr,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: kFontWeightBold,
                ),
          ),
          SizedBox(
            height: 30.h,
          ),
          InkWell(
            onTap: () {},
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.chat,
                  color: kPrimaryColor,
                  size: 20.r,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  AppStrings.resendSMS.tr,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          InkWell(
            onTap: () {},
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.call,
                  color: kPrimaryColor,
                  size: 20.r,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  AppStrings.callMe.tr,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          ElevatedButton(
            onPressed: () {
              if (isForgetPassword) {
                Get.toNamed(Routes.resetPasswordPath);
              } else {
                Get.offAllNamed(Routes.homeLayoutPath);
              }
            },
            child: Text(
              AppStrings.done.tr,
              style: context.textTheme.bodyLarge!.copyWith(
                color: kWhiteColor,
                fontWeight: kFontWeightBold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
