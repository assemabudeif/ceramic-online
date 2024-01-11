import 'package:bloc/bloc.dart';
import 'package:ceramic_online/core/utilities/dummy.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta/meta.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  List<ProductModel> products = [];
  double heartIconSize = 30.r;
  double favoriteIconSize = 30.r;

  _changeHeartIconSizeWithAnimation(double size) {
    // add zoom animation  to heart icon
    Future.delayed(const Duration(milliseconds: 500), () {
      if (size < 1) {
        heartIconSize = 30.r * size * 2;
      } else {
        heartIconSize = 30.r;
      }
    });
  }

  _changeFavoriteIconSizeWithAnimation() {
// add zoom animation  to favorite icon

    // setState(() {
    //   favoriteIconSize = 45.r;
    // });
    // Future.delayed(const Duration(milliseconds: 500), () {
    //   setState(() {
    //     favoriteIconSize = 40.r;
    //   });
    // });
    // Future.delayed(const Duration(milliseconds: 500), () {
    //   setState(() {
    //     favoriteIconSize = 35.r;
    //   });
    // });
    // Future.delayed(const Duration(milliseconds: 500), () {
    //   setState(() {
    //     favoriteIconSize = 33.r;
    //   });
    // });
    Future.delayed(const Duration(milliseconds: 500), () {
      // setState(() {
      favoriteIconSize = 30.r;
      // });
    });
  }
}
