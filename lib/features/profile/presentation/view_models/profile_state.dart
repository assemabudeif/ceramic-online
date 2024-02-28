part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLogoutLoadingState extends ProfileState {}

class ProfileLogoutSuccessState extends ProfileState {
  final String message;

  ProfileLogoutSuccessState({required this.message});
}

class ProfileLogoutFailureState extends ProfileState {
  final String message;

  ProfileLogoutFailureState({required this.message});
}

class ProfileDetailsLoadingState extends ProfileState {}

class ProfileDetailsSuccessState extends ProfileState {}

class ProfileDetailsFailureState extends ProfileState {
  final String message;

  ProfileDetailsFailureState({required this.message});
}
