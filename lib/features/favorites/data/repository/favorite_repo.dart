import 'package:ceramic_online/core/data/models/message_response_model.dart';
import 'package:dartz/dartz.dart';

import '/core/error/failures.dart';
import '/features/favorites/data/models/favorite_model.dart';

abstract class FavoriteRepo {
  Future<Either<Failure, MessageResponseModel>> addRemoveFavorite(String id);

  Future<Either<Failure, FavoriteModel>> getFavorites();
}
