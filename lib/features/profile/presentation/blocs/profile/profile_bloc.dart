import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState.initial()) {
    on<LoadProfile>(_onLoadProfile);
  }

  Future<void> _onLoadProfile(
    LoadProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.loading());
    try {
      // TODO: Implement logic here
      await Future.delayed(const Duration(seconds: 1));
      emit(const ProfileState.success(message: 'Loaded successfully'));
    } catch (e) {
      emit(ProfileState.failure(message: e.toString()));
    }
  }
}
