import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int id;
  final String fullName;
  final String email;
  final String phone;
  final String createdAt;
  final String updatedAt;

  const UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"] as int,
        fullName: json["full_name"] as String,
        email: json["email"] as String,
        phone: json["phone"] as String,
        createdAt: json["created_at"] as String,
        updatedAt: json["updated_at"] as String,
      );

  @override
  List<Object?> get props => [
        id,
        fullName,
        email,
        phone,
        createdAt,
        updatedAt,
      ];
}
