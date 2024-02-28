import 'package:equatable/equatable.dart';

import '/core/data/models/user_model.dart';

class RegisterModel extends Equatable {
  final String status;
  final UserModel userData;

  const RegisterModel({
    required this.status,
    required this.userData,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        status: json["status"] as String,
        userData: UserModel.fromJson(json["data"]),
      );

  @override
  List<Object?> get props => [
        status,
        userData,
      ];
}
