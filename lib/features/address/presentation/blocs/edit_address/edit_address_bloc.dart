import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/models/address/db_address_model.dart';
import '../../../domain/usecase/address_usecase.dart';

part 'edit_address_event.dart';
part 'edit_address_state.dart';
part 'edit_address_bloc.freezed.dart';

class EditAddressBloc extends Bloc<EditAddressEvent, EditAddressState> {
  EditAddressBloc() : super(const EditAddressState.initial()) {
    on<LoadEditAddress>(_onLoadEditAddress);
    on<UpdateAddress>(_onUpdateAddress);
  }

  Future<void> _onLoadEditAddress(
    LoadEditAddress event,
    Emitter<EditAddressState> emit,
  ) async {
    emit(const EditAddressState.loading());
    try {
      emit(const EditAddressState.success(message: 'Ready to edit address'));
    } catch (e) {
      emit(EditAddressState.failure(message: e.toString()));
    }
  }

  Future<void> _onUpdateAddress(
    UpdateAddress event,
    Emitter<EditAddressState> emit,
  ) async {
    emit(const EditAddressState.loading());
    try {
      await AddressUsecase().updateAddress(
        id: event.address.id ?? 0,
        pincode: int.tryParse(event.address.pincode) ?? 0,
        city: event.address.city,
        state: event.address.state,
        country: 'India',
        buildName: event.address.name,
        streetName: event.address.streetName,
        area: event.address.area,
        userId: 101,
      );
      emit(const EditAddressState.success(message: 'Address updated successfully'));
    } catch (e) {
      emit(EditAddressState.failure(message: e.toString()));
    }
  }
}
