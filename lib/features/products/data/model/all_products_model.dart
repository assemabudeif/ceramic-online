import 'package:equatable/equatable.dart';

import '/core/data/models/product_data_model.dart';

class AllProductsModel extends Equatable {
  final String status;
  final AllProductsData data;

  const AllProductsModel({
    required this.status,
    required this.data,
  });

  factory AllProductsModel.fromJson(Map<String, dynamic> json) =>
      AllProductsModel(
        status: json["status"] as String,
        data: AllProductsData.fromJson(json["data"]),
      );

  @override
  List<Object> get props => [status, data];
}

class AllProductsData extends Equatable {
  final int currentPage;
  final List<ProductDataModel> data;
  final int lastPage;
  final int total;

  const AllProductsData({
    required this.currentPage,
    required this.data,
    required this.lastPage,
    required this.total,
  });

  factory AllProductsData.fromJson(Map<String, dynamic> json) =>
      AllProductsData(
        currentPage: json["current_page"] as int,
        data: json["data"] != null
            ? List<ProductDataModel>.from(
                json["data"].map((x) => ProductDataModel.fromJson(x)))
            : [],
        lastPage: json["last_page"] as int,
        total: json["total"] as int,
      );

  @override
  List<Object> get props => [currentPage, data, lastPage, total];
}
