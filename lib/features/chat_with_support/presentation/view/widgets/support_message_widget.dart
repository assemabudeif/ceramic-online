import 'package:ceramic_online/core/global/theme/app_colors_light.dart';
import 'package:ceramic_online/core/utilities/app_constance.dart';
import 'package:ceramic_online/core/utilities/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SupportMessageWidget extends StatelessWidget {
  const SupportMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: SizedBox(
        width: 0.75.sw,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 20.r,
                  backgroundColor: kWhiteColor,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.user,
                      color: kTextDarkColor,
                    ),
                  ),
                ),
                PositionedDirectional(
                  bottom: 1.h,
                  end: 1.w,
                  child: Container(
                    width: 10.w,
                    height: 10.5.w,
                    decoration: const BoxDecoration(
                      color: kOnlineColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: kDefaultPadding.w / 2),
            Expanded(
              child: Column(
                children: [
                  Text(
                    'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter ',
                    style: context.textTheme.bodySmall!.copyWith(
                      color: kTextDarkColor,
                      fontWeight: kFontWeightBold,
                    ),
                    maxLines: 100,
                  ),
                  SizedBox(height: 1.5.h),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      '01:15',
                      style: context.textTheme.bodySmall!.copyWith(
                        color: kTextDarkColor,
                        fontWeight: kFontWeightLight,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
