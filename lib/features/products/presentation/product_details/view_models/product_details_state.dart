part of 'product_details_cubit.dart';

class ProductDetailsState extends Equatable {
  const ProductDetailsState();

  @override
  List<Object> get props => [];
}

class ProductDetailsInitial extends ProductDetailsState {}

class GetProductDetailsLoadingState extends ProductDetailsState {}

class GetProductDetailsSuccessState extends ProductDetailsState {}

class GetProductDetailsErrorState extends ProductDetailsState {
  final String message;

  const GetProductDetailsErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
