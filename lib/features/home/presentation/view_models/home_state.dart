part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetHomeSlidersLoadingState extends HomeState {}

class GetHomeSlidersSuccessState extends HomeState {}

class GetHomeSlidersErrorState extends HomeState {
  final String message;

  GetHomeSlidersErrorState({required this.message});
}

class GetHomeCategoriesLoadingState extends HomeState {}

class GetHomeCategoriesSuccessState extends HomeState {}

class GetHomeCategoriesErrorState extends HomeState {
  final String message;

  GetHomeCategoriesErrorState({required this.message});
}

class GetHomeProductsLoadingState extends HomeState {}

class GetHomeProductsSuccessState extends HomeState {}

class GetHomeProductsErrorState extends HomeState {
  final String message;

  GetHomeProductsErrorState({required this.message});
}

class HomeRefreshState extends HomeState {}

class AddRemoveHomeFavoriteLoadingState extends HomeState {}

class AddRemoveHomeFavoriteSuccessState extends HomeState {}

class AddRemoveHomeFavoriteErrorState extends HomeState {
  final String message;

  AddRemoveHomeFavoriteErrorState({required this.message});
}

class ChangeHomeProductQuantityState extends HomeState {}

class ChangeHomeProductQuantitySuccessState extends HomeState {}
