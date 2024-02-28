import 'package:flutter/material.dart';

import '/core/global/widgets/custom_app_bar.dart';
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
