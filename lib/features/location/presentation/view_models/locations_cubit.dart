import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ceramic_online/features/location/data/models/governments_model.dart';
import 'package:ceramic_online/features/location/data/models/governments_regions_model.dart';
import 'package:ceramic_online/features/location/data/repository/locations_repo.dart';

part 'locations_state.dart';

class LocationsCubit extends Cubit<LocationsState> {
  LocationsCubit(this._locationsRepo) : super(LocationsInitial());

  final LocationsRepo _locationsRepo;
  GovernmentsModel? governmentsModel;
  String governmentsError = '';

  GovernmentsRegionsModel? governmentsRegionsModel;
  String governmentsRegionsError = '';

  getGovernments() async {
    governmentsError = '';
    governmentsModel = null;
    emit(GetGovernmentsLocationsLoadingState());
    final result = await _locationsRepo.getGovernments();
    result.fold(
      (failure) {
        governmentsError = failure.message;
        emit(GetGovernmentsLocationsErrorState(failure.message));
      },
      (data) {
        governmentsModel = data;
        emit(GetGovernmentsLocationsSuccessState());
      },
    );
  }

  getGovernmentRegions(String governmentId) async {
    governmentsRegionsError = '';
    governmentsRegionsModel = null;
    emit(GetGovernmentRegionsLocationsLoadingState());
    final result = await _locationsRepo.getGovernmentsRegions(governmentId);
    result.fold(
      (failure) {
        governmentsRegionsError = failure.message;
        emit(GetGovernmentRegionsLocationsErrorState(failure.message));
      },
      (data) {
        governmentsRegionsModel = data;
        log(governmentsRegionsModel!.data.toString(), name: 'Regions');
        emit(GetGovernmentRegionsLocationsSuccessState());
      },
    );
  }
}
