import '/core/utilities/routes_manger.dart';
import 'package:get/get.dart';

import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/assets_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ChatWithSupportWidget extends StatelessWidget {
  const ChatWithSupportWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        PositionedDirectional(
          bottom: 10.h,
          end: 0,
          child: InkWell(
            onTap: () {
              Get.toNamed(Routes.chatWithSupportPath);
            },
            child: Container(
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadiusDirectional.only(
                  bottomStart: Radius.circular(10.r),
                  topStart: Radius.circular(10.r),
                ),
              ),
              padding: EdgeInsetsDirectional.only(
                start: 10.w,
                end: 20.w,
                top: 5.h,
                bottom: 5.h,
              ),
              child: SvgPicture.asset(AssetsData.supportIconSVG),
            ),
          ),
        ),
      ],
    );
  }
}
