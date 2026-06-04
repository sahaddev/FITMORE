part of 'address_bloc.dart';

@freezed
abstract class AddressEvent with _$AddressEvent {
  const factory AddressEvent.load() = LoadAddress;
}
