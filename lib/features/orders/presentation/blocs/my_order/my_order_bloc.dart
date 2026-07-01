import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../domain/entities/order_entity.dart';
import '../../../domain/repositories/orders_repositories.dart';

part 'my_order_event.dart';
part 'my_order_state.dart';
part 'my_order_bloc.freezed.dart';

class MyOrderBloc extends Bloc<MyOrderEvent, MyOrderState> {
  final OrdersRepositories ordersRepository;

  MyOrderBloc({required this.ordersRepository})
      : super(const MyOrderState.initial()) {
    on<LoadMyOrder>(_onLoadMyOrder);
    on<GetAllOrders>(_onGetAllOrders);
    on<ReOrder>(_onReOrder);
  }

  Future<String?> _getUserId() async {
    final prefs = await SharedPreferences.getInstance();

    final numId = prefs.getInt('id');
    if (numId != null) return numId.toString();

    final profileData = prefs.getString('profile');
    if (profileData != null && profileData.startsWith('{')) {
      final userMap = json.decode(profileData);
      return userMap['_id']?.toString() ?? userMap['id']?.toString();
    }

    return null;
  }

  Future<void> _onLoadMyOrder(
    LoadMyOrder event,
    Emitter<MyOrderState> emit,
  ) async {
    add(const GetAllOrders());
  }

  Future<void> _onGetAllOrders(
    GetAllOrders event,
    Emitter<MyOrderState> emit,
  ) async {
    emit(const MyOrderState.loading());
    try {
      final userIdStr = await _getUserId();
      if (userIdStr == null) {
        emit(const MyOrderState.failure(message: 'User not logged in'));
        return;
      }
      final userId = int.parse(userIdStr);
      final orders = await ordersRepository.getOrderHistory(userId);
      emit(MyOrderState.loaded(orders));
    } catch (e) {
      emit(MyOrderState.failure(message: e.toString()));
    }
  }

  Future<void> _onReOrder(ReOrder event, Emitter<MyOrderState> emit) async {
    List<OrderEntity> currentOrders = [];
    state.maybeWhen(
      loaded: (items) => currentOrders = List.from(items),
      orElse: () {},
    );

    emit(const MyOrderState.loading());
    try {
      final userIdStr = await _getUserId();
      if (userIdStr == null) {
        emit(const MyOrderState.failure(message: 'User not logged in'));
        return;
      }
      final userId = int.parse(userIdStr);

      final products = event.order.products
          .map((p) => {
                "productId": p.productId,
                "quantity": p.quantity,
                "price": p.price,
              })
          .toList();

      final newOrder = await ordersRepository.createOrder(
        userId: userId,
        products: products,
        totalAmount: event.order.totalAmount,
        shippingAddress: event.order.shippingAddress,
        paymentMethod: event.order.paymentMethod,
      );

      currentOrders.insert(0, newOrder);
      emit(const MyOrderState.success(message: 'Re-ordered successfully'));
      emit(MyOrderState.loaded(currentOrders));
    } catch (e) {
      emit(MyOrderState.failure(message: e.toString()));
      if (currentOrders.isNotEmpty) {
        emit(MyOrderState.loaded(currentOrders));
      }
    }
  }
}
