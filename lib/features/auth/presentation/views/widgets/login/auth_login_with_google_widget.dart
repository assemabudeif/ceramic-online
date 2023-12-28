import '/core/global/language/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '/core/utilities/assets_data.dart';
import '/core/global/theme/app_colors_light.dart';

class AuthLoginWithGoogleWidget extends StatelessWidget {
  const AuthLoginWithGoogleWidget({
    super.key,
    required this.formKey,
    required this.onPressed,
  });
  final GlobalKey<FormState> formKey;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Stack(
        children: [
          Container(
            width: 1.sw,
            height: 33.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.r),
              color: kGoogleButtonColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 1.w,
                  ),
                  child: CircleAvatar(
                    minRadius: 17.w,
                    backgroundColor: kWhiteColor,
                    child: SvgPicture.asset(
                      AssetsData.googleSvg,
                      width: 18.w,
                    ),
                  ),
                ),
              ],
            ),
          ),
          PositionedDirectional(
            start: 0,
            end: 0,
            top: 0,
            bottom: 0,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                AppStrings.continueWithGoogle.tr,
                style: context.textTheme.bodyMedium!.copyWith(
                  color: kWhiteColor,
                ),
                // textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
