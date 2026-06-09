import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/models/address/db_address_model.dart';
import '../../../domain/usecase/address_usecase.dart';

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

      emit(AddressState.loaded(mappedAddresses));
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
      await AddressUsecase().createAddress(
        pincode: int.tryParse(event.address.pincode) ?? 0,
        city: event.address.city,
        state: event.address.state,
        country: 'India',
        buildName: event.address.name,
        streetName: '',
        area: '',
        userId: 101,
      );
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
      await AddressUsecase().deleteAddress(event.id);
      emit(const AddressState.success(message: 'Address deleted successfully'));
    } catch (e) {
      emit(AddressState.failure(message: e.toString()));
    }
  }
}
