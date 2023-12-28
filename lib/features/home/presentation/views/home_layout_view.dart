import 'package:ceramic_online/core/global/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'widgets/home_layout_view_body.dart';

class HomeLayoutView extends StatelessWidget {
  const HomeLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        haveBackIcon: false,
      ),
      body: HomeLayoutViewBody(),
    );
  }
}
