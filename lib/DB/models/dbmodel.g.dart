// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dbmodels.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GreenDataAdapter extends TypeAdapter<GreenData> {
  @override
  final int typeId = 1;

  @override
  GreenData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GreenData(
      coins: fields[0] as double,
      totalplants: fields[1] as int,
      verifications: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, GreenData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.coins)
      ..writeByte(1)
      ..write(obj.totalplants)
      ..writeByte(2)
      ..write(obj.verifications);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GreenDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
