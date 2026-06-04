import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_event.dart';
part 'address_state.dart';
part 'address_bloc.freezed.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddressBloc() : super(const AddressState.initial()) {
    on<LoadAddress>(_onLoadAddress);
  }

  Future<void> _onLoadAddress(
    LoadAddress event,
    Emitter<AddressState> emit,
  ) async {
    emit(const AddressState.loading());
    try {
      // TODO: Implement logic here
      await Future.delayed(const Duration(seconds: 1));
      emit(const AddressState.success(message: 'Loaded successfully'));
    } catch (e) {
      emit(AddressState.failure(message: e.toString()));
    }
  }
}
