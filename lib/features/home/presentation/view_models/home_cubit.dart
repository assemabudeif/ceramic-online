import 'package:bloc/bloc.dart';
import 'package:ceramic_online/core/global/language/app_strings.dart';
import 'package:ceramic_online/core/global/widgets/app_snackbars.dart';
import 'package:ceramic_online/features/favorites/data/repository/favorite_repo.dart';
import 'package:get/get.dart';

import '/features/categories/data/models/categories_model.dart';
import '/features/categories/data/repository/categories_repo.dart';
import '/features/home/data/models/sliders_model.dart';
import '/features/home/data/repository/home_repo.dart';
import '/features/products/data/model/all_products_model.dart';
import '/features/products/data/repo/products_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this._homeRepo,
    this._categoriesRepo,
    this._productsRepo,
    this._favoriteRepo,
  ) : super(HomeInitial());

  final HomeRepo _homeRepo;
  final CategoriesRepo _categoriesRepo;
  final ProductsRpo _productsRepo;
  final FavoriteRepo _favoriteRepo;

  SlidersModel? slidersModel;
  String slidersError = '';

  CategoriesModel? categoriesModel;
  String categoriesError = '';

  AllProductsModel? productsModel;
  String productsError = '';

  void init() async {
    await getHomeSliders();
    await getHomeCategories();
    await getHomeProducts();

    emit(HomeInitial());
  }

  void dispose() {
    close();
  }

  Future<void> getHomeSliders() async {
    emit(GetHomeSlidersLoadingState());
    final result = await _homeRepo.getSliders();
    result.fold(
      (failure) {
        slidersError = failure.message;
        emit(GetHomeSlidersErrorState(message: failure.message));
      },
      (data) {
        slidersModel = data;
        emit(GetHomeSlidersSuccessState());
      },
    );
  }

  Future<void> getHomeCategories() async {
    emit(GetHomeCategoriesLoadingState());
    final result = await _categoriesRepo.getCategories(page: 1);
    result.fold(
      (failure) {
        categoriesError = failure.message;
        emit(GetHomeCategoriesErrorState(message: failure.message));
      },
      (data) {
        categoriesModel = data;
        emit(GetHomeCategoriesSuccessState());
      },
    );
  }

  Future<void> getHomeProducts() async {
    emit(GetHomeProductsLoadingState());
    final result = await _productsRepo.getAllProducts(page: 1);
    result.fold(
      (failure) {
        productsError = failure.message;
        emit(GetHomeProductsErrorState(message: failure.message));
      },
      (data) {
        productsModel = data;
        emit(GetHomeProductsSuccessState());
      },
    );
  }

  Future<void> addRemoveFavorite(String id) async {
    emit(AddRemoveHomeFavoriteLoadingState());
    final result = await _favoriteRepo.addRemoveFavorite(id);
    return result.fold(
      (failure) {
        AppSnackBars.showErrorSnackBar(
          message: failure.message,
          title: AppStrings.error.tr,
        );
        emit(AddRemoveHomeFavoriteErrorState(message: failure.message));
      },
      (success) {
        productsModel!.data.data
                .where((element) => element.id == int.parse(id))
                .first
                .favorite =
            !productsModel!.data.data
                .where((element) => element.id == int.parse(id))
                .first
                .favorite;

        AppSnackBars.showSuccessSnackBar(
          message: success.message,
          title: AppStrings.success.tr,
        );

        emit(AddRemoveHomeFavoriteSuccessState());
      },
    );
  }

  changeProductQuantity({
    required String id,
    required int quantity,
  }) {
    emit(ChangeHomeProductQuantityState());
    productsModel!.data.data
        .where((element) => element.id == int.parse(id))
        .first
        .quantity = quantity;
    emit(ChangeHomeProductQuantitySuccessState());
  }

  Future<void> homeRefresh() async {
    categoriesModel = null;
    slidersModel = null;
    productsModel = null;
    slidersError = '';
    categoriesError = '';
    productsError = '';

    emit(HomeRefreshState());

    getHomeSliders();
    getHomeCategories();
    getHomeProducts();
    emit(HomeRefreshState());
  }
}
