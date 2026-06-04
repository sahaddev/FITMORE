part of 'terms_bloc.dart';

@freezed
abstract class TermsState with _$TermsState {
  const factory TermsState.initial() = _Initial;
  const factory TermsState.loading() = _Loading;
  const factory TermsState.success({required String message}) = _Success;
  const factory TermsState.failure({required String message}) = _Failure;
}
