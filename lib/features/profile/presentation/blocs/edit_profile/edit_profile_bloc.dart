import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/models/user/db_model.dart';

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
      // TODO: Implement logic here
      emit(const EditProfileState.loaded(null));
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
      // TODO: Implement logic here
      emit(const EditProfileState.success(message: 'Profile updated successfully'));
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
      // TODO: Implement logic here
      emit(const EditProfileState.success(message: 'Password changed successfully'));
    } catch (e) {
      emit(EditProfileState.failure(message: e.toString()));
    }
  }
}
