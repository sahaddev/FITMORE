part of 'terms_bloc.dart';

@freezed
abstract class TermsEvent with _$TermsEvent {
  const factory TermsEvent.load() = LoadTerms;
}
