import 'package:ceramic_online/core/global/theme/app_colors_light.dart';
import 'package:ceramic_online/core/global/widgets/custom_empty_widget.dart';
import 'package:ceramic_online/core/global/widgets/custom_error_widget.dart';
import 'package:ceramic_online/core/global/widgets/custom_loading_widget.dart';
import 'package:ceramic_online/core/utilities/app_constance.dart';
import 'package:ceramic_online/core/utilities/font_manger.dart';
import 'package:ceramic_online/core/utilities/routes_manger.dart';
import 'package:ceramic_online/features/location/presentation/view_models/locations_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChooseRegionsListWidget extends StatelessWidget {
  const ChooseRegionsListWidget({super.key, required this.locationsCubit});

  final LocationsCubit locationsCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationsCubit, LocationsState>(
      bloc: locationsCubit..getGovernments(),
      builder: (context, state) {
        if (locationsCubit.governmentsModel == null &&
            locationsCubit.governmentsError.isEmpty) {
          return const CustomLoadingWidget();
        } else if (locationsCubit.governmentsError.isNotEmpty) {
          return CustomErrorWidget(
            height: 200.h,
            message: locationsCubit.governmentsError,
            onRetry: () {
              locationsCubit.getGovernments();
            },
          );
        } else if (locationsCubit.governmentsModel!.data.isEmpty) {
          return CustomEmptyWidget(
            height: 200.h,
          );
        }
        return Container(
          color: kWhiteColor,
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding.w,
                  vertical: kDefaultPadding.h / 2,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      locationsCubit.governmentsModel!.data[index].name,
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: kTextDarkColor,
                        fontWeight: kFontWeightBold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.toNamed(
                          Routes.locationDetailsPath,
                          arguments: locationsCubit
                              .governmentsModel!.data[index].id
                              .toString(),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 15.w,
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(
              color: kDividerColor,
              height: 1.h,
            ),
            itemCount: locationsCubit.governmentsModel!.data.length,
          ),
        );
      },
    );
  }
}
