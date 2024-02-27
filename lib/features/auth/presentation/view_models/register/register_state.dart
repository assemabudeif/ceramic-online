part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {}

class RegisterFailureState extends RegisterState {
  final String message;

  RegisterFailureState(this.message);
}

class RegisterPasswordVisibilityLoadingState extends RegisterState {}

class RegisterPasswordVisibilitySuccessState extends RegisterState {}

class RegisterAgreeTermsLoadingState extends RegisterState {}

class RegisterAgreeTermsSuccessState extends RegisterState {}
