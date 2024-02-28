import 'package:equatable/equatable.dart';

import '/core/data/models/product_data_model.dart';

class SingleProductModel extends Equatable {
  final String status;
  final ProductDataModel data;

  const SingleProductModel({
    required this.status,
    required this.data,
  });

  factory SingleProductModel.fromJson(Map<String, dynamic> json) =>
      SingleProductModel(
        status: json["status"] as String,
        data: ProductDataModel.fromJson(json["data"]),
      );

  @override
  List<Object> get props => [status, data];
}
