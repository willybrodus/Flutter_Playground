import 'package:flutter/material.dart';

class MenuDto {
  MenuDto({
    @required this.name,
  });

  String name;

  factory MenuDto.fromJson(Map<String, dynamic> json) => MenuDto(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
