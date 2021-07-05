import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'menu_dto.g.dart';

@HiveType(typeId: 2)
class MenuDto {
  MenuDto({
    @required this.name,
  });

  @HiveField(0)
  String name;

  factory MenuDto.fromJson(Map<String, dynamic> json) => MenuDto(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
