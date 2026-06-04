part of 'admin_login_bloc.dart';

@freezed
abstract class AdminLoginState with _$AdminLoginState {
  const factory AdminLoginState.initial() = _Initial;
  const factory AdminLoginState.loading() = _Loading;
  const factory AdminLoginState.success({required String message}) = _Success;
  const factory AdminLoginState.failure({required String message}) = _Failure;
}
