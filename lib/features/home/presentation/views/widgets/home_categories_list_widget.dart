import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/core/global/theme/app_colors_light.dart';
import '/core/global/widgets/custom_empty_widget.dart';
import '/core/global/widgets/custom_error_widget.dart';
import '/core/global/widgets/custom_loading_widget.dart';
import '/core/global/widgets/custom_network_image.dart';
import '/core/utilities/routes_manger.dart';
import '/features/home/presentation/view_models/home_cubit.dart';

class HomeCategoriesListWidget extends StatefulWidget {
  const HomeCategoriesListWidget({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  State<HomeCategoriesListWidget> createState() =>
      _HomeCategoriesListWidgetState();
}

class _HomeCategoriesListWidgetState extends State<HomeCategoriesListWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: widget.cubit..getHomeCategories(),
      builder: (context, state) {
        if (widget.cubit.categoriesError.isEmpty &&
            widget.cubit.categoriesModel == null) {
          return const CustomLoadingWidget(
            isFullScreen: false,
          );
        } else if (widget.cubit.categoriesError.isNotEmpty) {
          return Center(
            child: CustomErrorWidget(
              height: 120.h,
              message: widget.cubit.categoriesError,
              onRetry: () {
                widget.cubit.categoriesModel = null;
                widget.cubit.categoriesError = '';

                widget.cubit.getHomeCategories();
              },
            ),
          );
        } else {
          if (widget.cubit.categoriesModel?.data.data.isEmpty ?? true) {
            return CustomEmptyWidget(
              height: 80.h,
            );
          }
          return SizedBox(
            height: 100.h,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              scrollDirection: Axis.horizontal,
              itemCount: widget.cubit.categoriesModel!.data.data.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.toNamed(Routes.categoryDataPath);
                  },
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: kTextFieldFillColor,
                          borderRadius: BorderRadius.circular(10.r),
                          shape: BoxShape.rectangle,
                        ),
                        clipBehavior: Clip.antiAlias,
                        width: 60.h,
                        height: 60.h,
                        child: const Center(
                          child: CustomNetworkImage(
                            imageUrl:
                                'https://mashreqy.com/cdn/shop/files/WhatsAppImage2022-12-26at9.40.54PM_e3dea969-5f97-49f6-8823-8fbb4ae65e1d_869x869.jpg?v=1703592818',
                          ),
                        ),
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        widget.cubit.categoriesModel!.data.data[index].name,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(width: 10.w),
            ),
          );
        }
      },
    );
  }
}
