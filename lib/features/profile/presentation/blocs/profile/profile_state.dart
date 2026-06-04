part of 'profile_bloc.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = _Loading;
  const factory ProfileState.success({required String message}) = _Success;
  const factory ProfileState.failure({required String message}) = _Failure;
  const factory ProfileState.loaded(dynamic user, String? imagePath) = _Loaded;
}
