import 'package:equatable/equatable.dart';

import '/core/data/models/product_data_model.dart';
import '/features/categories/data/models/categories_model.dart';

class FavoriteModel extends Equatable {
  final String status;
  final List<ProductDataModel> data;

  const FavoriteModel({
    required this.status,
    required this.data,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
        status: json["status"] as String,
        data: json["data"] != null
            ? List<ProductDataModel>.from(
                json["data"].map((x) => ProductDataModel.fromJson(x)))
            : [],
      );

  @override
  List<Object?> get props => [status, data];
}

class FavoriteDataModel extends Equatable {
  final int id;
  final double price;
  final String image;
  final int categoryId;
  final int userId;
  final String createdAt;
  final String updatedAt;
  final dynamic type;
  final dynamic size;
  final dynamic vendorId;
  final bool favorite;
  final String name;
  final String description;
  final Pivot pivot;
  final CategoryModel category;

  const FavoriteDataModel({
    required this.id,
    required this.price,
    required this.image,
    required this.categoryId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.type,
    required this.size,
    required this.vendorId,
    required this.favorite,
    required this.name,
    required this.description,
    required this.pivot,
    required this.category,
  });

  factory FavoriteDataModel.fromJson(Map<String, dynamic> json) =>
      FavoriteDataModel(
        id: json["id"] as int,
        price: json["price"]?.toDouble() ?? 0.0,
        image: json["image"] as String,
        categoryId: json["category_id"] as int,
        userId: json["user_id"] as int,
        createdAt: json["created_at"] as String,
        updatedAt: json["updated_at"] as String,
        type: json["type"] ?? "",
        size: json["size"] ?? "",
        vendorId: json["vendor_id"] ?? "",
        favorite: json["favorite"] as bool,
        name: json["name"] as String,
        description: json["description"] as String,
        pivot: Pivot.fromJson(json["pivot"]),
        category: CategoryModel.fromJson(json["category"]),
      );

  @override
  List<Object?> get props => [
        id,
        price,
        image,
        categoryId,
        userId,
        createdAt,
        updatedAt,
        type,
        size,
        vendorId,
        favorite,
        name,
        description,
        pivot,
        category,
      ];
}

class Pivot extends Equatable {
  final int clientId;
  final int productId;

  const Pivot({
    required this.clientId,
    required this.productId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        clientId: json["client_id"] as int,
        productId: json["product_id"] as int,
      );

  @override
  List<Object?> get props => [clientId, productId];
}
