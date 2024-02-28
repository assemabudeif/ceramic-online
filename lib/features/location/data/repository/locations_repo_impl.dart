import 'package:ceramic_online/core/error/failures.dart';
import 'package:ceramic_online/core/network/api_constance.dart';
import 'package:ceramic_online/core/network/custom_request.dart';
import 'package:ceramic_online/features/location/data/models/governments_model.dart';
import 'package:ceramic_online/features/location/data/models/governments_regions_model.dart';
import 'package:dartz/dartz.dart';

import 'locations_repo.dart';

class LocationsRepoImpl extends LocationsRepo {
  @override
  Future<Either<Failure, GovernmentsModel>> getGovernments() {
    return CustomRequest<GovernmentsModel>(
      path: ApiConstance.getGovernmentsPath(),
      fromJson: (json) {
        return GovernmentsModel.fromJson(json);
      },
    ).sendGetRequest();
  }

  @override
  Future<Either<Failure, GovernmentsRegionsModel>> getGovernmentsRegions(
    String governmentId,
  ) {
    return CustomRequest<GovernmentsRegionsModel>(
      path: ApiConstance.getGovernmentsRegionsPath(governmentId),
      fromJson: (json) {
        return GovernmentsRegionsModel.fromJson(json);
      },
    ).sendGetRequest();
  }
}
