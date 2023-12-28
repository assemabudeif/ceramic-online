import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/global/language/app_strings.dart';

class AuthOrWidget extends StatelessWidget {
  const AuthOrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(),
        ),
        SizedBox(width: 10.w),
        Text(
          AppStrings.or.tr,
          style: context.textTheme.bodyLarge,
        ),
        SizedBox(width: 10.w),
        const Expanded(
          child: Divider(),
        ),
      ],
    );
  }
}
