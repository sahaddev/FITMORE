part of 'home_bloc.dart';

@freezed
abstract class HomeEvent with _$HomeEvent {
  const factory HomeEvent.fetchData() = FetchData;
  const factory HomeEvent.refreshData() = RefreshData;
}
