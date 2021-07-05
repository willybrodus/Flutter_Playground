import 'package:flutter/foundation.dart';

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
