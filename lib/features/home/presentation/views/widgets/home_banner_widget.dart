import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/core/global/widgets/custom_empty_widget.dart';
import '/core/global/widgets/custom_error_widget.dart';
import '/core/global/widgets/custom_loading_widget.dart';
import '/core/global/widgets/custom_network_image.dart';
import '/features/home/data/models/sliders_model.dart';
import '/features/home/presentation/view_models/home_cubit.dart';

class HomeBannerWidget extends StatelessWidget {
  const HomeBannerWidget({super.key, required this.cubit});
  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: cubit
      // ..getHomeSliders()
      ,
      builder: (context, state) {
        if (cubit.slidersModel == null && cubit.slidersError.isEmpty) {
          return const CustomLoadingWidget(
            isFullScreen: false,
          );
        }
        if (cubit.slidersError.isNotEmpty) {
          return CustomErrorWidget(
            height: 0.2.sh,
            message: cubit.slidersError,
            onRetry: () {
              cubit.slidersModel = null;
              cubit.slidersError = '';

              cubit.getHomeSliders();
            },
          );
        }

        return _buildBanner(cubit.slidersModel?.data ?? []);
      },
    );
  }

  _buildBanner(List<SlidersData> sliders) {
    return switch (sliders.length) {
      0 => CustomEmptyWidget(
          height: 0.2.sh,
        ),
      int() => _buildCarouselSlider(sliders),
    };
  }

  _buildCarouselSlider(List<SlidersData> sliders) => CarouselSlider(
        items: sliders.map(
          (e) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(0.05.sw),
              child: CustomNetworkImage(
                imageUrl: e.image,
                fit: BoxFit.fitWidth,
              ),
            );
          },
        ).toList(),
        options: CarouselOptions(
          viewportFraction: 1,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          pauseAutoPlayOnTouch: true,
          enlargeCenterPage: true,
        ),
      );
}
