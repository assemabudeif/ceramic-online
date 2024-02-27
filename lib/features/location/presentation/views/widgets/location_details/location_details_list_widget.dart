import 'package:ceramic_online/core/global/theme/app_colors_light.dart';
import 'package:ceramic_online/core/global/widgets/custom_empty_widget.dart';
import 'package:ceramic_online/core/global/widgets/custom_error_widget.dart';
import 'package:ceramic_online/core/global/widgets/custom_loading_widget.dart';
import 'package:ceramic_online/core/utilities/app_constance.dart';
import 'package:ceramic_online/core/utilities/routes_manger.dart';
import 'package:ceramic_online/features/location/presentation/view_models/locations_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LocationDetailsListWidget extends StatelessWidget {
  const LocationDetailsListWidget({
    super.key,
    required this.governmentId,
    required this.locationsCubit,
  });

  final String governmentId;
  final LocationsCubit locationsCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationsCubit, LocationsState>(
      bloc: locationsCubit..getGovernmentRegions(governmentId),
      builder: (context, state) {
        if (locationsCubit.governmentsRegionsModel == null &&
            locationsCubit.governmentsRegionsError.isEmpty) {
          return const CustomLoadingWidget();
        } else if (locationsCubit.governmentsRegionsError.isNotEmpty) {
          return CustomErrorWidget(
            height: 200.h,
            message: locationsCubit.governmentsRegionsError,
            onRetry: () {
              locationsCubit.getGovernmentRegions(governmentId);
            },
          );
        } else if (locationsCubit.governmentsRegionsModel!.data.isEmpty) {
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
              return InkWell(
                onTap: () {
                  Get.offAllNamed(Routes.homeLayoutPath);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding.w,
                    vertical: kDefaultPadding.h / 2,
                  ),
                  child: Text(
                    locationsCubit.governmentsRegionsModel!.data[index].name,
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: kTextDarkColor,
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(
              color: kDividerColor,
              height: 1.h,
            ),
            itemCount: locationsCubit.governmentsRegionsModel!.data.length,
          ),
        );
      },
    );
  }
}
