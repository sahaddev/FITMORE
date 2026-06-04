import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';
part 'splash_screen_bloc.freezed.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState.initial()) {
    on<LoadSplash>(_onLoadSplash);
  }

  Future<void> _onLoadSplash(
    LoadSplash event,
    Emitter<SplashState> emit,
  ) async {
    emit(const SplashState.loading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      emit(const SplashState.success(message: 'Loaded successfully'));
    } catch (e) {
      emit(SplashState.failure(message: e.toString()));
    }
  }
}
