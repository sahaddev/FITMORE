import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState.initial()) {
    on<LoadProfile>(_onLoadProfile);
    on<SignOut>(_onSignOut);
  }

  Future<void> _onLoadProfile(
    LoadProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.loading());
    try {
      // TODO: Implement logic here
      emit(const ProfileState.loaded(null, null));
    } catch (e) {
      emit(ProfileState.failure(message: e.toString()));
    }
  }

  Future<void> _onSignOut(
    SignOut event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.loading());
    try {
      // TODO: Implement logic here
      emit(const ProfileState.success(message: 'Signed out successfully'));
    } catch (e) {
      emit(ProfileState.failure(message: e.toString()));
    }
  }
}
