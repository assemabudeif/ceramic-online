import '/features/widgets/custom_cart_icon_widget.dart';

import '/core/global/theme/app_colors_light.dart';
import '/core/global/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kLightBackgroundColor,
      appBar: CustomAppBar(
        actions: [
          CustomCartIconWidget(),
        ],
      ),
      body: ProductDetailsViewBody(),
    );
  }
}
