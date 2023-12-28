import '/core/global/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'widgets/phone/auth_sign_phone_number_view_body.dart';

class AuthSignPhoneNumberView extends StatelessWidget {
  const AuthSignPhoneNumberView({super.key, required this.isForgetPassword});

  final bool isForgetPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: AuthSignPhoneNumberViewBody(
        isForgetPassword: isForgetPassword,
      ),
    );
  }
}
