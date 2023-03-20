// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bluemodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BlueDataAdapter extends TypeAdapter<BlueData> {
  @override
  final int typeId = 2;

  @override
  BlueData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BlueData(
      coins: fields[0] as double,
      trash: fields[1] as int,
      level: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BlueData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.coins)
      ..writeByte(1)
      ..write(obj.trash)
      ..writeByte(2)
      ..write(obj.level);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BlueDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
