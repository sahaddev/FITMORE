part of 'add_address_bloc.dart';

@freezed
abstract class AddAddressState with _$AddAddressState {
  const factory AddAddressState.initial() = _Initial;
  const factory AddAddressState.loading() = _Loading;
  const factory AddAddressState.success({required String message}) = _Success;
  const factory AddAddressState.failure({required String message}) = _Failure;
}
