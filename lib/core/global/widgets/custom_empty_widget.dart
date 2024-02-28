import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/core/global/language/app_strings.dart';
import '/core/global/theme/app_colors_light.dart';

class CustomEmptyWidget extends StatelessWidget {
  const CustomEmptyWidget({super.key, required this.height});
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(0.05.sw),
      ),
      child: Text(
        AppStrings.empty.tr,
        style: context.textTheme.bodyLarge,
      ),
    );
  }
}
