// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plantmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlantAdapter extends TypeAdapter<Plant> {
  @override
  final int typeId = 3;

  @override
  Plant read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Plant(
      coins: fields[2] as double,
      location: fields[1] as String,
      name: fields[0] as String,
      varification: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Plant obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.location)
      ..writeByte(2)
      ..write(obj.coins)
      ..writeByte(3)
      ..write(obj.varification);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlantAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
