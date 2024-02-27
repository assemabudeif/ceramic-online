import 'package:equatable/equatable.dart';

class GovernmentsModel extends Equatable {
  final String status;
  final List<GovernmentsDataModel> data;

  const GovernmentsModel({
    required this.status,
    required this.data,
  });

  factory GovernmentsModel.fromJson(Map<String, dynamic> json) =>
      GovernmentsModel(
        status: json["status"] as String,
        data: json["data"] != null
            ? List<GovernmentsDataModel>.from(
                json["data"].map((x) => GovernmentsDataModel.fromJson(x)))
            : [],
      );

  @override
  List<Object> get props => [status, data];
}

class GovernmentsDataModel extends Equatable {
  final int id;
  final String name;

  const GovernmentsDataModel({
    required this.id,
    required this.name,
  });

  factory GovernmentsDataModel.fromJson(Map<String, dynamic> json) =>
      GovernmentsDataModel(
        id: json["id"] as int,
        name: json["name"] as String,
      );

  @override
  List<Object> get props => [id, name];
}
