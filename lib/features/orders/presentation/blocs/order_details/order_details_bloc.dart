import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_details_event.dart';
part 'order_details_state.dart';
part 'order_details_bloc.freezed.dart';

class OrderDetailsBloc extends Bloc<OrderDetailsEvent, OrderDetailsState> {
  OrderDetailsBloc() : super(const OrderDetailsState.initial()) {
    on<LoadOrderDetails>(_onLoadOrderDetails);
  }

  Future<void> _onLoadOrderDetails(
    LoadOrderDetails event,
    Emitter<OrderDetailsState> emit,
  ) async {
    emit(const OrderDetailsState.loading());
    try {
      // TODO: Implement logic here
      await Future.delayed(const Duration(seconds: 1));
      emit(const OrderDetailsState.success(message: 'Loaded successfully'));
    } catch (e) {
      emit(OrderDetailsState.failure(message: e.toString()));
    }
  }
}
