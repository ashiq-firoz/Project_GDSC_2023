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
      coins: fields[4] as double,
      lat: fields[2] as double,
      lng: fields[3] as double,
      name: fields[1] as String,
      verification: fields[5] as int,
      dob: fields[6] as DateTime,
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Plant obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.lat)
      ..writeByte(3)
      ..write(obj.lng)
      ..writeByte(4)
      ..write(obj.coins)
      ..writeByte(5)
      ..write(obj.verification)
      ..writeByte(6)
      ..write(obj.dob);
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
