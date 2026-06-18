import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/usecase/auth_usecase.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';
part 'sign_in_bloc.freezed.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState.initial()) {
    on<SignIn>(_onSignIn);
  }

  Future<void> _onSignIn(
    SignIn event,
    Emitter<SignInState> emit,
  ) async {
    emit(const SignInState.loading());
    try {
      final response = await AuthUsecase().login(
        email: event.email,
        password: event.password,
      );

      if (response.status == true) {
        final prefs = await SharedPreferences.getInstance();
        
        if (response.token != null) await prefs.setString('token', response.token!); else await prefs.remove('token');
        
        if (response.user != null) {
          final id = response.user!.id;
          final username = response.user!.username;
          final email = response.user!.email;
          final number = response.user!.phoneNumber;
          
          if (id != null) await prefs.setInt('id', id); else await prefs.remove('id');
          if (username != null) await prefs.setString('username', username); else await prefs.remove('username');
          if (email != null) await prefs.setString('email', email); else await prefs.remove('email');
          if (number != null) await prefs.setString('phoneNumber', number); else await prefs.remove('phoneNumber');
        }
        
        await prefs.setString('password', event.password);
        await prefs.setBool('UserLoggidIn', true);

        emit(SignInState.success(
            message: response.message ?? 'Successfully signed in'));
      } else {
        emit(SignInState.failure(
            message: response.message ?? 'Failed to sign in'));
      }
    } catch (e) {
      emit(SignInState.failure(message: e.toString()));
    }
  }
}
