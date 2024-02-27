import 'package:dartz/dartz.dart';

import '/core/error/failures.dart';
import '/core/network/api_constance.dart';
import '/core/network/custom_request.dart';
import '/features/products/data/model/all_products_model.dart';
import '/features/products/data/model/single_product_model.dart';
import 'products_repo.dart';

class ProductsRpoImpl extends ProductsRpo {
  @override
  Future<Either<Failure, AllProductsModel>> getAllProducts({
    required int page,
  }) async {
    return CustomRequest<AllProductsModel>(
      path: ApiConstance.getProductsPath(),
      queryParameters: {
        "page": page,
      },
      fromJson: (json) => AllProductsModel.fromJson(json),
    ).sendGetRequest();
  }

  @override
  Future<Either<Failure, SingleProductModel>> getSingleProduct({
    required int productId,
  }) async {
    return CustomRequest<SingleProductModel>(
      path: ApiConstance.showSingleProductPath(productId),
      fromJson: (json) {
        return SingleProductModel.fromJson(json);
      },
    ).sendGetRequest();
  }
}
