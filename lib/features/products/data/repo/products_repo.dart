import 'package:dartz/dartz.dart';

import '/core/error/failures.dart';
import '/features/products/data/model/all_products_model.dart';
import '/features/products/data/model/single_product_model.dart';

abstract class ProductsRpo {
  Future<Either<Failure, AllProductsModel>> getAllProducts({required int page});

  Future<Either<Failure, SingleProductModel>> getSingleProduct({
    required int productId,
  });
}
