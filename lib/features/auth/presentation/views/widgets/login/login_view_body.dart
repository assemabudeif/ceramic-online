import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/services/services_locator.dart';
import '/features/auth/presentation/view_models/login/login_cubit.dart';
import '/features/auth/presentation/views/widgets/login/login_logo_widget.dart';
import 'login_form_widget.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => sl<LoginCubit>(),
      child: SafeArea(
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
      ),
    );
  }
}
