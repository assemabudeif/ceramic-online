import '/core/global/theme/app_colors_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

import '/core/utilities/assets_data.dart';

class AuthSignUpLogoWidget extends StatelessWidget {
  const AuthSignUpLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AssetsData.mainLogoSvg,
      placeholderBuilder: (context) {
        return Shimmer(
          enabled: true,
          gradient: kShimmerGradientColor,
          child: Container(
            width: 0.8.sw,
            height: 100.h,
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
        );
      },
    );
  }
}
