// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveAddressAdapter extends TypeAdapter<HiveAddress> {
  @override
  final int typeId = 1;

  @override
  HiveAddress read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveAddress(
      id: fields[0] as String,
      label: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveAddress obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.label);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveAddressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
