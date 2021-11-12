// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node.hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveNodeAdapter extends TypeAdapter<HiveNode> {
  @override
  final int typeId = 0;

  @override
  HiveNode read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveNode(
      host: fields[0] as String,
      label: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveNode obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.host)
      ..writeByte(1)
      ..write(obj.label);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveNodeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
