part of 'second_splash_bloc.dart';

@freezed
abstract class SecondSplashEvent with _$SecondSplashEvent {
  const factory SecondSplashEvent.load() = LoadSecondSplash;
}
