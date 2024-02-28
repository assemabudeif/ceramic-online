import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/../core/global/language/app_strings.dart';
import '/core/global/widgets/app_snackbars.dart';
import '/core/utilities/routes_manger.dart';
import '/features/auth/presentation/view_models/register/register_cubit.dart';

class AuthSignUpTextFormsWidget extends StatefulWidget {
  const AuthSignUpTextFormsWidget({
    super.key,
    required this.cubit,
  });

  final RegisterCubit cubit;

  @override
  State<AuthSignUpTextFormsWidget> createState() =>
      _AuthSignUpTextFormsWidgetState();
}

class _AuthSignUpTextFormsWidgetState extends State<AuthSignUpTextFormsWidget> {
  @override
  void initState() {
    super.initState();

    widget.cubit.initControllers();
    widget.cubit.initFocusNodes();
  }

  @override
  void dispose() {
    super.dispose();

    widget.cubit.disposeControllers();
    widget.cubit.disposeFocusNodes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterFailureState) {
          AppSnackBars.showErrorSnackBar(
            title: AppStrings.error.tr,
            message: state.message,
          );
        }
        if (state is RegisterSuccessState) {
          AppSnackBars.showSuccessSnackBar(
            title: AppStrings.success.tr,
            message: AppStrings.registerSuccess.tr,
          );

          Get.toNamed(Routes.otpPath);
        }
      },
      child: Column(
        children: [
          TextFormField(
            controller: widget.cubit.fullNameController,
            decoration: InputDecoration(
              hintText: AppStrings.fullName.tr,
            ),
            focusNode: widget.cubit.fullNameFocusNode,
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value!.isEmpty) {
                return AppStrings.invalidName.tr;
              }
              return null;
            },
            onFieldSubmitted: (value) {
              widget.cubit.fullNameFocusNode.unfocus();
              FocusScope.of(context).requestFocus(widget.cubit.phoneFocusNode);
            },
          ),
          SizedBox(height: 10.h),
          TextFormField(
            focusNode: widget.cubit.phoneFocusNode,
            controller: widget.cubit.phoneController,
            decoration: InputDecoration(
              hintText: AppStrings.phone.tr,
            ),
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value!.isEmpty) {
                return AppStrings.invalidPhone.tr;
              }
              return null;
            },
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            onFieldSubmitted: (value) {
              widget.cubit.phoneFocusNode.unfocus();
              FocusScope.of(context).requestFocus(widget.cubit.emailFocusNode);
            },
          ),
          SizedBox(height: 10.h),
          TextFormField(
            focusNode: widget.cubit.emailFocusNode,
            controller: widget.cubit.emailController,
            decoration: InputDecoration(
              hintText: AppStrings.email.tr,
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty) {
                return AppStrings.invalidEmail.tr;
              }
              return null;
            },
            onFieldSubmitted: (value) {
              widget.cubit.emailFocusNode.unfocus();
              FocusScope.of(context)
                  .requestFocus(widget.cubit.passwordFocusNode);
            },
          ),
          SizedBox(height: 10.h),
          BlocBuilder<RegisterCubit, RegisterState>(
            bloc: widget.cubit,
            builder: (context, state) {
              return TextFormField(
                focusNode: widget.cubit.passwordFocusNode,
                controller: widget.cubit.passwordController,
                decoration: InputDecoration(
                  hintText: AppStrings.passwordHint.tr,
                  suffixIcon: IconButton(
                    onPressed: () {
                      widget.cubit.togglePasswordVisibility();
                    },
                    icon: Icon(
                      widget.cubit.isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
                obscureText: widget.cubit.isPasswordVisible,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppStrings.invalidPassword.tr;
                  } else if (value.length < 8) {
                    return AppStrings.passwordLength.tr;
                  }
                  return null;
                },
                onFieldSubmitted: (value) {
                  widget.cubit.passwordFocusNode.unfocus();
                  FocusScope.of(context)
                      .requestFocus(widget.cubit.confirmPasswordFocusNode);
                },
              );
            },
          ),
          SizedBox(height: 10.h),
          BlocBuilder<RegisterCubit, RegisterState>(
            bloc: widget.cubit,
            builder: (context, state) {
              return TextFormField(
                focusNode: widget.cubit.confirmPasswordFocusNode,
                controller: widget.cubit.confirmPasswordController,
                decoration: InputDecoration(
                  hintText: AppStrings.confirmPassword.tr,
                  suffixIcon: IconButton(
                    onPressed: () {
                      widget.cubit.toggleConfirmPasswordVisibility();
                    },
                    icon: Icon(
                      widget.cubit.isConfirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
                obscureText: widget.cubit.isConfirmPasswordVisible,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppStrings.invalidConfirmPassword.tr;
                  } else if (value != widget.cubit.passwordController.text) {
                    return AppStrings.passwordNotMatch.tr;
                  }
                  return null;
                },
                onFieldSubmitted: (value) {
                  widget.cubit.confirmPasswordFocusNode.unfocus();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
