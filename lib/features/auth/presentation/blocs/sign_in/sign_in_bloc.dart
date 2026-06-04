import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
      // TODO: Implement sign in logic here
      await Future.delayed(const Duration(seconds: 1));
      emit(const SignInState.success(message: 'Successfully signed in'));
    } catch (e) {
      emit(SignInState.failure(message: e.toString()));
    }
  }
}
