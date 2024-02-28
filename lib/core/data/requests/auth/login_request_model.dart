import 'package:equatable/equatable.dart';

class LoginRequestModel extends Equatable {
  final String phone;
  final String password;

  const LoginRequestModel({
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "password": password,
      };

  @override
  List<Object?> get props => [
        phone,
        password,
      ];
}
