part of 'address_bloc.dart';

@freezed
abstract class AddressState with _$AddressState {
  const factory AddressState.initial() = _Initial;
  const factory AddressState.loading() = _Loading;
  const factory AddressState.success({required String message}) = _Success;
  const factory AddressState.failure({required String message}) = _Failure;
}
