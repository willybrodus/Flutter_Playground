import 'package:flutter/foundation.dart';
import 'package:flutter_restaurant_apps/data/model/local/restaurant_dto.dart';

class RestaurantDetailDto {
  RestaurantDetailDto({@required this.error, @required this.message, @required this.restaurant});

  bool error;
  String message;
  RestaurantDto restaurant;

  factory RestaurantDetailDto.fromJson(Map<String, dynamic> json) => RestaurantDetailDto(
      error: json["error"], message: json["message"], restaurant: RestaurantDto.fromJson(json["restaurant"]));
}
