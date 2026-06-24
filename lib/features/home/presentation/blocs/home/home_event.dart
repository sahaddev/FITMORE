part of 'home_bloc.dart';

@freezed
abstract class HomeEvent with _$HomeEvent {
  const factory HomeEvent.fetchData({String? search, String? category}) =
      FetchData;
  const factory HomeEvent.refreshData({String? search, String? category}) =
      RefreshData;
}
