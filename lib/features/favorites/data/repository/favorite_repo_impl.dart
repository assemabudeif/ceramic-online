import 'package:ceramic_online/core/data/models/message_response_model.dart';
import 'package:dartz/dartz.dart';

import '/core/error/failures.dart';
import '/core/network/api_constance.dart';
import '/core/network/custom_request.dart';
import '/features/favorites/data/models/favorite_model.dart';
import 'favorite_repo.dart';

class FavoriteRepoImpl extends FavoriteRepo {
  @override
  Future<Either<Failure, MessageResponseModel>> addRemoveFavorite(String id) {
    return CustomRequest<MessageResponseModel>(
      path: ApiConstance.addRemoveWishlistPath(),
      fromJson: (json) {
        return MessageResponseModel.fromJson(json);
      },
      data: {
        'product_id': id,
      },
    ).sendPostRequest();
  }

  @override
  Future<Either<Failure, FavoriteModel>> getFavorites() {
    return CustomRequest<FavoriteModel>(
      path: ApiConstance.getWishlistPath(),
      fromJson: (json) {
        return FavoriteModel.fromJson(json);
      },
    ).sendGetRequest();
  }
}
