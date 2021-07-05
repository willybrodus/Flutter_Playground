import 'package:flutter/foundation.dart';
import 'package:flutter_restaurant_apps/data/model/local/restaurant_dto.dart';

class RestaurantsDto {
  RestaurantsDto(
      {@required this.error, @required this.message, @required this.count, @required this.restaurants});

  bool error;
  String message;
  int count;
  List<RestaurantDto> restaurants;

  factory RestaurantsDto.fromJson(Map<String, dynamic> json) => RestaurantsDto(
      error: json['error'],
      message: json['message'],
      count: json['count'],
      restaurants: List<RestaurantDto>.from(json['restaurants'].map((x) => RestaurantDto.fromJson(x))));
}
