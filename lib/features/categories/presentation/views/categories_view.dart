import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/core/global/language/app_strings.dart';
import '/core/services/services_locator.dart';
import '/core/utilities/app_constance.dart';
import '/features/categories/presentation/view_models/categories_cubit.dart';
import '/features/widgets/custom_search_widget.dart';
import 'widgets/categories_list_widget.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  final _cubit = sl<CategoriesCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding.w,
        ),
        child: RefreshIndicator(
          onRefresh: () async {
            _cubit.pagingController.refresh();
            _cubit.pageKey = 1;
            _cubit.isLastPage = false;
            return _cubit.getAllCategories();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                AppStrings.chooseCategories.tr,
                style: context.textTheme.titleMedium!.copyWith(
                  color: context.theme.primaryColor,
                ),
              ),
              const SizedBox(height: kDefaultPadding),
              CustomSearchWidget(
                hintText: AppStrings.search.tr,
                hasPadding: false,
              ),
              const SizedBox(height: kDefaultPadding),
              CategoriesListWidget(
                cubit: _cubit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
