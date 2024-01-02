import 'package:ceramic_online/core/global/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'widgets/category_data_view_body.dart';

class CategoryDataView extends StatelessWidget {
  const CategoryDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: CategoryDataViewBody(),
    );
  }
}
