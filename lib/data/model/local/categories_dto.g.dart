// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoriesDtoAdapter extends TypeAdapter<CategoriesDto> {
  @override
  final int typeId = 3;

  @override
  CategoriesDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoriesDto();
  }

  @override
  void write(BinaryWriter writer, CategoriesDto obj) {
    writer..writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoriesDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
