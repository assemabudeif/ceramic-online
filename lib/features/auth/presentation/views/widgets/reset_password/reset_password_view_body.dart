import '/core/global/language/app_strings.dart';
import '/core/global/theme/app_colors_light.dart';
import '/core/utilities/app_constance.dart';
import '/core/utilities/assets_data.dart';
import '/core/utilities/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

import 'reset_password_dialog_widget.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({super.key});

  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _newPasswordController;
  late TextEditingController _confirmNewPasswordController;
  late FocusNode _newPasswordFocusNode;
  late FocusNode _confirmNewPasswordFocusNode;

  bool _isObscurePassword = true;
  bool _isObscureConfirmPassword = true;

  @override
  void initState() {
    super.initState();

    _newPasswordController = TextEditingController();
    _confirmNewPasswordController = TextEditingController();

    _newPasswordFocusNode = FocusNode();
    _confirmNewPasswordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();

    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();

    _newPasswordFocusNode.dispose();
    _confirmNewPasswordFocusNode.dispose();
  }

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
            Text(
              AppStrings.resetYourPassword.tr,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 180.h,
              width: 180.w,
              child: const RiveAnimation.asset(
                AssetsData.passwordLoopAnimation,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                AppStrings.newPassword.tr,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: kFontWeightBold,
                    ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            TextFormField(
              focusNode: _newPasswordFocusNode,
              controller: _newPasswordController,
              obscureText: _isObscurePassword,
              decoration: InputDecoration(
                hintText: AppStrings.newPasswordHint.tr,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isObscurePassword = !_isObscurePassword;
                    });
                  },
                  icon: Icon(
                    _isObscurePassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return AppStrings.invalidPassword.tr;
                }
                return null;
              },
              onFieldSubmitted: (value) {
                _newPasswordFocusNode.unfocus();
                FocusScope.of(context)
                    .requestFocus(_confirmNewPasswordFocusNode);
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                AppStrings.confirmNewPassword.tr,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: kFontWeightBold,
                    ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            TextFormField(
              controller: _confirmNewPasswordController,
              focusNode: _confirmNewPasswordFocusNode,
              obscureText: _isObscureConfirmPassword,
              decoration: InputDecoration(
                hintText: AppStrings.confirmNewPassword.tr,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isObscureConfirmPassword = !_isObscureConfirmPassword;
                    });
                  },
                  icon: Icon(
                    _isObscureConfirmPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return AppStrings.invalidPassword.tr;
                } else if (value != _newPasswordController.text) {
                  return AppStrings.passwordNotMatch.tr;
                }
                return null;
              },
              onFieldSubmitted: (value) {
                _confirmNewPasswordFocusNode.unfocus();
              },
            ),
            SizedBox(
              height: 30.h,
            ),
            ElevatedButton(
              onPressed: () {
                showAdaptiveDialog(
                  context: context,
                  builder: (context) {
                    return const ResetPasswordDialogWidget();
                  },
                );
              },
              child: Text(
                AppStrings.resetMyPassword.tr,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
