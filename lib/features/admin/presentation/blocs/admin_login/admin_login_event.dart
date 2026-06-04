part of 'admin_login_bloc.dart';

@freezed
abstract class AdminLoginEvent with _$AdminLoginEvent {
  const factory AdminLoginEvent.load() = LoadAdminLogin;
}
