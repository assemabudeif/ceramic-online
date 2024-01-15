import 'package:animate_do/animate_do.dart';
import '/features/auth/presentation/views/widgets/login/login_logo_widget.dart';

import 'package:flutter/material.dart';

import 'login_form_widget.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const LoginLogoWidget(),
          SlideInUp(
            delay: const Duration(seconds: 1),
            animate: true,
            child: const LoginFormWidget(),
          ),
        ],
      ),
    );
  }
}
