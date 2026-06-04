part of 'add_address_bloc.dart';

@freezed
abstract class AddAddressEvent with _$AddAddressEvent {
  const factory AddAddressEvent.load() = LoadAddAddress;
}
