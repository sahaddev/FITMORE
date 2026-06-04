part of 'add_address_bloc.dart';

@freezed
abstract class AddAddressEvent with _$AddAddressEvent {
  const factory AddAddressEvent.load() = LoadAddAddress;
  const factory AddAddressEvent.getAllAddresses() = GetAllAddresses;
  const factory AddAddressEvent.addAddress(AddressModel address) = AddAddress;
  const factory AddAddressEvent.updateAddress(AddressModel address) =
      UpdateAddress;
  const factory AddAddressEvent.deleteAddress(int id) = DeleteAddress;
}
