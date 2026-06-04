part of 'about_us_bloc.dart';

@freezed
abstract class AboutUsEvent with _$AboutUsEvent {
  const factory AboutUsEvent.load() = LoadAboutUs;
}
