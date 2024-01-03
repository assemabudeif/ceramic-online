import '/core/global/language/app_strings.dart';
import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/app_constance.dart';
import '/core/utilities/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'default_required_widget.dart';

class ProductChoiceSizeWidget extends StatefulWidget {
  const ProductChoiceSizeWidget({super.key});

  @override
  State<ProductChoiceSizeWidget> createState() =>
      _ProductChoiceSizeWidgetState();
}

class _ProductChoiceSizeWidgetState extends State<ProductChoiceSizeWidget> {
  int _sizeGroupValue = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.yourChoiceOfSize.tr,
              style: context.textTheme.titleMedium!.copyWith(
                color: kTextDarkColor,
              ),
            ),
            const DefaultRequiredWidget(),
          ],
        ),
        const SizedBox(height: kDefaultPadding),
        RadioListTile<int>.adaptive(
          value: 0,
          controlAffinity: ListTileControlAffinity.trailing,
          groupValue: _sizeGroupValue,
          onChanged: (value) {
            setState(() {
              _sizeGroupValue = value!;
            });
          },
          title: Text(
            '10cm x 10cm',
            style: context.textTheme.bodyMedium!.copyWith(
              color: kTextDarkColor,
              fontWeight: kFontWeightBold,
            ),
          ),
        ),
        RadioListTile<int>.adaptive(
          value: 1,
          controlAffinity: ListTileControlAffinity.trailing,
          groupValue: _sizeGroupValue,
          onChanged: (value) {
            setState(() {
              _sizeGroupValue = value!;
            });
          },
          title: Text(
            '30cm x 30cm',
            style: context.textTheme.bodyMedium!.copyWith(
              color: kTextDarkColor,
              fontWeight: kFontWeightBold,
            ),
          ),
        ),
      ],
    );
  }
}
