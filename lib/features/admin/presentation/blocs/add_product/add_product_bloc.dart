import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_product_event.dart';
part 'add_product_state.dart';
part 'add_product_bloc.freezed.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  AddProductBloc() : super(const AddProductState.initial()) {
    on<LoadAddProduct>(_onLoadAddProduct);
  }

  Future<void> _onLoadAddProduct(
    LoadAddProduct event,
    Emitter<AddProductState> emit,
  ) async {
    emit(const AddProductState.loading());
    try {
      // TODO: Implement logic here
      await Future.delayed(const Duration(seconds: 1));
      emit(const AddProductState.success(message: 'Loaded successfully'));
    } catch (e) {
      emit(AddProductState.failure(message: e.toString()));
    }
  }
}
