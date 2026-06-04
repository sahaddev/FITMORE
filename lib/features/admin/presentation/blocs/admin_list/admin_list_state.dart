part of 'admin_list_bloc.dart';

@freezed
abstract class AdminListState with _$AdminListState {
  const factory AdminListState.initial() = _Initial;
  const factory AdminListState.loading() = _Loading;
  const factory AdminListState.success({required String message}) = _Success;
  const factory AdminListState.failure({required String message}) = _Failure;
}
