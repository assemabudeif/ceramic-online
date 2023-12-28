import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/core/global/language/app_strings.dart';
import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/app_constance.dart';
import '/core/utilities/font_manger.dart';
import '/core/utilities/routes_manger.dart';

class ResetPasswordDialogWidget extends StatelessWidget {
  const ResetPasswordDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(
        AppStrings.successfulPasswordReset.tr,
        style: context.textTheme.titleMedium!.copyWith(
          fontWeight: kFontWeightBold,
          color: kPrimaryColor,
        ),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding.w,
        vertical: kDefaultPadding.h,
      ),
      children: [
        Text(
          AppStrings.youCanNowUseYourNewPasswordToLogInToYourAccount.tr,
          style: context.textTheme.bodyMedium,
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
        SizedBox(
          height: 20.h,
        ),
        Align(
          alignment: AlignmentDirectional.center,
          child: ElevatedButton(
            onPressed: () {
              Get.offAllNamed(Routes.loginPath);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(100.w, 30.h),
            ),
            child: Text(
              AppStrings.login.tr,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: kFontWeightBold,
                    color: kWhiteColor,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
