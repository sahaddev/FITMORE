import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'about_us_event.dart';
part 'about_us_state.dart';
part 'about_us_bloc.freezed.dart';

class AboutUsBloc extends Bloc<AboutUsEvent, AboutUsState> {
  AboutUsBloc() : super(const AboutUsState.initial()) {
    on<LoadAboutUs>(_onLoadAboutUs);
  }

  Future<void> _onLoadAboutUs(
    LoadAboutUs event,
    Emitter<AboutUsState> emit,
  ) async {
    emit(const AboutUsState.loading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      emit(const AboutUsState.success(message: 'Loaded successfully'));
    } catch (e) {
      emit(AboutUsState.failure(message: e.toString()));
    }
  }
}
