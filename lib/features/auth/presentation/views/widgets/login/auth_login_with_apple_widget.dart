import '/core/global/language/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/core/global/theme/app_colors_light.dart';

class AuthLoginWithAppleWidget extends StatelessWidget {
  const AuthLoginWithAppleWidget({
    super.key,
    required this.formKey,
    required this.onPressed,
  });
  final GlobalKey<FormState> formKey ;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        width: 1.sw,
        height: 33.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(
            color: kBlackColor.withOpacity(0.8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.apple),
            SizedBox(width: 5.w),
            Text(
              AppStrings.continueWithApple.tr,
              style: context.textTheme.bodyMedium!.copyWith(
                color: kBlackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
