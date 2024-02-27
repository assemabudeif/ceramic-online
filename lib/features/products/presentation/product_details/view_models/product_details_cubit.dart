import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '/features/products/data/model/single_product_model.dart';
import '/features/products/data/repo/products_repo.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this._productsRpo) : super(ProductDetailsInitial());

  final ProductsRpo _productsRpo;

  SingleProductModel? productModel;
  String productErrorMessage = '';

  Future<void> getProductDetails(int productId) async {
    emit(GetProductDetailsLoadingState());
    final result = await _productsRpo.getSingleProduct(productId: productId);

    result.fold(
      (error) {
        productErrorMessage = error.message;
        emit(GetProductDetailsErrorState(message: error.message));
      },
      (product) {
        productModel = product;
        emit(GetProductDetailsSuccessState());
      },
    );
  }
}
