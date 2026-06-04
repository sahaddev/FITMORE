part of 'product_edit_bloc.dart';

@freezed
abstract class ProductEditEvent with _$ProductEditEvent {
  const factory ProductEditEvent.load() = LoadProductEdit;
}
