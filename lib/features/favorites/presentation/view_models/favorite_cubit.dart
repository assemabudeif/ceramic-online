import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '/core/data/models/product_data_model.dart';
import '/core/global/language/app_strings.dart';
import '/core/global/widgets/app_snackbars.dart';
import '/features/favorites/data/models/favorite_model.dart';
import '/features/favorites/data/repository/favorite_repo.dart';
import '/features/products/data/model/all_products_model.dart';
import '/features/products/data/repo/products_repo.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(
    this._productsRpo,
    this._favoritesRpo,
  ) : super(FavoriteInitial());

  final ProductsRpo _productsRpo;
  final FavoriteRepo _favoritesRpo;

  AllProductsModel? allProductsModel;
  List<ProductDataModel> products = [];
  String allProductsErrors = '';

  FavoriteModel? favoriteModel;
  String favoriteErrors = '';

  double favoriteIconSize = 30.w;

  double heartIconSize = 30.w;
  final List<double> _sizes = [30.w, 35.w, 40.w, 45.w, 40.w, 35.w, 30.w];

  Future<void> getFavorites() async {
    favoriteModel = null;
    favoriteErrors = '';
    emit(GetFavoriteLoadingState());
    final result = await _favoritesRpo.getFavorites();
    result.fold(
      (failure) {
        favoriteErrors = failure.message;
        emit(GetFavoriteErrorState(failure.message));
      },
      (favorites) {
        favoriteModel = favorites;
        emit(GetFavoriteSuccessState());
      },
    );
  }

  Future<String> addRemoveFavorite(String id) async {
    emit(AddRemoveFavoriteLoadingState());
    final result = await _favoritesRpo.addRemoveFavorite(id);
    return result.fold(
      (failure) {
        emit(AddRemoveFavoriteErrorState(failure.message));
        return failure.message;
      },
      (success) {
        products.removeWhere((element) => element.id.toString() == id);
        emit(AddRemoveFavoriteSuccessState());

        getFavorites();
        return success.message;
      },
    );
  }

  Future<void> getProducts() async {
    products = [];
    allProductsModel = null;
    allProductsErrors = '';
    emit(GetProductsLoadingState());
    final result = await _productsRpo.getAllProducts(page: 1);
    result.fold(
      (failure) {
        allProductsErrors = failure.message;
        emit(GetProductsErrorState(failure.message));
      },
      (data) {
        allProductsModel = data;
        products =
            data.data.data.where((element) => !element.favorite).toList();
        emit(GetProductsSuccessState());
      },
    );
  }

  onDismissLeftToRight(String id) async {
    try {
      final result = await addRemoveFavorite(id);
      if (result.contains('Successfully')) {
        getFavorites();
        _changeFavoriteIconSizeWithAnimation();
      } else {
        emit(AddRemoveFavoriteErrorState(result));
        AppSnackBars.showErrorSnackBar(
          message: result,
          title: AppStrings.error.tr,
        );
      }
    } catch (e) {
      log(e.toString(), name: 'Dismiss Left To Right');
    }
  }

  onDismissRightToLeft(String id) async {
    products.removeWhere((element) => element.id.toString() == id);

    _changeHeartIconSizeWithAnimation();
  }

  favoriteRefresh() {
    getFavorites();
    getProducts();
  }

  _changeHeartIconSizeWithAnimation() async {
    for (var size in _sizes) {
      emit(ChangeFavIconSizeInitialState());
      await Future.delayed(const Duration(milliseconds: 50), () {
        heartIconSize = size;
      });
      emit(ChangeFavIconSizeState());
    }
  }

  _changeFavoriteIconSizeWithAnimation() async {
    for (var size in _sizes) {
      emit(ChangeFavIconSizeInitialState());
      await Future.delayed(const Duration(milliseconds: 50), () {
        favoriteIconSize = size;
        log(favoriteIconSize.toString(), name: 'Favorite Icon Size');
      });
      emit(ChangeFavIconSizeState());
    }
  }
}
