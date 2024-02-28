import 'package:equatable/equatable.dart';

class CategoriesModel extends Equatable {
  final String status;
  final CategoriesDataModel data;

  const CategoriesModel({
    required this.status,
    required this.data,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        status: json["status"] as String,
        data: CategoriesDataModel.fromJson(json["data"]),
      );

  @override
  List<Object> get props => [status, data];
}

class CategoriesDataModel extends Equatable {
  final int currentPage;
  final List<CategoryModel> data;
  final int from;
  final int lastPage;
  final int to;
  final int total;

  const CategoriesDataModel({
    required this.currentPage,
    required this.data,
    required this.from,
    required this.lastPage,
    required this.to,
    required this.total,
  });

  factory CategoriesDataModel.fromJson(Map<String, dynamic> json) =>
      CategoriesDataModel(
        currentPage: json["current_page"] as int,
        data: json["data"] != null
            ? List<CategoryModel>.from(
                json["data"].map((x) => CategoryModel.fromJson(x)))
            : [],
        from: json["from"] as int,
        lastPage: json["last_page"] as int,
        to: json["to"] as int,
        total: json["total"] as int,
      );

  @override
  List<Object> get props => [
        currentPage,
        data,
        from,
        lastPage,
        to,
        total,
      ];
}

class CategoryModel extends Equatable {
  final int id;
  final String createdAt;
  final String updatedAt;
  final String name;
  final List<Translation> translations;

  const CategoryModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.translations,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"] as int,
        createdAt: json["created_at"] as String,
        updatedAt: json["updated_at"] as String,
        name: json["name"] as String,
        translations: json["translations"] != null
            ? List<Translation>.from(
                json["translations"].map((x) => Translation.fromJson(x)))
            : [],
      );

  @override
  List<Object> get props => [id, createdAt, updatedAt, name, translations];
}

class Translation extends Equatable {
  final int id;
  final int categoryId;
  final String locale;
  final String name;
  final String createdAt;
  final String updatedAt;

  const Translation({
    required this.id,
    required this.categoryId,
    required this.locale,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        id: json["id"] as int,
        categoryId: json["category_id"] as int,
        locale: json["locale"] as String,
        name: json["name"] as String,
        createdAt: json["created_at"] as String,
        updatedAt: json["updated_at"] as String,
      );

  @override
  List<Object> get props => [
        id,
        categoryId,
        locale,
        name,
        createdAt,
        updatedAt,
      ];
}
