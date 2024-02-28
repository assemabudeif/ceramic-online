import 'package:ceramic_online/core/data/models/message_response_model.dart';
import 'package:dartz/dartz.dart';

import '/core/data/requests/auth/login_request_model.dart';
import '/core/data/requests/auth/register_request_model.dart';
import '/core/error/failures.dart';
import '/features/auth/data/models/login_model.dart';
import '/features/auth/data/models/profile_model.dart';
import '/features/auth/data/models/register_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, RegisterModel>> register(
    RegisterRequestModel registerRequestModel,
  );

  Future<Either<Failure, LoginModel>> login(
    LoginRequestModel loginRequestModel,
  );

  Future<Either<Failure, MessageResponseModel>> logout();
  Future<Either<Failure, ProfileModel>> getProfileDetails();
}
