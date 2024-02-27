import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/features/home/presentation/views/home_layout_imports.dart';

class CustomNoMoreItemsWidget extends StatelessWidget {
  const CustomNoMoreItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 0.05.sh,
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(0.01.sw),
      ),
      padding: EdgeInsets.zero,
      child: Text(
        AppStrings.noMoreItems.tr,
        style: context.textTheme.bodyLarge,
      ),
    );
  }
}
