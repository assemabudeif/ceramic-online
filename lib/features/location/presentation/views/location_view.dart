import 'package:ceramic_online/core/global/language/app_strings.dart';
import 'package:ceramic_online/core/global/theme/app_colors_light.dart';
import 'package:ceramic_online/core/utilities/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/location_view_body.dart';

class LocationView extends StatelessWidget {
  const LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.locations.tr,
          style: context.textTheme.titleMedium!.copyWith(
            color: kPrimaryColor,
            fontWeight: kFontWeightSemiBold,
          ),
        ),
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: kDarkIconColor,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: const LocationViewBody(),
    );
  }
}
