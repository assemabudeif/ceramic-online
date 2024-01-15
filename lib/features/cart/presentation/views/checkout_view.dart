import '/core/global/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'widgets/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: CheckoutViewBody(),
    );
  }
}
