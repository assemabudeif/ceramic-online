import '/core/global/language/app_strings.dart';
import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/app_constance.dart';
import '/core/utilities/assets_data.dart';
import '/core/utilities/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

import '/../core/utilities/routes_manger.dart';

class AuthSignPhoneNumberViewBody extends StatefulWidget {
  const AuthSignPhoneNumberViewBody(
      {super.key, required this.isForgetPassword});

  final bool isForgetPassword;

  @override
  State<AuthSignPhoneNumberViewBody> createState() =>
      _AuthSignPhoneNumberViewBodyState();
}

class _AuthSignPhoneNumberViewBodyState
    extends State<AuthSignPhoneNumberViewBody> {
  late TextEditingController _phoneController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding.w, vertical: kDefaultPadding.h),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 25.h),
            Text(
              AppStrings.enterYourPhoneNumber.tr,
              style: context.textTheme.titleLarge,
            ),
            SizedBox(height: 20.h),
            SizedBox(
              height: 220.h,
              width: 210.h,
              child: const RiveAnimation.asset(
                AssetsData.waveAnimation,
                fit: BoxFit.cover,
                // fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              AppStrings
                  .ceramicOnlineWillSendAnSMSMessageToVerifyYourPhoneNumber.tr,
              style: context.textTheme.bodyMedium,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            Text(
              AppStrings.enterMobileNumber.tr,
              style: context.textTheme.bodyLarge!.copyWith(
                fontWeight: kFontWeightBold,
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: 0.7.sw,
              child: TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(11),
                ],
                decoration: InputDecoration(
                  hintText: AppStrings.yourPhoneNumber.tr,
                  prefixIcon: SizedBox(
                    width: 50.w,
                    child: const Center(
                      child: Text(
                        '+20',
                        style: TextStyle(
                          color: kBlackColor,
                          fontWeight: kFontWeightRegular,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: kBlackColor,
                      width: 1.w,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: kBlackColor,
                      width: 1.w,
                    ),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: kBlackColor,
                      width: 1.w,
                    ),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: kErrorColor,
                      width: 1.w,
                    ),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: kErrorColor,
                      width: 1.w,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.h),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(
                  Routes.otpPath,
                  arguments: widget.isForgetPassword,
                );
              },
              child: Text(
                AppStrings.done.tr,
                style: context.textTheme.bodyLarge!.copyWith(
                  fontWeight: kFontWeightBold,
                  color: kWhiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
