import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'second_splash_event.dart';
part 'second_splash_state.dart';
part 'second_splash_bloc.freezed.dart';

class SecondSplashBloc extends Bloc<SecondSplashEvent, SecondSplashState> {
  SecondSplashBloc() : super(const SecondSplashState.initial()) {
    on<LoadSecondSplash>(_onLoadSecondSplash);
  }

  Future<void> _onLoadSecondSplash(
    LoadSecondSplash event,
    Emitter<SecondSplashState> emit,
  ) async {
    emit(const SecondSplashState.loading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      emit(const SecondSplashState.success(message: 'Loaded successfully'));
    } catch (e) {
      emit(SecondSplashState.failure(message: e.toString()));
    }
  }
}
