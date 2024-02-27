import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/core/data/requests/auth/register_request_model.dart';
import '/core/global/language/app_strings.dart';
import '/features/auth/data/repository/auth_repository.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._authRepository) : super(RegisterInitial());

  final AuthRepository _authRepository;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  late final TextEditingController fullNameController;
  late final TextEditingController phoneController;

  late final FocusNode emailFocusNode;
  late final FocusNode passwordFocusNode;
  late final FocusNode confirmPasswordFocusNode;
  late final FocusNode fullNameFocusNode;
  late final FocusNode phoneFocusNode;
  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;
  bool isTermsAndPolicyAccepted = false;

  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      if (!isTermsAndPolicyAccepted) {
        emit(
            RegisterFailureState(AppStrings.pleaseAgreeToTheTermsAndPolicy.tr));
      } else {
        emit(RegisterLoadingState());
        final RegisterRequestModel registerRequestModel = RegisterRequestModel(
          email: emailController.text,
          password: passwordController.text,
          fullName: fullNameController.text,
          phone: phoneController.text,
          passwordConfirmation: confirmPasswordController.text,
        );
        final result = await _authRepository.register(registerRequestModel);
        result.fold(
          (failure) => emit(RegisterFailureState(failure.message)),
          (success) => emit(RegisterSuccessState()),
        );
      }
    }
  }

  Future<void> togglePasswordVisibility() async {
    emit(RegisterPasswordVisibilityLoadingState());
    isPasswordVisible = !isPasswordVisible;
    emit(RegisterPasswordVisibilitySuccessState());
  }

  Future<void> toggleConfirmPasswordVisibility() async {
    emit(RegisterPasswordVisibilityLoadingState());
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    emit(RegisterPasswordVisibilitySuccessState());
  }

  Future<void> toggleTermsAndPolicy(bool value) async {
    emit(RegisterAgreeTermsLoadingState());
    isTermsAndPolicyAccepted = value;
    emit(RegisterAgreeTermsSuccessState());
  }

  void initControllers() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    fullNameController = TextEditingController();
    phoneController = TextEditingController();
  }

  void initFocusNodes() {
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
    fullNameFocusNode = FocusNode();
    phoneFocusNode = FocusNode();
  }

  void disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    fullNameController.dispose();
    phoneController.dispose();
  }

  void disposeFocusNodes() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    fullNameFocusNode.dispose();
    phoneFocusNode.dispose();
  }
}
