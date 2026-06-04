part of 'admin_list_bloc.dart';

@freezed
abstract class AdminListEvent with _$AdminListEvent {
  const factory AdminListEvent.load() = LoadAdminList;
}
