import 'package:ceramic_online/core/services/services_locator.dart';
import 'package:flutter/material.dart';

import '../view_models/locations_cubit.dart';
import '/core/global/widgets/custom_app_bar.dart';
import 'widgets/location_details/location_details_view_bod.dart';

class LocationDetailsView extends StatelessWidget {
  const LocationDetailsView({
    super.key,
    required this.governmentId,
  });

  final String governmentId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Egypt'.toUpperCase(),
      ),
      body: LocationDetailsViewBody(
        governmentId: governmentId,
        locationsCubit: sl<LocationsCubit>(),
      ),
    );
  }
}
