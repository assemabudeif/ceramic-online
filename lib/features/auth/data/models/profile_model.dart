import '/core/data/models/user_model.dart';

class ProfileModel {
  final String status;
  final UserModel userData;

  ProfileModel({
    required this.status,
    required this.userData,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      status: json['status'] as String,
      userData: UserModel.fromJson(json['data']),
    );
  }
}
