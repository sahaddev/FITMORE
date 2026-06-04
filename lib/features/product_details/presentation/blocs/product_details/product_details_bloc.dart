import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';
part 'product_details_bloc.freezed.dart';

class ProductDetailsBloc extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc() : super(const ProductDetailsState.initial()) {
    on<LoadProductDetails>(_onLoadProductDetails);
  }

  Future<void> _onLoadProductDetails(
    LoadProductDetails event,
    Emitter<ProductDetailsState> emit,
  ) async {
    emit(const ProductDetailsState.loading());
    try {
      // TODO: Implement logic here
      await Future.delayed(const Duration(seconds: 1));
      emit(const ProductDetailsState.success(message: 'Loaded successfully'));
    } catch (e) {
      emit(ProductDetailsState.failure(message: e.toString()));
    }
  }
}
