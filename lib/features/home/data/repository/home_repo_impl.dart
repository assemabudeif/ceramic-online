import 'package:dartz/dartz.dart';

import '/core/error/failures.dart';
import '/core/network/api_constance.dart';
import '/core/network/custom_request.dart';
import '/features/home/data/models/sliders_model.dart';
import 'home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  @override
  Future<Either<Failure, SlidersModel>> getSliders() async {
    return CustomRequest<SlidersModel>(
      path: ApiConstance.getSlidersPath(),
      fromJson: (json) {
        return SlidersModel.fromJson(json);
      },
    ).sendGetRequest();
  }
}
