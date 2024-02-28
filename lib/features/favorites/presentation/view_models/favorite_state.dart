part of 'favorite_cubit.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class GetFavoriteLoadingState extends FavoriteState {}

class GetFavoriteSuccessState extends FavoriteState {}

class GetFavoriteErrorState extends FavoriteState {
  final String message;

  GetFavoriteErrorState(this.message);
}

class AddRemoveFavoriteLoadingState extends FavoriteState {}

class AddRemoveFavoriteSuccessState extends FavoriteState {}

class AddRemoveFavoriteErrorState extends FavoriteState {
  final String message;

  AddRemoveFavoriteErrorState(this.message);
}

class GetProductsLoadingState extends FavoriteState {}

class GetProductsSuccessState extends FavoriteState {}

class GetProductsErrorState extends FavoriteState {
  final String message;

  GetProductsErrorState(this.message);
}

class ChangeFavIconSizeInitialState extends FavoriteState {}

class ChangeFavIconSizeState extends FavoriteState {}
