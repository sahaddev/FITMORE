// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderhistoryModelAdapter extends TypeAdapter<OrderhistoryModel> {
  @override
  final int typeId = 6;

  @override
  OrderhistoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderhistoryModel(
      image: fields[1] as String,
      title: fields[2] as String,
      price: fields[3] as num,
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, OrderhistoryModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderhistoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
