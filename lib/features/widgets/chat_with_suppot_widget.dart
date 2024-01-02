import 'package:ceramic_online/core/global/theme/app_colors_light.dart';
import 'package:ceramic_online/core/utilities/assets_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

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
            onTap: () {},
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
