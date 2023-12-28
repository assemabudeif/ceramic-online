import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/core/utilities/routes_manger.dart';
import '/core/global/language/app_strings.dart';
import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/font_manger.dart';

class AuthCreateNewAccountButtonWidget extends StatelessWidget {
  const AuthCreateNewAccountButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.newToCeramicOnline.tr,
          style: context.textTheme.bodySmall!.copyWith(
            fontWeight: kFontWeightMedium,
            fontSize: 10.5.sp,
          ),
        ),
        TextButton(
          onPressed: () {
            Get.toNamed(Routes.signUpPath);
          },
          child: Text(
            AppStrings.signUp.tr,
            style: context.textTheme.bodySmall!.copyWith(
              color: kPrimaryColor,
              fontWeight: kFontWeightSemiBold,
            ),
          ),
        ),
      ],
    );
  }
}
