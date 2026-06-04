import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_user_list_event.dart';
part 'admin_user_list_state.dart';
part 'admin_user_list_bloc.freezed.dart';

class AdminUserListBloc extends Bloc<AdminUserListEvent, AdminUserListState> {
  AdminUserListBloc() : super(const AdminUserListState.initial()) {
    on<LoadAdminUserList>(_onLoadAdminUserList);
  }

  Future<void> _onLoadAdminUserList(
    LoadAdminUserList event,
    Emitter<AdminUserListState> emit,
  ) async {
    emit(const AdminUserListState.loading());
    try {
      // TODO: Implement logic here
      await Future.delayed(const Duration(seconds: 1));
      emit(const AdminUserListState.success(message: 'Loaded successfully'));
    } catch (e) {
      emit(AdminUserListState.failure(message: e.toString()));
    }
  }
}
