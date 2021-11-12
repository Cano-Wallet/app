// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveTokenAdapter extends TypeAdapter<HiveToken> {
  @override
  final int typeId = 3;

  @override
  HiveToken read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveToken(
      name: fields[0] as String,
      symbol: fields[1] as String,
      domain: fields[2] as String,
      totalSupply: fields[3] as int,
      decimals: fields[4] as int,
      owner: fields[5] as HiveAddress,
      tokenStandard: fields[6] as HiveTokenStandard,
      maxSupply: fields[7] as int,
      isBurnable: fields[8] as bool,
      isMintable: fields[9] as bool,
      isUtility: fields[10] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, HiveToken obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.symbol)
      ..writeByte(2)
      ..write(obj.domain)
      ..writeByte(3)
      ..write(obj.totalSupply)
      ..writeByte(4)
      ..write(obj.decimals)
      ..writeByte(5)
      ..write(obj.owner)
      ..writeByte(6)
      ..write(obj.tokenStandard)
      ..writeByte(7)
      ..write(obj.maxSupply)
      ..writeByte(8)
      ..write(obj.isBurnable)
      ..writeByte(9)
      ..write(obj.isMintable)
      ..writeByte(10)
      ..write(obj.isUtility);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveTokenAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HiveTokenStandardAdapter extends TypeAdapter<HiveTokenStandard> {
  @override
  final int typeId = 4;

  @override
  HiveTokenStandard read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveTokenStandard(
      hrp: fields[0] as String,
      core: (fields[1] as List).cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, HiveTokenStandard obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.hrp)
      ..writeByte(1)
      ..write(obj.core);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveTokenStandardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
