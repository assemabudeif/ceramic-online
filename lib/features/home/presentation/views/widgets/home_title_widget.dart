import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/core/global/language/app_strings.dart';
import '/core/utilities/font_manger.dart';

class HomeTitleWidget extends StatelessWidget {
  const HomeTitleWidget(
      {super.key, required this.title, required this.onPressed});

  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: context.textTheme.bodyLarge!.copyWith(
            fontWeight: kFontWeightBold,
          ),
        ),
        InkWell(
          onTap: () {
            onPressed();
          },
          child: Text(
            AppStrings.seeAll.tr,
            style: context.textTheme.bodySmall!.copyWith(
              fontWeight: kFontWeightBold,
            ),
          ),
        ),
      ],
    );
  }
}
