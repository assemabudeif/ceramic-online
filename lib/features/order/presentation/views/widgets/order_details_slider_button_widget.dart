import 'package:action_slider/action_slider.dart';
import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/routes_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderDetailsSliderButtonWidget extends StatelessWidget {
  const OrderDetailsSliderButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ActionSlider.dual(
      backgroundColor: kTextDarkColor.withOpacity(0.8),
      height: 55.h,
      iconAlignment: Alignment.center,
      sliderBehavior: SliderBehavior.move,
      loadingIcon: _loadingIconWidget(),
      successIcon: _successIconWidget(),
      failureIcon: _failureIconWidget(),
      icon: _iconWidget(),
      boxShadow: [
        BoxShadow(
          color: kHintColor.withOpacity(0),
          blurRadius: 0,
          offset: const Offset(0, 0),
        ),
      ],
      startAction: _startActionHandler,
      endAction: _endActionHandler,
    );
  }

  /// This method is called when the user sliding the slider to the start position to dismiss the order
  _startActionHandler(ActionSliderController controller) async {
    controller.loading(); //starts loading animation
    await Future.delayed(const Duration(seconds: 3));
    controller.failure(); //starts failure animation
    await Future.delayed(const Duration(seconds: 1));
    controller.reset(); //resets the slider
    await Future.delayed(const Duration(seconds: 1));
    Get.offNamed(Routes.homeLayoutPath); //navigates to the home page
  }

  /// This method is called when the user sliding the slider to the end position to confirm the order
  _endActionHandler(ActionSliderController controller) async {
    controller.loading(); //starts loading animation
    await Future.delayed(const Duration(seconds: 3));
    controller.success(); //starts success animation
    await Future.delayed(const Duration(seconds: 1));
    controller.reset(); //resets the slider
    await Future.delayed(const Duration(seconds: 1));
    Get.offNamed(Routes.homeLayoutPath); //navigates to the home page
  }

  /// Icon widget
  Widget _iconWidget() {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: kWhiteColor,
      ),
      padding: EdgeInsets.all(
        1.5.w,
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: kWhiteColor,
          shape: BoxShape.circle,
          border: Border.all(
            color: kPrimaryColor,
            width: 2,
          ),
        ),
        child: Icon(
          Icons.check,
          color: kPrimaryColor,
          size: 35.w,
        ),
      ),
    );
  }

  /// loading icon
  Widget _loadingIconWidget() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: kPrimaryColor,
      ),
      padding: EdgeInsets.all(
        1.5.w,
      ),
      child: const CircularProgressIndicator(
        color: kWhiteColor,
        strokeWidth: 2,
      ),
    );
  }

  /// success icon
  Widget _successIconWidget() {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: kSuccessColor,
      ),
      padding: EdgeInsets.all(
        1.5.w,
      ),
      child: Icon(
        Icons.check,
        color: kWhiteColor,
        size: 35.w,
      ),
    );
  }

  /// failure icon
  Widget _failureIconWidget() {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: kErrorColor,
      ),
      padding: EdgeInsets.all(
        1.5.w,
      ),
      child: Icon(
        Icons.close,
        color: kWhiteColor,
        size: 35.w,
      ),
    );
  }
}
