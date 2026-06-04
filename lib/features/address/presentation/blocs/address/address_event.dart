part of 'address_bloc.dart';

@freezed
abstract class AddressEvent with _$AddressEvent {
  const factory AddressEvent.load() = LoadAddress;
  const factory AddressEvent.getAllAddresses() = GetAllAddresses;
  const factory AddressEvent.addAddress(AddressModel address) = AddAddress;
  const factory AddressEvent.updateAddress(AddressModel address) = UpdateAddress;
  const factory AddressEvent.deleteAddress(int id) = DeleteAddress;
}
