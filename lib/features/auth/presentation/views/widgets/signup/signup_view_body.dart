import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/core/global/language/app_strings.dart';
import '/core/global/theme/app_colors_light.dart';
import '/core/global/widgets/custom_app_button.dart';
import '/core/services/services_locator.dart';
import '/core/utilities/app_constance.dart';
import '/features/auth/presentation/view_models/register/register_cubit.dart';
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
  final _cubit = sl<RegisterCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding.w,
          vertical: kDefaultPadding.h,
        ),
        child: Form(
          key: _cubit.formKey,
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
              AuthSignUpTextFormsWidget(
                cubit: _cubit,
              ),
              SizedBox(height: 10.h),
              BlocBuilder<RegisterCubit, RegisterState>(
                bloc: _cubit,
                builder: (context, state) {
                  return AuthSignUpTermsAndPolicyWidget(
                    value: _cubit.isTermsAndPolicyAccepted,
                    onChanged: (value) {
                      _cubit.toggleTermsAndPolicy(value ?? false);
                    },
                  );
                },
              ),
              SizedBox(height: 5.h),
              BlocBuilder<RegisterCubit, RegisterState>(
                bloc: _cubit,
                builder: (context, state) {
                  return CustomAppButton(
                    onPressed: () {
                      return _cubit.register();
                    },
                    text: AppStrings.creteNewAccount.tr,
                  );
                },
              ),
              const AuthSignUpLoginButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
