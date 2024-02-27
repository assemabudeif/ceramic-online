import 'package:ceramic_online/core/error/failures.dart';
import 'package:ceramic_online/features/location/data/models/governments_model.dart';
import 'package:ceramic_online/features/location/data/models/governments_regions_model.dart';
import 'package:dartz/dartz.dart';

abstract class LocationsRepo {
  Future<Either<Failure, GovernmentsModel>> getGovernments();
  Future<Either<Failure, GovernmentsRegionsModel>> getGovernmentsRegions(
      String governmentId);
}
