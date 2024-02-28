import 'package:equatable/equatable.dart';

import '/core/data/models/user_model.dart';

class LoginModel extends Equatable {
  final String status;
  final LoginDataModel data;

  const LoginModel({
    required this.status,
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"] as String,
        data: LoginDataModel.fromJson(json["data"]),
      );

  @override
  List<Object?> get props => [
        status,
        data,
      ];
}

class LoginDataModel extends Equatable {
  final String token;
  final UserModel user;

  const LoginDataModel({
    required this.token,
    required this.user,
  });

  factory LoginDataModel.fromJson(Map<String, dynamic> json) => LoginDataModel(
        token: json["token"] as String,
        user: UserModel.fromJson(json["user"]),
      );

  @override
  List<Object?> get props => [
        token,
        user,
      ];
}
