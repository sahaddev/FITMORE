import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../address/domain/entitiy/address_res_entitiy.dart';
import '../../../../address/domain/usecase/address_usecase.dart';

part 'payment_address_event.dart';
part 'payment_address_state.dart';
part 'payment_address_bloc.freezed.dart';

class PaymentAddressBloc extends Bloc<PaymentAddressEvent, PaymentAddressState> {
  final AddressUsecase addressUsecase;

  PaymentAddressBloc({required this.addressUsecase}) : super(const PaymentAddressState.initial()) {
    on<LoadPaymentAddress>(_onLoadPaymentAddress);
    on<SelectAddress>(_onSelectAddress);
  }

  Future<int?> _getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    final idVal = prefs.get('id');
    if (idVal is int) return idVal;
    if (idVal is String) return int.tryParse(idVal);
    
    final userIdVal = prefs.get('userId');
    if (userIdVal is int) return userIdVal;
    if (userIdVal is String) return int.tryParse(userIdVal);
    
    return null;
  }

  Future<void> _onLoadPaymentAddress(
    LoadPaymentAddress event,
    Emitter<PaymentAddressState> emit,
  ) async {
    emit(const PaymentAddressState.loading());
    try {
      final userId = await _getUserId();
      if (userId == null) {
        emit(const PaymentAddressState.failure(message: 'User not logged in'));
        return;
      }
      final res = await addressUsecase.getAddressByUserId(userId);
      if (res.status == true) {
        emit(PaymentAddressState.loaded(res.datas ?? []));
      } else {
        emit(PaymentAddressState.failure(message: res.message ?? 'Failed to load addresses'));
      }
    } catch (e) {
      emit(PaymentAddressState.failure(message: e.toString()));
    }
  }

  Future<void> _onSelectAddress(
    SelectAddress event,
    Emitter<PaymentAddressState> emit,
  ) async {
    List<AddressEntitiy> currentAddresses = [];
    state.maybeWhen(
      loaded: (addresses, _) => currentAddresses = addresses,
      orElse: () {},
    );

    emit(const PaymentAddressState.loading());
    try {
      emit(PaymentAddressState.loaded(currentAddresses, selectedAddressId: event.addressId));
    } catch (e) {
      emit(PaymentAddressState.failure(message: e.toString()));
    }
  }
}
