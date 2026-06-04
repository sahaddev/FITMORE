part of 'splash_screen_bloc.dart';

@freezed
abstract class SplashEvent with _$SplashEvent {
  const factory SplashEvent.load() = LoadSplash;
}
