part of 'favorite_cubit.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteChangeHeartBrokenSizeLoadingState extends FavoriteState {}

class FavoriteChangeHeartBrokenSizeSuccessState extends FavoriteState {}

class FavoriteChangeHeartBrokenSizeErrorState extends FavoriteState {}
