import 'package:equatable/equatable.dart';

class GovernmentsRegionsModel extends Equatable {
  final String status;
  final List<GovernmentsRegionsDataModel> data;

  const GovernmentsRegionsModel({
    required this.status,
    required this.data,
  });

  factory GovernmentsRegionsModel.fromJson(Map<String, dynamic> json) =>
      GovernmentsRegionsModel(
        status: json["status"] as String,
        data: json["data"] != null
            ? List<GovernmentsRegionsDataModel>.from(json["data"]
                .map((x) => GovernmentsRegionsDataModel.fromJson(x)))
            : [],
      );

  @override
  List<Object> get props => [status, data];
}

class GovernmentsRegionsDataModel extends Equatable {
  final int id;
  final String name;
  final int gouvernmentId;

  const GovernmentsRegionsDataModel({
    required this.id,
    required this.name,
    required this.gouvernmentId,
  });

  factory GovernmentsRegionsDataModel.fromJson(Map<String, dynamic> json) =>
      GovernmentsRegionsDataModel(
        id: json["id"] as int,
        name: json["name"] as String,
        gouvernmentId: json["gouvernment_id"] as int,
      );

  @override
  List<Object> get props => [id, name, gouvernmentId];
}
