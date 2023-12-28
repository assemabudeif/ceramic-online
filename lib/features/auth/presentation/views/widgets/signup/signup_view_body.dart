import '/core/utilities/routes_manger.dart';

import '/core/global/language/app_strings.dart';
import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/app_constance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'auth_sign_up_login_button_widget.dart';
import 'auth_sign_up_logo_widget.dart';
import 'auth_sign_up_terms_and_policy_widget.dart';
import 'auth_sign_up_text_forms_widget.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding.w,
        vertical: kDefaultPadding.h,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const AuthSignUpLogoWidget(),
            SizedBox(
              height: 15.h,
            ),
            Text(
              AppStrings.signUpToFindYouNeed.tr,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: kTextDarkColor,
                  ),
            ),
            SizedBox(
              height: 15.h,
            ),
            const AuthSignUpTextFormsWidget(),
            SizedBox(height: 10.h),
            AuthSignUpTermsAndPolicyWidget(
              value: true,
              onChanged: (value) {},
            ),
            SizedBox(height: 5.h),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.otpPath);
              },
              child: Text(
                AppStrings.creteNewAccount.tr,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: kWhiteColor,
                    ),
              ),
            ),
            const AuthSignUpLoginButtonWidget(),
          ],
        ),
      ),
    );
  }
}
