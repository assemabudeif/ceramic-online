import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/features/home/presentation/views/home_layout_imports.dart';

class ProfileCustomTextFormFieldWidget extends StatelessWidget {
  const ProfileCustomTextFormFieldWidget({
    super.key,
    required this.title,
    required this.controller,
  });
  final String title;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.titleSmall!.copyWith(
            fontWeight: kFontWeightBold,
          ),
        ),
        SizedBox(height: 5.h),
        SizedBox(
          height: 0.07.sh,
          child: TextFormField(
            controller: controller,
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
