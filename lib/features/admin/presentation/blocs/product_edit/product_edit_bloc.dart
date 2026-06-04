import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_edit_event.dart';
part 'product_edit_state.dart';
part 'product_edit_bloc.freezed.dart';

class ProductEditBloc extends Bloc<ProductEditEvent, ProductEditState> {
  ProductEditBloc() : super(const ProductEditState.initial()) {
    on<LoadProductEdit>(_onLoadProductEdit);
  }

  Future<void> _onLoadProductEdit(
    LoadProductEdit event,
    Emitter<ProductEditState> emit,
  ) async {
    emit(const ProductEditState.loading());
    try {
      // TODO: Implement logic here
      await Future.delayed(const Duration(seconds: 1));
      emit(const ProductEditState.success(message: 'Loaded successfully'));
    } catch (e) {
      emit(ProductEditState.failure(message: e.toString()));
    }
  }
}
