import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/models/address/db_address_model.dart';

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
      // TODO: Implement logic here
      emit(const AddAddressState.loaded([]));
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
      // TODO: Implement logic here
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
      // TODO: Implement logic here
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
      // TODO: Implement logic here
      emit(const AddAddressState.success(
          message: 'Address deleted successfully'));
    } catch (e) {
      emit(AddAddressState.failure(message: e.toString()));
    }
  }
}
