import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';
part 'sign_up_bloc.freezed.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState.initial()) {
    on<SignUp>(_onSignUp);
  }

  Future<void> _onSignUp(
    SignUp event,
    Emitter<SignUpState> emit,
  ) async {
    emit(const SignUpState.loading());
    try {
      // TODO: Implement sign up logic here
      await Future.delayed(const Duration(seconds: 1));
      emit(const SignUpState.success(message: 'Successfully signed up'));
    } catch (e) {
      emit(SignUpState.failure(message: e.toString()));
    }
  }
}
