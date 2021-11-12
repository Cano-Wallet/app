// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveNotificationAdapter extends TypeAdapter<HiveNotification> {
  @override
  final int typeId = 2;

  @override
  HiveNotification read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveNotification(
      type: fields[0] as String,
      title: fields[1] as String,
      description: fields[2] as String,
      dateTime: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, HiveNotification obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveNotificationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
