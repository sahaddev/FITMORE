import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/usecase/auth_usecase.dart';

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
      final response = await AuthUsecase().signup(
        username: event.name,
        phonenumber: event.phoneNumber,
        email: event.email,
        password: event.password,
      );

      if (response.status == true) {
        emit(SignUpState.success(
            message: response.message ?? 'Successfully signed up'));
      } else {
        emit(SignUpState.failure(
            message: response.message ?? 'Failed to sign up'));
      }
    } catch (e) {
      emit(SignUpState.failure(message: e.toString()));
    }
  }
}
