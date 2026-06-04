part of 'sign_up_bloc.dart';

@freezed
abstract class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent.signUp({
    required String name,
    required String phoneNumber,
    required String email,
    required String password,
  }) = SignUp;
}
