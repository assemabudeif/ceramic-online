import 'package:flutter/material.dart';

import '/core/global/widgets/custom_app_bar.dart';
import '/features/cart/presentation/views/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: CartViewBody(),
    );
  }
}
