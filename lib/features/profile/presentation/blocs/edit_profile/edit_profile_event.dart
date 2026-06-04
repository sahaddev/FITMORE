part of 'edit_profile_bloc.dart';

@freezed
abstract class EditProfileEvent with _$EditProfileEvent {
  const factory EditProfileEvent.load() = LoadEditProfile;
  const factory EditProfileEvent.updateProfile(UserModel user, String name, String phone, String email) = UpdateProfile;
  const factory EditProfileEvent.changePassword(UserModel user, String oldPassword, String newPassword) = ChangePassword;
}
