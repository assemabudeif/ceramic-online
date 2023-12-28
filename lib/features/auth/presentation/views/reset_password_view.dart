import '/core/global/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'widgets/reset_password/reset_password_view_body.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: ResetPasswordViewBody(),
    );
  }
}
