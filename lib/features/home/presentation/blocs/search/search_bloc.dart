import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState.initial()) {
    on<LoadSearch>(_onLoadSearch);
  }

  Future<void> _onLoadSearch(
    LoadSearch event,
    Emitter<SearchState> emit,
  ) async {
    emit(const SearchState.loading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      emit(const SearchState.success(message: 'Loaded successfully'));
    } catch (e) {
      emit(SearchState.failure(message: e.toString()));
    }
  }
}
