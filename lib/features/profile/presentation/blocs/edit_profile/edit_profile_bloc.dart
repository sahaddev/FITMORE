import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';
part 'edit_profile_bloc.freezed.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc() : super(const EditProfileState.initial()) {
    on<LoadEditProfile>(_onLoadEditProfile);
  }

  Future<void> _onLoadEditProfile(
    LoadEditProfile event,
    Emitter<EditProfileState> emit,
  ) async {
    emit(const EditProfileState.loading());
    try {
      // TODO: Implement logic here
      await Future.delayed(const Duration(seconds: 1));
      emit(const EditProfileState.success(message: 'Loaded successfully'));
    } catch (e) {
      emit(EditProfileState.failure(message: e.toString()));
    }
  }
}
