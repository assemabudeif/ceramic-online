import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/global/language/app_strings.dart';

class AuthSignUpTextFormsWidget extends StatefulWidget {
  const AuthSignUpTextFormsWidget({
    super.key,
  });

  @override
  State<AuthSignUpTextFormsWidget> createState() =>
      _AuthSignUpTextFormsWidgetState();
}

class _AuthSignUpTextFormsWidgetState extends State<AuthSignUpTextFormsWidget> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  late final TextEditingController _fullNameController;
  late final TextEditingController _phoneController;

  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;
  late final FocusNode _confirmPasswordFocusNode;
  late final FocusNode _fullNameFocusNode;
  late final FocusNode _phoneFocusNode;

  @override
  void initState() {
    super.initState();

    _initControllers();
    _initFocusNodes();
  }

  @override
  void dispose() {
    super.dispose();

    disposeControllers();
    disposeFocusNodes();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _fullNameController,
          decoration: InputDecoration(
            hintText: AppStrings.fullName.tr,
          ),
          focusNode: _fullNameFocusNode,
          keyboardType: TextInputType.name,
          validator: (value) {
            if (value!.isEmpty) {
              return AppStrings.invalidName.tr;
            }
            return null;
          },
          onFieldSubmitted: (value) {
            _fullNameFocusNode.unfocus();
            FocusScope.of(context).requestFocus(_phoneFocusNode);
          },
        ),
        SizedBox(height: 10.h),
        TextFormField(
          focusNode: _phoneFocusNode,
          controller: _phoneController,
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
            _phoneFocusNode.unfocus();
            FocusScope.of(context).requestFocus(_emailFocusNode);
          },
        ),
        SizedBox(height: 10.h),
        TextFormField(
          focusNode: _emailFocusNode,
          controller: _emailController,
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
            _emailFocusNode.unfocus();
            FocusScope.of(context).requestFocus(_passwordFocusNode);
          },
        ),
        SizedBox(height: 10.h),
        TextFormField(
          focusNode: _passwordFocusNode,
          controller: _passwordController,
          decoration: InputDecoration(
            hintText: AppStrings.passwordHint.tr,
          ),
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          validator: (value) {
            if (value!.isEmpty) {
              return AppStrings.invalidPassword.tr;
            } else if (value.length < 8) {
              return AppStrings.passwordLength.tr;
            }
            return null;
          },
          onFieldSubmitted: (value) {
            _passwordFocusNode.unfocus();
            FocusScope.of(context).requestFocus(_confirmPasswordFocusNode);
          },
        ),
        SizedBox(height: 10.h),
        TextFormField(
          focusNode: _confirmPasswordFocusNode,
          controller: _confirmPasswordController,
          decoration: InputDecoration(
            hintText: AppStrings.confirmPassword.tr,
          ),
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          validator: (value) {
            if (value!.isEmpty) {
              return AppStrings.invalidConfirmPassword.tr;
            } else if (value != _passwordController.text) {
              return AppStrings.passwordNotMatch.tr;
            }
            return null;
          },
          onFieldSubmitted: (value) {
            _confirmPasswordFocusNode.unfocus();
          },
        ),
      ],
    );
  }

  void _initFocusNodes() {
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
    _fullNameFocusNode = FocusNode();
    _phoneFocusNode = FocusNode();
  }

  void _initControllers() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _fullNameController = TextEditingController();
    _phoneController = TextEditingController();
  }

  void disposeControllers() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _fullNameController.dispose();
    _phoneController.dispose();
  }

  void disposeFocusNodes() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _fullNameFocusNode.dispose();
    _phoneFocusNode.dispose();
  }
}
