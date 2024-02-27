import 'package:dartz/dartz.dart';

import '/core/error/failures.dart';
import '/features/categories/data/models/categories_model.dart';

abstract class CategoriesRepo {
  Future<Either<Failure, CategoriesModel>> getCategories({required int page});
}
