import 'package:flutter/material.dart';

import 'menu_dto.dart';

class MenusDto {
  MenusDto({
    @required this.foods,
    @required this.drinks,
  });

  List<MenuDto> foods;
  List<MenuDto> drinks;

  factory MenusDto.fromJson(Map<String, dynamic> json) => MenusDto(
        foods: List<MenuDto>.from(json["foods"].map((x) => MenuDto.fromJson(x))),
        drinks: List<MenuDto>.from(json["drinks"].map((x) => MenuDto.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
        "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
      };
}
