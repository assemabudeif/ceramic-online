import '/core/global/theme/app_colors_light.dart';
import 'package:easy_loading_button/easy_loading_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomAppButton extends StatelessWidget {
  const CustomAppButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return EasyButton(
      buttonColor: context.theme.primaryColor,
      borderRadius: 30.0.r,
      elevation: 8.0,
      width: 0.6.sw,
      useWidthAnimation: true,
      type: EasyButtonType.elevated,
      useEqualLoadingStateWidgetDimension: true,
      height: 38.0.h,
      idleStateWidget: Text(
        text,
        style: context.textTheme.bodyMedium!.copyWith(
          color: kWhiteColor,
        ),
      ),
      loadingStateWidget: const CircularProgressIndicator(
        color: kWhiteColor,
      ),
      onPressed: () {
        return onPressed();
      },
    );
  }
}
