part of 'admin_user_list_bloc.dart';

@freezed
abstract class AdminUserListState with _$AdminUserListState {
  const factory AdminUserListState.initial() = _Initial;
  const factory AdminUserListState.loading() = _Loading;
  const factory AdminUserListState.success({required String message}) = _Success;
  const factory AdminUserListState.failure({required String message}) = _Failure;
}
