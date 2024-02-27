part of 'locations_cubit.dart';

abstract class LocationsState {}

class LocationsInitial extends LocationsState {}

class GetGovernmentsLocationsLoadingState extends LocationsState {}

class GetGovernmentsLocationsSuccessState extends LocationsState {}

class GetGovernmentsLocationsErrorState extends LocationsState {
  final String error;

  GetGovernmentsLocationsErrorState(this.error);
}

class GetGovernmentRegionsLocationsLoadingState extends LocationsState {}

class GetGovernmentRegionsLocationsSuccessState extends LocationsState {}

class GetGovernmentRegionsLocationsErrorState extends LocationsState {
  final String error;

  GetGovernmentRegionsLocationsErrorState(this.error);
}
