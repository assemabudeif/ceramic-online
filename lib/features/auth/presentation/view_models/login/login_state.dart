part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginByPhoneLoadingState extends LoginState {}

class LoginPhoneSuccessState extends LoginState {}

class LoginPhoneErrorState extends LoginState {
  final String message;

  const LoginPhoneErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class LoginByGoogleLoadingState extends LoginState {}

class LoginGoogleSuccessState extends LoginState {}

class LoginGoogleErrorState extends LoginState {
  final String message;

  const LoginGoogleErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class LoginByAppleLoadingState extends LoginState {}

class LoginAppleSuccessState extends LoginState {}

class LoginAppleErrorState extends LoginState {
  final String message;

  const LoginAppleErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class LogoutLoadingState extends LoginState {}

class LogoutSuccessState extends LoginState {}

class LogoutErrorState extends LoginState {}

class LoginChangePasswordVisibilityLoadingState extends LoginState {}

class LoginChangePasswordVisibilitySuccessState extends LoginState {}
