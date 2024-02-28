import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '/core/global/language/app_strings.dart';
import '/core/global/widgets/app_snackbars.dart';
import '/core/services/app_prefs.dart';
import '/core/services/services_locator.dart';
import '/core/utilities/routes_manger.dart';
import '/features/auth/data/models/profile_model.dart';
import '/features/auth/data/repository/auth_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._authRepository) : super(ProfileInitial());

  final AuthRepository _authRepository;

  ProfileModel? profileModel;
  String profileError = '';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController somethingAboutController;
  late TextEditingController genderController;
  late TextEditingController phoneController;
  late TextEditingController emailController;

  /// This method to init cubit
  init() {
    // getProfileDetails();

    _initControllers();
  }

  dispose() {
    _disposeControllers();
  }

  /// This method to init controllers
  _initControllers() {
    somethingAboutController = TextEditingController();
    genderController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
  }

  /// This method to dispose controllers
  _disposeControllers() {
    somethingAboutController.dispose();
    genderController.dispose();
    phoneController.dispose();
    emailController.dispose();
  }

  /// This method to get profile details
  Future<void> getProfileDetails() async {
    emit(ProfileDetailsLoadingState());
    final result = await _authRepository.getProfileDetails();
    result.fold(
      (failure) {
        profileError = failure.message;
        emit(ProfileDetailsFailureState(message: failure.message));
      },
      (data) {
        profileModel = data;
        phoneController.text = data.userData.phone;
        emailController.text = data.userData.email;
        emit(ProfileDetailsSuccessState());
      },
    );
  }

  /// This method to logout
  Future<void> logout() async {
    emit(ProfileLogoutLoadingState());
    final result = await _authRepository.logout();
    result.fold(
      (failure) {
        emit(ProfileLogoutFailureState(message: failure.message));
      },
      (data) {
        _removeToken();
        AppSnackBars.showSuccessSnackBar(
          message: data.message,
          title: AppStrings.success.tr,
        );
        Get.offAllNamed(Routes.splashPath);
        emit(ProfileLogoutSuccessState(message: data.message));
      },
    );
  }

  _removeToken() async {
    await sl<AppPreferences>().removeToken();
  }
}
