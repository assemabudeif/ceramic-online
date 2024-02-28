import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/app_constance.dart';
import '/core/utilities/font_manger.dart';

class UserMessageWidget extends StatelessWidget {
  const UserMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        color: kTextFieldFillColor,
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding.w / 2,
          vertical: kDefaultPadding.h / 2,
        ),
        width: 0.75.sw,
        child: Column(
          children: [
            Text(
              'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter ',
              style: context.textTheme.bodySmall!.copyWith(
                color: kTextDarkColor,
                fontWeight: kFontWeightBold,
              ),
              maxLines: 100,
            ),
            SizedBox(height: 1.5.h),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                '01:15',
                style: context.textTheme.bodySmall!.copyWith(
                  color: kTextDarkColor,
                  fontWeight: kFontWeightLight,
                  fontSize: 10.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
