part of 'about_us_bloc.dart';

@freezed
abstract class AboutUsState with _$AboutUsState {
  const factory AboutUsState.initial() = _Initial;
  const factory AboutUsState.loading() = _Loading;
  const factory AboutUsState.success({required String message}) = _Success;
  const factory AboutUsState.failure({required String message}) = _Failure;
}
