import 'package:equatable/equatable.dart';

class ResetPasswordRequest extends Equatable {
  final String phone;
  final String newPassword;
  final String confirmPassword;

  const ResetPasswordRequest({
    required this.phone,
    required this.newPassword,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "new_password": newPassword,
        "confirm_password": confirmPassword,
      };

  @override
  List<Object> get props => [
        phone,
        newPassword,
        confirmPassword,
      ];
}
