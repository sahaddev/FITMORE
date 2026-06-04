import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'terms_event.dart';
part 'terms_state.dart';
part 'terms_bloc.freezed.dart';

class TermsBloc extends Bloc<TermsEvent, TermsState> {
  TermsBloc() : super(const TermsState.initial()) {
    on<LoadTerms>(_onLoadTerms);
  }

  Future<void> _onLoadTerms(
    LoadTerms event,
    Emitter<TermsState> emit,
  ) async {
    emit(const TermsState.loading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      emit(const TermsState.success(message: 'Loaded successfully'));
    } catch (e) {
      emit(TermsState.failure(message: e.toString()));
    }
  }
}
