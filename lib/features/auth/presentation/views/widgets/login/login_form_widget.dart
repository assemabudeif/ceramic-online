import 'dart:developer';

import 'package:google_sign_in/google_sign_in.dart';

import '/features/auth/presentation/views/widgets/auth_text_form_field.dart';

import '/core/utilities/routes_manger.dart';
import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/core/utilities/app_constance.dart';
import '/core/global/language/app_strings.dart';
import 'auth_create_new_account_button_widget.dart';
import 'auth_login_with_apple_widget.dart';
import 'auth_login_with_google_widget.dart';
import 'auth_or_widget.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  // Controllers & Focus Nodes
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late FocusNode _emailFocusNode;
  late FocusNode _passwordFocusNode;

  bool _isPassword = true;

  // This method to change password visibility
  _changePasswordVisibility() {
    setState(() {
      _isPassword = !_isPassword;
    });
  }

  @override
  void initState() {
    super.initState();

    // Initialize Controllers & Focus Nodes
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();

    // Dispose Controllers & Focus Nodes
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 40.w,
        right: 40.w,
        top: 1.5 * kDefaultPadding.h,
      ),
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35.r),
          topRight: Radius.circular(35.r),
        ),
      ),
      width: 1.sw,
      height: 0.6.sh,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.welcome.tr,
                style: context.textTheme.titleLarge,
              ),
              SizedBox(height: 10.h),
              AuthTextFormField(
                controller: _emailController,
                hintText: AppStrings.phone.tr,
                obscureText: false,
                keyboardType: TextInputType.phone,
                focusNode: _emailFocusNode,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppStrings.invalidEmail.tr;
                  }
                  return null;
                },
                onFieldSubmitted: (value) {
                  _emailFocusNode.unfocus();
                  _passwordFocusNode.requestFocus();
                },
              ),
              AuthTextFormField(
                controller: _passwordController,
                hintText: AppStrings.passwordHint.tr,
                obscureText: _isPassword,
                keyboardType: TextInputType.visiblePassword,
                inputFormatters: const [],
                focusNode: _passwordFocusNode,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppStrings.invalidPassword.tr;
                  } else if (value.length < 8) {
                    return AppStrings.invalidPassword.tr;
                  }
                  return null;
                },
                onFieldSubmitted: (value) {
                  _passwordFocusNode.unfocus();
                },
                suffix: IconButton(
                  onPressed: _changePasswordVisibility,
                  icon: Icon(
                    _isPassword ? Icons.visibility_off : Icons.visibility,
                    color: context.theme.primaryColor,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: TextButton(
                  onPressed: () {
                    Get.toNamed(
                      Routes.phoneSignPath,
                      arguments: true,
                    );
                  },
                  child: Text(
                    AppStrings.forgetPassword.tr,
                    style: context.textTheme.bodySmall!.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: kPrimaryColor,
                      decorationThickness: 1.5,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              Align(
                alignment: AlignmentDirectional.center,
                child: ElevatedButton(
                  onPressed: () {
                    Get.offAllNamed(Routes.homeLayoutPath);
                  },
                  child: Text(
                    AppStrings.login.tr,
                    style: context.textTheme.bodyMedium!.copyWith(
                        color: kWhiteColor, fontWeight: kFontWeightBold),
                  ),
                ),
              ),
              const AuthCreateNewAccountButtonWidget(),
              const AuthOrWidget(),
              SizedBox(height: 15.h),
              AuthLoginWithAppleWidget(
                formKey: _formKey,
                onPressed: () {
                  Get.toNamed(Routes.phoneSignPath);
                },
              ),
              SizedBox(height: 10.h),
              AuthLoginWithGoogleWidget(
                formKey: _formKey,
                onPressed: () {
                  _signInByGoogle();
                  // GoogleSignIn.
                  // Get.toNamed(Routes.phoneSignPath);
                },
              ),
              SizedBox(height: 15.h),
            ],
          ),
        ),
      ),
    );
  }

  _signInByGoogle() async {
    ///https://www.googleapis.com/auth/userinfo.email	See your primary Google Account email address
    // https://www.googleapis.com/auth/userinfo.profile	See your personal info, including any personal info you've made publicly available
    // openid

    const List<String> scopes = <String>[
      'email',
      // 'https://www.googleapis.com/auth/contacts.readonly',
      'https://www.googleapis.com/auth/userinfo.email', //	See your primary Google Account email address
      'https://www.googleapis.com/auth/userinfo.profile', //See your personal info, including any personal info you've made publicly available
      'openid',
    ];

    GoogleSignIn googleSignIn = GoogleSignIn(
      // Optional clientId
      // clientId: 'your-client_id.apps.googleusercontent.com',
      scopes: scopes,
    );
    try {
      final result = await googleSignIn.signIn();
      log(result?.id.toString() ?? '');
      log(result?.email.toString() ?? '');
      log(result?.displayName.toString() ?? '');
      log(result?.photoUrl.toString() ?? '');
      if (result != null) {
        Get.offAllNamed(Routes.homeLayoutPath);
      }
    } catch (error) {
      log(error.toString());
    }
  }
}
