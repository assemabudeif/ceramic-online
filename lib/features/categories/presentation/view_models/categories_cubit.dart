import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '/features/categories/data/models/categories_model.dart';
import '/features/categories/data/repository/categories_repo.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._categoriesRepo) : super(CategoriesInitial());

  final CategoriesRepo _categoriesRepo;
  int pageKey = 1;

  PagingController<int, CategoryModel> pagingController = PagingController(
    firstPageKey: 0,
    invisibleItemsThreshold: 5,
  );

  CategoriesModel? categoriesModel;
  String categoriesError = '';
  bool isLastPage = false;

  Future<void> getAllCategories() async {
    if (!isLastPage) {
      emit(GetCategoriesLoadingState());
      final result = await _categoriesRepo.getCategories(page: pageKey);
      result.fold(
        (failure) {
          categoriesError = failure.message;
          emit(GetCategoriesErrorState(message: failure.message));
        },
        (data) {
          log(data.data.currentPage.toString(), name: 'Category Page');

          categoriesModel = data;
          if (data.data.currentPage == data.data.lastPage) {
            isLastPage = true;
            pageKey++;
            pagingController.appendLastPage(data.data.data);
          } else {
            pageKey++;
            pagingController.appendPage(data.data.data, pageKey);
          }

          emit(GetCategoriesSuccessState());
        },
      );
    }
  }
}
