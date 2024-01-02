import 'package:ceramic_online/core/global/theme/app_colors_light.dart';
import 'package:ceramic_online/core/global/widgets/custom_app_bar.dart';
import 'package:ceramic_online/core/utilities/app_constance.dart';
import 'package:ceramic_online/core/utilities/assets_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightBackgroundColor,
      appBar: CustomAppBar(
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding.w,
            ),
            child: InkWell(
              onTap: () {},
              child: SvgPicture.asset(AssetsData.cartIconSVG),
            ),
          ),
        ],
      ),
      body: const ProductDetailsViewBody(),
    );
  }
}
