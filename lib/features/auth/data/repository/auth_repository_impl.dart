import 'package:ceramic_online/core/data/models/message_response_model.dart';
import 'package:dartz/dartz.dart';

import '/core/data/requests/auth/login_request_model.dart';
import '/core/data/requests/auth/register_request_model.dart';
import '/core/error/failures.dart';
import '/core/network/api_constance.dart';
import '/core/network/custom_request.dart';
import '/features/auth/data/models/login_model.dart';
import '/features/auth/data/models/profile_model.dart';
import '/features/auth/data/models/register_model.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Failure, LoginModel>> login(
    LoginRequestModel loginRequestModel,
  ) {
    return CustomRequest<LoginModel>(
      path: ApiConstance.loginPath(),
      fromJson: (json) {
        return LoginModel.fromJson(json);
      },
      data: loginRequestModel.toJson(),
    ).sendPostRequest();
  }

  @override
  Future<Either<Failure, MessageResponseModel>> logout() async {
    return CustomRequest<MessageResponseModel>(
      path: ApiConstance.loginPath(),
      fromJson: (json) {
        return MessageResponseModel.fromJson(json);
      },
    ).sendGetRequest();
  }

  @override
  Future<Either<Failure, RegisterModel>> register(
    RegisterRequestModel registerRequestModel,
  ) async {
    return CustomRequest<RegisterModel>(
      path: ApiConstance.registerPath(),
      fromJson: (json) {
        return RegisterModel.fromJson(json);
      },
      data: registerRequestModel.toJson(),
    ).sendPostRequest();
  }

  @override
  Future<Either<Failure, ProfileModel>> getProfileDetails() async {
    return CustomRequest<ProfileModel>(
      path: ApiConstance.getProfileDetailsPath(),
      fromJson: (json) {
        return ProfileModel.fromJson(json);
      },
    ).sendGetRequest();
  }
}
