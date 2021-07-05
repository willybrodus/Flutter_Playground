import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'categories_dto.g.dart';

@HiveType(typeId: 3)
class CategoriesDto {
  CategoriesDto({@required this.name});

  String name;

  factory CategoriesDto.fromJson(Map<String, dynamic> json) => CategoriesDto(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
