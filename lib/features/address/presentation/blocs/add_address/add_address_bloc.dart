import 'package:e_commerce/core/constants/storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/models/address/db_address_model.dart';
import '../../../domain/usecase/address_usecase.dart';

part 'add_address_event.dart';
part 'add_address_state.dart';
part 'add_address_bloc.freezed.dart';

class AddAddressBloc extends Bloc<AddAddressEvent, AddAddressState> {
  AddAddressBloc() : super(const AddAddressState.initial()) {
    on<AddAddress>(_onAddAddress);
  }

  Future<void> _onAddAddress(
    AddAddress event,
    Emitter<AddAddressState> emit,
  ) async {
    emit(const AddAddressState.loading());
    emit(const AddAddressState.loading());
    final prefs = await SharedPreferences.getInstance();
    final userIdStr = prefs.getString(StorageKeys.userId);
    final userId = int.tryParse(userIdStr ?? '') ?? prefs.getInt('id') ?? 0;
    try {
      await AddressUsecase().createAddress(
          pincode: int.tryParse(event.address.pincode) ?? 0,
          city: event.address.city,
          state: event.address.state,
          country: 'India', // Default country as it's missing in AddressModel
          buildName: event.address.name,
          streetName: event.address.streetName,
          area: event.address.area,
          userId: userId,
          phonenumber: event.address.phonenumber);
      emit(
          const AddAddressState.success(message: 'Address added successfully'));
    } catch (e) {
      emit(AddAddressState.failure(message: e.toString()));
    }
  }
}
