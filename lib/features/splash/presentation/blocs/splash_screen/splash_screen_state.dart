part of 'splash_screen_bloc.dart';

@freezed
abstract class SplashState with _$SplashState {
  const factory SplashState.initial() = _Initial;
  const factory SplashState.loading() = _Loading;
  const factory SplashState.success({required String message}) = _Success;
  const factory SplashState.failure({required String message}) = _Failure;
}
