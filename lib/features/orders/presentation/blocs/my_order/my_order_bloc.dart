import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/models/order_history/order_history_model.dart';

part 'my_order_event.dart';
part 'my_order_state.dart';
part 'my_order_bloc.freezed.dart';

class MyOrderBloc extends Bloc<MyOrderEvent, MyOrderState> {
  MyOrderBloc() : super(const MyOrderState.initial()) {
    on<LoadMyOrder>(_onLoadMyOrder);
    on<GetAllOrders>(_onGetAllOrders);
    on<ReOrder>(_onReOrder);
  }

  Future<void> _onLoadMyOrder(
    LoadMyOrder event,
    Emitter<MyOrderState> emit,
  ) async {
    emit(const MyOrderState.loading());
    try {
      emit(const MyOrderState.loaded([]));
    } catch (e) {
      emit(MyOrderState.failure(message: e.toString()));
    }
  }

  Future<void> _onGetAllOrders(
    GetAllOrders event,
    Emitter<MyOrderState> emit,
  ) async {
    List<OrderhistoryModel> currentOrders = [];
    state.maybeWhen(loaded: (items) => currentOrders = items, orElse: () {});

    emit(const MyOrderState.loading());
    try {
      emit(MyOrderState.loaded(currentOrders));
    } catch (e) {
      emit(MyOrderState.failure(message: e.toString()));
    }
  }

  Future<void> _onReOrder(ReOrder event, Emitter<MyOrderState> emit) async {
    List<OrderhistoryModel> currentOrders = [];
    state.maybeWhen(
      loaded: (items) => currentOrders = List.from(items),
      orElse: () {},
    );

    emit(const MyOrderState.loading());
    try {
      final newOrder = OrderhistoryModel(
        id: DateTime.now().millisecondsSinceEpoch,
        image: event.order.image,
        title: event.order.title,
        price: event.order.price,
      );

      currentOrders.insert(0, newOrder);
      emit(const MyOrderState.success(message: 'Re-ordered successfully'));
      emit(MyOrderState.loaded(currentOrders));
    } catch (e) {
      emit(MyOrderState.failure(message: e.toString()));
    }
  }
}
