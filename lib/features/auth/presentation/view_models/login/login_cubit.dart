import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '/core/data/requests/auth/login_request_model.dart';
import '/core/network/api_constance.dart';
import '/core/services/app_prefs.dart';
import '/core/services/services_locator.dart';
import '/features/auth/data/repository/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepository) : super(LoginInitial());

  final AuthRepository _authRepository;

  /// Controllers & Focus Nodes
  final formKey = GlobalKey<FormState>();
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late FocusNode phoneFocusNode;
  late FocusNode passwordFocusNode;

  bool isPassword = true;

  /// This method to change password visibility
  Future<void> changePasswordVisibility() async {
    emit(LoginChangePasswordVisibilityLoadingState());
    isPassword = !isPassword;
    emit(LoginChangePasswordVisibilitySuccessState());
  }

  /// This method to login by phone
  Future<void> loginByPhone() async {
    final loginRequestModel = LoginRequestModel(
      phone: phoneController.text,
      password: passwordController.text,
    );

    if (!formKey.currentState!.validate()) return;

    emit(LoginByPhoneLoadingState());
    final result = await _authRepository.login(loginRequestModel);
    result.fold(
      (failure) {
        emit(LoginPhoneErrorState(message: failure.message));
      },
      (data) {
        ApiConstance.token = data.data.token;
        sl<AppPreferences>().setToken(ApiConstance.token);
        emit(LoginPhoneSuccessState());
      },
    );
  }

  /// This method to login by google
  Future<void> loginByGoogle() async {
    emit(LoginByGoogleLoadingState());
    const List<String> scopes = <String>[
      'email',
      'https://www.googleapis.com/auth/userinfo.email', //	See your primary Google Account email address
      'https://www.googleapis.com/auth/userinfo.profile', //See your personal info, including any personal info you've made publicly available
      'openid',
    ];

    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: scopes,
    );
    try {
      final result = await googleSignIn.signIn();
      final result2 = await result?.authentication;
      log(result2?.accessToken ?? '', name: 'accessToken');
      log(result2?.idToken ?? '', name: 'idToken');
      log(result?.id.toString() ?? '', name: 'id');
      log(result?.email.toString() ?? '', name: 'email');
      log(result?.displayName.toString() ?? '', name: 'displayName');
      log(result?.photoUrl.toString() ?? '', name: 'photoUrl');
      if (result != null) {
        emit(LoginGoogleSuccessState());
      }
    } catch (error) {
      log(error.runtimeType.toString(), name: 'error');
      log(error.toString());
      emit(LoginGoogleErrorState(message: error.toString()));
    }
  }

  /// This method to login by apple
  Future<void> loginByApple() async {
    emit(LoginByAppleLoadingState());
    emit(LoginAppleSuccessState());
  }

  /// This method to clear all controllers and focus nodes
  void clearControllersAndFocusNodes() {
    phoneController.clear();
    passwordController.clear();
    phoneFocusNode.unfocus();
    passwordFocusNode.unfocus();
  }

  /// This method to initialize all controllers and focus nodes
  void initializeControllersAndFocusNodes() {
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    phoneFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
  }

  /// This method to dispose all controllers and focus nodes
  void disposeControllersAndFocusNodes() {
    phoneController.dispose();
    passwordController.dispose();
    phoneFocusNode.dispose();
    passwordFocusNode.dispose();
  }
}
