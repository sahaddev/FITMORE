import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_order_event.dart';
part 'my_order_state.dart';
part 'my_order_bloc.freezed.dart';

class MyOrderBloc extends Bloc<MyOrderEvent, MyOrderState> {
  MyOrderBloc() : super(const MyOrderState.initial()) {
    on<LoadMyOrder>(_onLoadMyOrder);
  }

  Future<void> _onLoadMyOrder(
    LoadMyOrder event,
    Emitter<MyOrderState> emit,
  ) async {
    emit(const MyOrderState.loading());
    try {
      // TODO: Implement logic here
      await Future.delayed(const Duration(seconds: 1));
      emit(const MyOrderState.success(message: 'Loaded successfully'));
    } catch (e) {
      emit(MyOrderState.failure(message: e.toString()));
    }
  }
}
