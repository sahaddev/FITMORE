import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
