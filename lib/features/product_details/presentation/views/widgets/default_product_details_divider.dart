import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/app_constance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultProductDetailsDivider extends StatelessWidget {
  const DefaultProductDetailsDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: kDefaultPadding.h,
      ),
      child: Divider(
        color: kWhiteColor,
        thickness: 5.h,
        height: 1.h,
      ),
    );
  }
}
