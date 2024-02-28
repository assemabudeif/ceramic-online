import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/global/theme/app_colors_light.dart';
import '/core/global/widgets/custom_app_bar.dart';
import '/core/services/services_locator.dart';
import '/features/products/presentation/product_details/view_models/product_details_cubit.dart';
import '/features/widgets/custom_cart_icon_widget.dart';
import 'widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({
    super.key,
    required this.productId,
  });

  final int productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProductDetailsCubit>(),
      child: Scaffold(
        backgroundColor: kLightBackgroundColor,
        appBar: const CustomAppBar(
          actions: [
            CustomCartIconWidget(),
          ],
        ),
        body: ProductDetailsViewBody(
          productId: productId,
        ),
      ),
    );
  }
}
