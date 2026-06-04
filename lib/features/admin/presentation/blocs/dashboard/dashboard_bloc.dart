import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';
part 'dashboard_bloc.freezed.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(const DashboardState.initial()) {
    on<LoadDashboard>(_onLoadDashboard);
  }

  Future<void> _onLoadDashboard(
    LoadDashboard event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardState.loading());
    try {
      // TODO: Implement logic here
      await Future.delayed(const Duration(seconds: 1));
      emit(const DashboardState.success(message: 'Loaded successfully'));
    } catch (e) {
      emit(DashboardState.failure(message: e.toString()));
    }
  }
}
