import '/features/home/presentation/views/home_layout_imports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileCustomTextFormFieldWidget extends StatelessWidget {
  const ProfileCustomTextFormFieldWidget({super.key, required this.title});
  final String title;

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
        TextFormField(),
        SizedBox(height: 20.h),
      ],
    );
  }
}
