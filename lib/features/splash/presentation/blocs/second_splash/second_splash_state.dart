part of 'second_splash_bloc.dart';

@freezed
abstract class SecondSplashState with _$SecondSplashState {
  const factory SecondSplashState.initial() = _Initial;
  const factory SecondSplashState.loading() = _Loading;
  const factory SecondSplashState.success({required String message}) = _Success;
  const factory SecondSplashState.failure({required String message}) = _Failure;
}
