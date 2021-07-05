// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menus_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MenusDtoAdapter extends TypeAdapter<MenusDto> {
  @override
  final int typeId = 1;

  @override
  MenusDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MenusDto(
      foods: (fields[0] as List)?.cast<MenuDto>(),
      drinks: (fields[1] as List)?.cast<MenuDto>(),
    );
  }

  @override
  void write(BinaryWriter writer, MenusDto obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.foods)
      ..writeByte(1)
      ..write(obj.drinks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MenusDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
