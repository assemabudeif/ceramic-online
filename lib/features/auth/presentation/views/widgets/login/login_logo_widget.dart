import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '/core/utilities/assets_data.dart';

class LoginLogoWidget extends StatelessWidget {
  const LoginLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 1.sh,
      decoration: BoxDecoration(
        color: context.theme.primaryColor,
      ),
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: 0.06.sh),
      child: SlideInDown(
        animate: true,
        delay: const Duration(seconds: 2),
        child: SvgPicture.asset(
          AssetsData.logoSvg,
          fit: BoxFit.fitHeight,
          height: 0.2.sh,
          allowDrawingOutsideViewBox: true,
          placeholderBuilder: (context) => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
