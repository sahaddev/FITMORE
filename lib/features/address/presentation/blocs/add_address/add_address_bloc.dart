import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_address_event.dart';
part 'add_address_state.dart';
part 'add_address_bloc.freezed.dart';

class AddAddressBloc extends Bloc<AddAddressEvent, AddAddressState> {
  AddAddressBloc() : super(const AddAddressState.initial()) {
    on<LoadAddAddress>(_onLoadAddAddress);
  }

  Future<void> _onLoadAddAddress(
    LoadAddAddress event,
    Emitter<AddAddressState> emit,
  ) async {
    emit(const AddAddressState.loading());
    try {
      // TODO: Implement logic here
      await Future.delayed(const Duration(seconds: 1));
      emit(const AddAddressState.success(message: 'Loaded successfully'));
    } catch (e) {
      emit(AddAddressState.failure(message: e.toString()));
    }
  }
}
