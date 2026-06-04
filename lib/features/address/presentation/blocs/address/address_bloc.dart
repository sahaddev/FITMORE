import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/models/address/db_address_model.dart';

part 'address_event.dart';
part 'address_state.dart';
part 'address_bloc.freezed.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddressBloc() : super(const AddressState.initial()) {
    on<LoadAddress>(_onLoadAddress);
    on<GetAllAddresses>(_onGetAllAddresses);
    on<AddAddress>(_onAddAddress);
    on<UpdateAddress>(_onUpdateAddress);
    on<DeleteAddress>(_onDeleteAddress);
  }

  Future<void> _onLoadAddress(
    LoadAddress event,
    Emitter<AddressState> emit,
  ) async {
    emit(const AddressState.loading());
    try {
      // TODO: Implement logic here
      await Future.delayed(const Duration(seconds: 1));
      emit(const AddressState.success(message: 'Loaded successfully'));
    } catch (e) {
      emit(AddressState.failure(message: e.toString()));
    }
  }

  Future<void> _onGetAllAddresses(
    GetAllAddresses event,
    Emitter<AddressState> emit,
  ) async {
    emit(const AddressState.loading());
    try {
      // TODO: Implement logic here
      emit(const AddressState.loaded([]));
    } catch (e) {
      emit(AddressState.failure(message: e.toString()));
    }
  }

  Future<void> _onAddAddress(
    AddAddress event,
    Emitter<AddressState> emit,
  ) async {
    emit(const AddressState.loading());
    try {
      // TODO: Implement logic here
      emit(const AddressState.success(message: 'Address added successfully'));
    } catch (e) {
      emit(AddressState.failure(message: e.toString()));
    }
  }

  Future<void> _onUpdateAddress(
    UpdateAddress event,
    Emitter<AddressState> emit,
  ) async {
    emit(const AddressState.loading());
    try {
      // TODO: Implement logic here
      emit(const AddressState.success(message: 'Address updated successfully'));
    } catch (e) {
      emit(AddressState.failure(message: e.toString()));
    }
  }

  Future<void> _onDeleteAddress(
    DeleteAddress event,
    Emitter<AddressState> emit,
  ) async {
    emit(const AddressState.loading());
    try {
      // TODO: Implement logic here
      emit(const AddressState.success(message: 'Address deleted successfully'));
    } catch (e) {
      emit(AddressState.failure(message: e.toString()));
    }
  }
}
