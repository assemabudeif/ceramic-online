import '/core/global/widgets/custom_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/core/global/language/app_strings.dart';
import '/core/global/theme/app_colors_light.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/location_view_body.dart';

class LocationView extends StatelessWidget {
  const LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.locations.tr,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: kDarkIconColor,
            size: 15.w,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: const LocationViewBody(),
    );
  }
}
