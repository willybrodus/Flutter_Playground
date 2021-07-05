// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReviewDtoAdapter extends TypeAdapter<ReviewDto> {
  @override
  final int typeId = 4;

  @override
  ReviewDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReviewDto(
      id: fields[0] as String,
      name: fields[1] as String,
      review: fields[2] as String,
      date: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ReviewDto obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.review)
      ..writeByte(3)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReviewDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
