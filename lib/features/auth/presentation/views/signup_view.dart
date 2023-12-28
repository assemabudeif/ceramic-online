import 'package:flutter/material.dart';

import '../../../../core/global/widgets/custom_app_bar.dart';
import 'widgets/signup/signup_view_body.dart';

class SignUpView extends StatelessWidget  {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      appBar: CustomAppBar(),
      body: SignUpViewBody(),
    );
  }
}
