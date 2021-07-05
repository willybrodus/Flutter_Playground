// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RestaurantDtoAdapter extends TypeAdapter<RestaurantDto> {
  @override
  final int typeId = 0;

  @override
  RestaurantDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RestaurantDto(
      id: fields[0] as String,
      name: fields[1] as String,
      description: fields[2] as String,
      pictureId: fields[3] as String,
      city: fields[5] as String,
      rating: fields[6] as double,
      address: fields[4] as String,
      categories: (fields[7] as List)?.cast<CategoriesDto>(),
      menus: fields[8] as MenusDto,
      customerReviews: (fields[9] as List)?.cast<ReviewDto>(),
    );
  }

  @override
  void write(BinaryWriter writer, RestaurantDto obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.pictureId)
      ..writeByte(4)
      ..write(obj.address)
      ..writeByte(5)
      ..write(obj.city)
      ..writeByte(6)
      ..write(obj.rating)
      ..writeByte(7)
      ..write(obj.categories)
      ..writeByte(8)
      ..write(obj.menus)
      ..writeByte(9)
      ..write(obj.customerReviews);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RestaurantDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
