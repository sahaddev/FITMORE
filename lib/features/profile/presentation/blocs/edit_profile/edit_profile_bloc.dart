import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/models/user/db_model.dart';
import '../../../domain/usecase/profile_usecase.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';
part 'edit_profile_bloc.freezed.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc() : super(const EditProfileState.initial()) {
    on<LoadEditProfile>(_onLoadEditProfile);
    on<UpdateProfile>(_onUpdateProfile);
    on<ChangePassword>(_onChangePassword);
  }

  Future<void> _onLoadEditProfile(
    LoadEditProfile event,
    Emitter<EditProfileState> emit,
  ) async {
    emit(const EditProfileState.loading());
    try {
      final response = await ProfileUsecase().getUserById(id: event.id);
      
      if (response.status == true && response.user != null) {
        final e = response.user!;
        final userModel = UserModel(
          id: e.id,
          name: e.username,
          email: e.email,
          phoneNumber: e.phoneNumber,
          password: e.password,
          profile: e.profileImage,
          active: e.active ?? true,
        );
        emit(EditProfileState.loaded(userModel));
      } else {
        emit(const EditProfileState.failure(message: 'Failed to load profile'));
      }
    } catch (e) {
      emit(EditProfileState.failure(message: e.toString()));
    }
  }

  Future<void> _onUpdateProfile(
    UpdateProfile event,
    Emitter<EditProfileState> emit,
  ) async {
    emit(const EditProfileState.loading());
    try {
      final response = await ProfileUsecase().updateUser(
        id: event.user.id ?? 0,
        username: event.name,
        email: event.email,
        password: event.user.password ?? '',
      );

      if (response.status == true) {
        emit(const EditProfileState.success(message: 'Profile updated successfully'));
      } else {
        emit(const EditProfileState.failure(message: 'Failed to update profile'));
      }
    } catch (e) {
      emit(EditProfileState.failure(message: e.toString()));
    }
  }

  Future<void> _onChangePassword(
    ChangePassword event,
    Emitter<EditProfileState> emit,
  ) async {
    emit(const EditProfileState.loading());
    try {
      if (event.user.password != event.oldPassword) {
        emit(const EditProfileState.failure(message: 'Incorrect old password'));
        return;
      }
      
      final response = await ProfileUsecase().updateUser(
        id: event.user.id ?? 0,
        username: event.user.name ?? '',
        email: event.user.email ?? '',
        password: event.newPassword,
      );

      if (response.status == true) {
        emit(const EditProfileState.success(message: 'Password changed successfully'));
      } else {
        emit(const EditProfileState.failure(message: 'Failed to change password'));
      }
    } catch (e) {
      emit(EditProfileState.failure(message: e.toString()));
    }
  }
}
