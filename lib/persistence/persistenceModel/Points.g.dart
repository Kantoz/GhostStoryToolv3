// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Points.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PointsAdapter extends TypeAdapter<Points> {
  @override
  final typeId = 0;

  @override
  Points read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Points(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as int,
      fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Points obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.firstPlayer)
      ..writeByte(1)
      ..write(obj.secondPlayer)
      ..writeByte(2)
      ..write(obj.thirdPlayer)
      ..writeByte(3)
      ..write(obj.fourthPlayer)
      ..writeByte(4)
      ..write(obj.points)
      ..writeByte(5)
      ..write(obj.date);
  }
}
