import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/models/address/db_address_model.dart';
import '../../../domain/usecase/address_usecase.dart';

part 'add_address_event.dart';
part 'add_address_state.dart';
part 'add_address_bloc.freezed.dart';

class AddAddressBloc extends Bloc<AddAddressEvent, AddAddressState> {
  AddAddressBloc() : super(const AddAddressState.initial()) {
    on<LoadAddAddress>(_onLoadAddAddress);
    on<GetAllAddresses>(_onGetAllAddresses);
    on<AddAddress>(_onAddAddress);
    on<UpdateAddress>(_onUpdateAddress);
    on<DeleteAddress>(_onDeleteAddress);
  }

  Future<void> _onLoadAddAddress(
    LoadAddAddress event,
    Emitter<AddAddressState> emit,
  ) async {
    emit(const AddAddressState.loading());
    try {
      // TODO: Implement logic here
      await Future.delayed(const Duration(seconds: 1));
      emit(const AddAddressState.success(message: 'Loaded successfully'));
    } catch (e) {
      emit(AddAddressState.failure(message: e.toString()));
    }
  }

  Future<void> _onGetAllAddresses(
    GetAllAddresses event,
    Emitter<AddAddressState> emit,
  ) async {
    emit(const AddAddressState.loading());
    try {
      final res = await AddressUsecase()
          .getAddressByUserId(101); // Assuming current user ID is 101
      final mappedAddresses = res.datas
              ?.map((e) => AddressModel(
                    id: e.addressId ?? 0,
                    name: e.buildName,
                    city: e.city,
                    state: e.state,
                    pincode: e.pincode.toString(),
                    phonenumber: '',
                  ))
              .toList() ??
          [];

      emit(AddAddressState.loaded(mappedAddresses));
    } catch (e) {
      emit(AddAddressState.failure(message: e.toString()));
    }
  }

  Future<void> _onAddAddress(
    AddAddress event,
    Emitter<AddAddressState> emit,
  ) async {
    emit(const AddAddressState.loading());
    try {
      await AddressUsecase().createAddress(
        pincode: int.tryParse(event.address.pincode) ?? 0,
        city: event.address.city,
        state: event.address.state,
        country: 'India', // Default country as it's missing in AddressModel
        buildName: event.address.name,
        streetName: '',
        area: '',
        userId: 101, // Default user ID
      );
      emit(
          const AddAddressState.success(message: 'Address added successfully'));
    } catch (e) {
      emit(AddAddressState.failure(message: e.toString()));
    }
  }

  Future<void> _onUpdateAddress(
    UpdateAddress event,
    Emitter<AddAddressState> emit,
  ) async {
    emit(const AddAddressState.loading());
    try {
      await AddressUsecase().updateAddress(
        id: event.address.id ?? 0,
        pincode: int.tryParse(event.address.pincode) ?? 0,
        city: event.address.city,
        state: event.address.state,
        country: 'India',
        buildName: event.address.name,
        streetName: '',
        area: '',
        userId: 101,
      );
      emit(const AddAddressState.success(
          message: 'Address updated successfully'));
    } catch (e) {
      emit(AddAddressState.failure(message: e.toString()));
    }
  }

  Future<void> _onDeleteAddress(
    DeleteAddress event,
    Emitter<AddAddressState> emit,
  ) async {
    emit(const AddAddressState.loading());
    try {
      await AddressUsecase().deleteAddress(event.id);
      emit(const AddAddressState.success(
          message: 'Address deleted successfully'));
    } catch (e) {
      emit(AddAddressState.failure(message: e.toString()));
    }
  }
}
