import '/core/global/language/app_strings.dart';
import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/app_constance.dart';
import '/core/utilities/assets_data.dart';
import '/core/utilities/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ChatWithSupportHeaderWidget extends StatelessWidget {
  const ChatWithSupportHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 25.r,
              backgroundColor: kHintColor,
              child: SvgPicture.asset(AssetsData.supportIconSVG),
            ),
            PositionedDirectional(
              bottom: 1.5.h,
              end: 1.5.w,
              child: Container(
                width: 12.5.w,
                height: 12.5.w,
                decoration: const BoxDecoration(
                  color: kOnlineColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: kDefaultPadding.w / 2),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.support.tr,
              style: context.textTheme.titleMedium!.copyWith(
                color: kTextDarkColor,
                height: 1.2,
              ),
            ),
            Text(
              AppStrings.online.tr,
              style: context.textTheme.bodySmall!.copyWith(
                color: kTextDarkColor,
                fontWeight: kFontWeightBold,
                height: 1.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
