part of 'edit_address_bloc.dart';

@freezed
abstract class EditAddressEvent with _$EditAddressEvent {
  const factory EditAddressEvent.load() = LoadEditAddress;
  const factory EditAddressEvent.updateAddress(AddressModel address) =
      UpdateAddress;
}
