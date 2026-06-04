part of 'edit_profile_bloc.dart';

@freezed
abstract class EditProfileEvent with _$EditProfileEvent {
  const factory EditProfileEvent.load() = LoadEditProfile;
}
