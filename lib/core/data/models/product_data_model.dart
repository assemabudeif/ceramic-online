import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
import '/features/categories/data/models/categories_model.dart';

// ignore: must_be_immutable
class ProductDataModel extends Equatable {
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
  bool favorite;
  final String name;
  final String description;
  final CategoryModel category;
  int quantity;

  ProductDataModel({
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
    required this.category,
    this.quantity = 1,
  });

  factory ProductDataModel.fromJson(Map<String, dynamic> json) =>
      ProductDataModel(
        id: json["id"] as int,
        price: json["price"]?.toDouble() ?? 0.0,
        image: json["image"] as String,
        categoryId: json["category_id"] as int,
        userId: json["user_id"] ?? 0,
        createdAt: json["created_at"] as String,
        updatedAt: json["updated_at"] as String,
        type: json["type"] ?? "",
        size: json["size"] ?? "",
        vendorId: json["vendor_id"] ?? "",
        favorite: json["favorite"] as bool,
        name: json["name"] as String,
        description: json["description"] as String,
        category: CategoryModel.fromJson(json["category"]),
      );

  ProductDataModel copyWith({
    int? id,
    double? price,
    String? image,
    int? categoryId,
    int? userId,
    String? createdAt,
    String? updatedAt,
    dynamic type,
    dynamic size,
    dynamic vendorId,
    bool? favorite,
    String? name,
    String? description,
    CategoryModel? category,
    int? quantity,
  }) =>
      ProductDataModel(
        id: id ?? this.id,
        price: price ?? this.price,
        image: image ?? this.image,
        categoryId: categoryId ?? this.categoryId,
        userId: userId ?? this.userId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        type: type ?? this.type,
        size: size ?? this.size,
        vendorId: vendorId ?? this.vendorId,
        favorite: favorite ?? this.favorite,
        name: name ?? this.name,
        description: description ?? this.description,
        category: category ?? this.category,
        quantity: quantity ?? this.quantity,
      );

  @override
  List<Object> get props => [
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
        category,
      ];
}
