import '/core/global/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'widgets/otp/auth_otp_view_body.dart';

class AuthOtpView extends StatelessWidget {
  const AuthOtpView({super.key, required this.isForgetPassword});

  final bool isForgetPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: AuthOtpViewBody(
        isForgetPassword: isForgetPassword,
      ),
    );
  }
}
