import 'assets_data.dart';

//
//* Category Dummy Model
//
class CategoryModel {
  final String name;
  final String image;

  CategoryModel({
    required this.name,
    required this.image,
  });
}

//
//* Product Dummy Model
//
class ProductModel {
  final String name;
  final String image;
  final String price;
  final String description;
  int quantity;

  ProductModel({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.quantity,
  });
}

//
//* Dummy Data
//

//* Dummy Products
final List<ProductModel> kDummyProducts = [
  for (int i = 0; i < 10; i++)
    ProductModel(
      name: 'Ceramic Black',
      image: AssetsData.productCeramicSVG,
      price: '22.00',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
      quantity: 1,
    ),
];

//* Dummy Categories
final List<CategoryModel> kDummyCategories = [
  CategoryModel(
    name: 'Ceramic',
    image: AssetsData.ceramicCategoryIconSVG,
  ),
  CategoryModel(
    name: 'Tap',
    image: AssetsData.tapCategoryIconSVG,
  ),
  CategoryModel(
    name: 'Ceramic',
    image: AssetsData.ceramicCategoryIconSVG,
  ),
  CategoryModel(
    name: 'Tap',
    image: AssetsData.tapCategoryIconSVG,
  ),
  CategoryModel(
    name: 'Ceramic',
    image: AssetsData.ceramicCategoryIconSVG,
  ),
  CategoryModel(
    name: 'Tap',
    image: AssetsData.tapCategoryIconSVG,
  ),
  CategoryModel(
    name: 'Ceramic',
    image: AssetsData.ceramicCategoryIconSVG,
  ),
  CategoryModel(
    name: 'Tap',
    image: AssetsData.tapCategoryIconSVG,
  ),
  CategoryModel(
    name: 'Ceramic',
    image: AssetsData.ceramicCategoryIconSVG,
  ),
  CategoryModel(
    name: 'Tap',
    image: AssetsData.tapCategoryIconSVG,
  ),
  CategoryModel(
    name: 'Ceramic',
    image: AssetsData.ceramicCategoryIconSVG,
  ),
  CategoryModel(
    name: 'Tap',
    image: AssetsData.tapCategoryIconSVG,
  ),
];
