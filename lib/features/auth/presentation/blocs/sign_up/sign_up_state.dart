part of 'sign_up_bloc.dart';

@freezed
abstract class SignUpState with _$SignUpState {
  const factory SignUpState.initial() = _Initial;
  const factory SignUpState.loading() = _Loading;
  const factory SignUpState.success({required String message}) = _Success;
  const factory SignUpState.failure({required String message}) = _Failure;
}
