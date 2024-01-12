import '/core/global/theme/app_colors_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultProductDetailsDividerWidget extends StatelessWidget {
  const DefaultProductDetailsDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        const Divider(
          color: kHintColor,
          thickness: 1,
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
