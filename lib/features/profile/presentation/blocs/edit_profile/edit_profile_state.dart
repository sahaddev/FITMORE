part of 'edit_profile_bloc.dart';

@freezed
abstract class EditProfileState with _$EditProfileState {
  const factory EditProfileState.initial() = _Initial;
  const factory EditProfileState.loading() = _Loading;
  const factory EditProfileState.success({required String message}) = _Success;
  const factory EditProfileState.failure({required String message}) = _Failure;
  const factory EditProfileState.loaded(dynamic user) = _Loaded;
}
