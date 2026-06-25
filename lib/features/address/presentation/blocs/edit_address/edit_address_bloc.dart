import 'package:e_commerce/core/constants/storage_keys.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/models/address/db_address_model.dart';
import '../../../domain/usecase/address_usecase.dart';

part 'edit_address_event.dart';
part 'edit_address_state.dart';
part 'edit_address_bloc.freezed.dart';

class EditAddressBloc extends Bloc<EditAddressEvent, EditAddressState> {
  EditAddressBloc() : super(const EditAddressState.initial()) {
    on<UpdateAddress>(_onUpdateAddress);
  }

  Future<void> _onUpdateAddress(
    UpdateAddress event,
    Emitter<EditAddressState> emit,
  ) async {
    emit(const EditAddressState.loading());
    final prefs = await SharedPreferences.getInstance();
    final userIdStr = prefs.getString(StorageKeys.userId);
    final userId = int.tryParse(userIdStr ?? '') ?? prefs.getInt('id') ?? 0;
    try {
      await AddressUsecase().updateAddress(
        id: event.address.id!,
        pincode: int.tryParse(event.address.pincode) ?? 0,
        city: event.address.city,
        state: event.address.state,
        country: 'India',
        buildName: event.address.name,
        streetName: event.address.streetName,
        area: event.address.area,
        userId: userId,
        phonenumber: event.address.phonenumber,
      );
      emit(const EditAddressState.success(
          message: 'Address updated successfully'));
    } catch (e) {
      emit(EditAddressState.failure(message: e.toString()));
    }
  }
}
