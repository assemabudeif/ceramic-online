import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/global/language/app_strings.dart';
import '../../../../../../core/global/theme/app_colors_light.dart';
import '../../../../../../core/utilities/font_manger.dart';

class AuthSignUpLoginButtonWidget extends StatelessWidget {
  const AuthSignUpLoginButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.alreadyHaveAnAccount.tr,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: kTextDarkColor,
              ),
        ),
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5.w,
              vertical: 5.h,
            ),
            child: Text(
              AppStrings.login.tr,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: kPrimaryColor,
                    fontWeight: kFontWeightMedium,
                    fontSize: 13.sp,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
