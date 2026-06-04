import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_login_event.dart';
part 'admin_login_state.dart';
part 'admin_login_bloc.freezed.dart';

class AdminLoginBloc extends Bloc<AdminLoginEvent, AdminLoginState> {
  AdminLoginBloc() : super(const AdminLoginState.initial()) {
    on<LoadAdminLogin>(_onLoadAdminLogin);
  }

  Future<void> _onLoadAdminLogin(
    LoadAdminLogin event,
    Emitter<AdminLoginState> emit,
  ) async {
    emit(const AdminLoginState.loading());
    try {
      // TODO: Implement logic here
      await Future.delayed(const Duration(seconds: 1));
      emit(const AdminLoginState.success(message: 'Loaded successfully'));
    } catch (e) {
      emit(AdminLoginState.failure(message: e.toString()));
    }
  }
}
