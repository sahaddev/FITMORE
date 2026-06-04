import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_list_event.dart';
part 'admin_list_state.dart';
part 'admin_list_bloc.freezed.dart';

class AdminListBloc extends Bloc<AdminListEvent, AdminListState> {
  AdminListBloc() : super(const AdminListState.initial()) {
    on<LoadAdminList>(_onLoadAdminList);
  }

  Future<void> _onLoadAdminList(
    LoadAdminList event,
    Emitter<AdminListState> emit,
  ) async {
    emit(const AdminListState.loading());
    try {
      // TODO: Implement logic here
      await Future.delayed(const Duration(seconds: 1));
      emit(const AdminListState.success(message: 'Loaded successfully'));
    } catch (e) {
      emit(AdminListState.failure(message: e.toString()));
    }
  }
}
