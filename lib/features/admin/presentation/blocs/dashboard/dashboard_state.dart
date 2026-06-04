part of 'dashboard_bloc.dart';

@freezed
abstract class DashboardState with _$DashboardState {
  const factory DashboardState.initial() = _Initial;
  const factory DashboardState.loading() = _Loading;
  const factory DashboardState.success({required String message}) = _Success;
  const factory DashboardState.failure({required String message}) = _Failure;
}
