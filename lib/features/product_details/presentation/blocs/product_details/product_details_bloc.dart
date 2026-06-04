import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/models/product/db_product_model.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';
part 'product_details_bloc.freezed.dart';

class ProductDetailsBloc extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc() : super(const ProductDetailsState.initial()) {
    on<LoadProductDetails>(_onLoadProductDetails);
    on<FetchProductList>(_onFetchProductList);
    on<ToggleFavorite>(_onToggleFavorite);
    on<AddToCart>(_onAddToCart);
  }

  Future<void> _onLoadProductDetails(
    LoadProductDetails event,
    Emitter<ProductDetailsState> emit,
  ) async {
    emit(const ProductDetailsState.loading());
    try {
      // TODO: Implement logic here
      emit(const ProductDetailsState.loaded([], false, false));
    } catch (e) {
      emit(ProductDetailsState.failure(message: e.toString()));
    }
  }

  Future<void> _onFetchProductList(
    FetchProductList event,
    Emitter<ProductDetailsState> emit,
  ) async {
    emit(const ProductDetailsState.loading());
    try {
      // TODO: Implement logic here
      emit(const ProductDetailsState.loaded([], false, false));
    } catch (e) {
      emit(ProductDetailsState.failure(message: e.toString()));
    }
  }

  Future<void> _onToggleFavorite(
    ToggleFavorite event,
    Emitter<ProductDetailsState> emit,
  ) async {
    emit(const ProductDetailsState.loading());
    try {
      // TODO: Implement logic here
      emit(const ProductDetailsState.success(message: 'Favorite toggled'));
    } catch (e) {
      emit(ProductDetailsState.failure(message: e.toString()));
    }
  }

  Future<void> _onAddToCart(
    AddToCart event,
    Emitter<ProductDetailsState> emit,
  ) async {
    emit(const ProductDetailsState.loading());
    try {
      // TODO: Implement logic here
      emit(const ProductDetailsState.success(message: 'Added to cart'));
    } catch (e) {
      emit(ProductDetailsState.failure(message: e.toString()));
    }
  }
}
