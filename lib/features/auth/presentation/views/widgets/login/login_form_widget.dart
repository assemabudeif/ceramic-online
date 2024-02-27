import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/core/global/language/app_strings.dart';
import '/core/global/theme/app_colors_light.dart';
import '/core/global/widgets/app_snackbars.dart';
import '/core/global/widgets/custom_app_button.dart';
import '/core/services/services_locator.dart';
import '/core/utilities/app_constance.dart';
import '/core/utilities/routes_manger.dart';
import '/features/auth/presentation/view_models/login/login_cubit.dart';
import '/features/auth/presentation/views/widgets/auth_text_form_field.dart';
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
  final _cubit = sl<LoginCubit>();

  @override
  void initState() {
    super.initState();

    // Initialize Controllers & Focus Nodes
    _cubit.initializeControllersAndFocusNodes();
  }

  @override
  void dispose() {
    super.dispose();

    // Dispose Controllers & Focus Nodes
    _cubit.disposeControllersAndFocusNodes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      bloc: _cubit,
      listener: (context, state) {
        if (state is LoginPhoneSuccessState ||
            state is LoginGoogleSuccessState ||
            state is LoginAppleSuccessState) {
          Get.offAllNamed(Routes.homeLayoutPath);
          AppSnackBars.showSuccessSnackBar(
            message: AppStrings.loginSuccess.tr,
            title: AppStrings.success.tr,
          );
        }
        if (state is LoginPhoneErrorState) {
          AppSnackBars.showErrorSnackBar(
            message: state.message,
            title: AppStrings.error.tr,
          );
        }
      },
      child: Container(
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
            key: _cubit.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.welcome.tr,
                  style: context.textTheme.titleLarge,
                ),
                SizedBox(height: 10.h),
                AuthTextFormField(
                  controller: _cubit.phoneController,
                  hintText: AppStrings.phone.tr,
                  obscureText: false,
                  keyboardType: TextInputType.phone,
                  focusNode: _cubit.phoneFocusNode,
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
                    _cubit.phoneFocusNode.unfocus();
                    _cubit.passwordFocusNode.requestFocus();
                  },
                ),
                BlocBuilder<LoginCubit, LoginState>(
                  bloc: _cubit,
                  builder: (context, state) {
                    return AuthTextFormField(
                      controller: _cubit.passwordController,
                      hintText: AppStrings.passwordHint.tr,
                      obscureText: _cubit.isPassword,
                      keyboardType: TextInputType.visiblePassword,
                      inputFormatters: const [],
                      focusNode: _cubit.passwordFocusNode,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.invalidPassword.tr;
                        } else if (value.length < 8) {
                          return AppStrings.invalidPassword.tr;
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {
                        _cubit.passwordFocusNode.unfocus();
                      },
                      suffix: IconButton(
                        onPressed: _cubit.changePasswordVisibility,
                        icon: Icon(
                          _cubit.isPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: context.theme.primaryColor,
                        ),
                      ),
                    );
                  },
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
                  child: BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return CustomAppButton(
                        onPressed: () {
                          return _cubit.loginByPhone();
                        },
                        text: AppStrings.login.tr,
                      );
                    },
                  ),
                ),
                const AuthCreateNewAccountButtonWidget(),
                const AuthOrWidget(),
                SizedBox(height: 15.h),
                AuthLoginWithAppleWidget(
                  formKey: _cubit.formKey,
                  onPressed: () {
                    _cubit.loginByApple();
                  },
                ),
                SizedBox(height: 10.h),
                AuthLoginWithGoogleWidget(
                  formKey: _cubit.formKey,
                  onPressed: () {
                    _cubit.loginByGoogle();
                  },
                ),
                SizedBox(height: 15.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
