import 'package:dartz/dartz.dart';

import '/core/error/failures.dart';
import '/core/network/api_constance.dart';
import '/core/network/custom_request.dart';
import '/features/categories/data/models/categories_model.dart';
import 'categories_repo.dart';

class CategoriesRepoImpl extends CategoriesRepo {
  @override
  Future<Either<Failure, CategoriesModel>> getCategories({
    required int page,
  }) async {
    return CustomRequest<CategoriesModel>(
      path: ApiConstance.getCategoriesPath(),
      fromJson: (json) {
        return CategoriesModel.fromJson(json);
      },
      queryParameters: {
        "page": page,
      },
    ).sendGetRequest();
  }
}
