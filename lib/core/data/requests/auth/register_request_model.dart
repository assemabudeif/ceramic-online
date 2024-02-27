import 'package:equatable/equatable.dart';

class RegisterRequestModel extends Equatable {
  final String fullName;
  final String email;
  final String phone;
  final String password;
  final String passwordConfirmation;

  const RegisterRequestModel({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.password,
    required this.passwordConfirmation,
  });

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "email": email,
        "phone": phone,
        "password": password,
        "password_confirmation": passwordConfirmation,
      };

  @override
  List<Object?> get props => [
        fullName,
        email,
        phone,
        password,
        passwordConfirmation,
      ];
}
