import 'package:equatable/equatable.dart';

class SlidersModel extends Equatable {
  final String status;
  final List<SlidersData> data;

  const SlidersModel({
    required this.status,
    required this.data,
  });

  factory SlidersModel.fromJson(Map<String, dynamic> json) => SlidersModel(
        status: json["status"] as String,
        data: json["data"] != null
            ? List<SlidersData>.from(
                json["data"].map((x) => SlidersData.fromJson(x)))
            : [],
      );

  @override
  List<Object> get props => [status, data];
}

class SlidersData extends Equatable {
  final int id;
  final String image;
  final String createdAt;
  final String updatedAt;

  const SlidersData({
    required this.id,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SlidersData.fromJson(Map<String, dynamic> json) => SlidersData(
        id: json["id"] as int,
        image: json["image"] as String,
        createdAt: json["created_at"] as String,
        updatedAt: json["updated_at"] as String,
      );

  @override
  List<Object> get props => [id, image, createdAt, updatedAt];
}
