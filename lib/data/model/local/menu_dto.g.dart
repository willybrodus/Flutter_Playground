// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MenuDtoAdapter extends TypeAdapter<MenuDto> {
  @override
  final int typeId = 2;

  @override
  MenuDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MenuDto(
      name: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MenuDto obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MenuDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
