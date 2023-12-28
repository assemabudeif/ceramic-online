import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/global/language/app_strings.dart';
import '../../../../../../core/global/language/language_manger.dart';
import '../../../../../../core/global/theme/app_colors_light.dart';
import '../../../../../../core/utilities/font_manger.dart';

class AuthSignUpTermsAndPolicyWidget extends StatelessWidget {
  const AuthSignUpTermsAndPolicyWidget({
    super.key,
    required this.value,
    this.onChanged,
  });

  final bool value;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile.adaptive(
      value: value,
      onChanged: (value) {
        onChanged!(value);
      },
      dense: true,
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
      title: Text.rich(
        TextSpan(
          text: AppStrings.yesIUnderstandAndAgreeToThe.tr,
          children: [
            TextSpan(
              text: AppStrings.ceramicOnlineTermsOfService.tr,
              style: TextStyle(
                color: kPrimaryColor,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  log('Terms of Service');
                },
            ),
            TextSpan(
              text: AppStrings.includingThe.tr,
            ),
            TextSpan(
              text: AppStrings.userAgreement.tr,
              style: TextStyle(
                color: kPrimaryColor,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  log('User Agreement');
                },
            ),
            TextSpan(
              text: AppStrings.and.tr,
            ),
            TextSpan(
              text: AppStrings.privacyPolicy.tr,
              style: TextStyle(
                color: kPrimaryColor,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  log('Privacy Policy');
                },
            ),
          ],
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: kTextDarkColor,
                fontWeight: kFontWeightRegular,
              ),
          locale: Locale(
            getAppLanguageCode,
          ),
        ),
        maxLines: 10,
      ),
    );
  }
}
