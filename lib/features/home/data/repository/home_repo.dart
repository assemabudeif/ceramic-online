import 'package:dartz/dartz.dart';

import '/core/error/failures.dart';
import '/features/home/data/models/sliders_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, SlidersModel>> getSliders();
}
