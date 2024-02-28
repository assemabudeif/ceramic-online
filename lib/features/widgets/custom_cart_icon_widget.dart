import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/app_constance.dart';
import '/core/utilities/assets_data.dart';
import '/core/utilities/font_manger.dart';
import '/core/utilities/routes_manger.dart';

class CustomCartIconWidget extends StatefulWidget {
  const CustomCartIconWidget({super.key});

  @override
  State<CustomCartIconWidget> createState() => _CustomCartIconWidgetState();
}

class _CustomCartIconWidgetState extends State<CustomCartIconWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: kDefaultPadding.w),
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.cartPath);
        },
        child: Stack(
          children: [
            SvgPicture.asset(
              AssetsData.cartIconSVG,
              matchTextDirection: true,
              width: 23.w,
            ),
            PositionedDirectional(
              top: 0,
              end: 0,
              child: Container(
                width: 10.w,
                height: 10.w,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '1',
                    style: context.textTheme.bodySmall!.copyWith(
                      color: kWhiteColor,
                      fontWeight: kFontWeightSemiBold,
                      fontSize: 7.sp,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
