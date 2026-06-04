part of 'admin_user_list_bloc.dart';

@freezed
abstract class AdminUserListEvent with _$AdminUserListEvent {
  const factory AdminUserListEvent.load() = LoadAdminUserList;
}
