part of 'edit_address_bloc.dart';

@freezed
abstract class EditAddressState with _$EditAddressState {
  const factory EditAddressState.initial() = _Initial;
  const factory EditAddressState.loading() = _Loading;
  const factory EditAddressState.success({required String message}) = _Success;
  const factory EditAddressState.failure({required String message}) = _Failure;
}
