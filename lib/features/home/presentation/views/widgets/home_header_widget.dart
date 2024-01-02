import '/core/utilities/routes_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/assets_data.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Get.toNamed(Routes.locationPath);
          },
          child: Row(
            children: [
              SvgPicture.asset(AssetsData.locationIconSVG),
              SizedBox(width: 5.w),
              Text(
                'Cairo, Egypt',
                style: context.textTheme.bodyMedium!.copyWith(
                  color: kTextDarkColor,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: kTextDarkColor,
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {},
          child: SvgPicture.asset(AssetsData.notificationIconSVG),
        ),
      ],
    );
  }
}
