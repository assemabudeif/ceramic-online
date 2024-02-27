import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '/core/global/widgets/custom_error_widget.dart';
import '/core/global/widgets/custom_list_pagination_widget.dart';
import '/core/global/widgets/custom_loading_widget.dart';
import '/features/categories/data/models/categories_model.dart';
import '/features/categories/presentation/view_models/categories_cubit.dart';
import '/features/home/presentation/views/home_layout_imports.dart';

class CategoriesListWidget extends StatefulWidget {
  final CategoriesCubit cubit;

  const CategoriesListWidget({
    super.key,
    required this.cubit,
  });

  @override
  State<CategoriesListWidget> createState() => _CategoriesListWidgetState();
}

class _CategoriesListWidgetState extends State<CategoriesListWidget> {
  @override
  void initState() {
    super.initState();

    widget.cubit.pagingController.addPageRequestListener((pageKey) {
      widget.cubit.getAllCategories();
    });
  }

  @override
  void dispose() {
    widget.cubit.pagingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        bloc: widget.cubit..getAllCategories(),
        builder: (context, state) {
          if (widget.cubit.categoriesModel == null &&
              widget.cubit.categoriesError.isEmpty) {
            return const CustomLoadingWidget();
          } else if (widget.cubit.categoriesError.isNotEmpty) {
            return Container(
              padding: EdgeInsets.only(bottom: 0.1.sh),
              height: 1.sh,
              child: CustomErrorWidget(
                height: 0.15.sh,
                message: widget.cubit.categoriesError,
                onRetry: () {
                  widget.cubit.pageKey = 1;
                  widget.cubit.isLastPage = false;
                  widget.cubit.categoriesModel = null;
                  widget.cubit.categoriesError = '';

                  widget.cubit.pagingController.refresh();
                  widget.cubit.getAllCategories();
                },
              ),
            );
          }
          return CustomListPaginationWidget<CategoryModel>(
            pagingController: widget.cubit.pagingController,
            itemBuilder: (context, item, index) {
              return InkWell(
                onTap: () {
                  Get.toNamed(Routes.categoryDataPath);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: kTextFieldFillColor,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          width: 60.w,
                          height: 60.h,
                          child: Center(
                            child: SvgPicture.asset(
                              AssetsData.ceramicCategoryIconSVG,
                              width: 30.w,
                            ),
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Text(
                          item.name,
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 18.sp,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
