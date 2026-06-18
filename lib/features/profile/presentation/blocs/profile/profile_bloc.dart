import 'package:e_commerce/core/models/user/db_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      final prefs = await SharedPreferences.getInstance();
      final id = prefs.getInt('id');
      final name = prefs.getString('username');
      final email = prefs.getString('email');
      final phoneNumber = prefs.getString('phoneNumber');
      final password = prefs.getString('password');
      final profile = prefs.getString('profile');

      final user = UserModel(
        id: id,
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
        profile: profile,
      );

      emit(ProfileState.loaded(user, profile));
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
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('token');
      await prefs.remove('id');
      await prefs.remove('username');
      await prefs.remove('email');
      await prefs.remove('phoneNumber');
      await prefs.remove('password');
      await prefs.remove('profile');
      await prefs.remove('UserLoggidIn');

      emit(const ProfileState.success(message: 'Signed out successfully'));
    } catch (e) {
      emit(ProfileState.failure(message: e.toString()));
    }
  }
}
