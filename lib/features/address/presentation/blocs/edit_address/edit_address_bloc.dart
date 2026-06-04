import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/models/address/db_address_model.dart';

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
      // TODO: Implement logic here
      await Future.delayed(const Duration(seconds: 1));
      emit(const EditAddressState.success(message: 'Loaded successfully'));
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
      // TODO: Implement logic here
      emit(const EditAddressState.success(message: 'Address updated successfully'));
    } catch (e) {
      emit(EditAddressState.failure(message: e.toString()));
    }
  }
}
