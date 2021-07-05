import 'dart:convert';

import 'package:flutter_restaurant_apps/constants.dart';
import 'package:flutter_restaurant_apps/data/model/local/review_dto.dart';
import 'package:flutter_restaurant_apps/data/model/response/restaurant_detail_dto.dart';
import 'package:flutter_restaurant_apps/data/model/response/restaurants_dto.dart';
import 'package:flutter_restaurant_apps/data/model/response/reviews_dto.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<RestaurantsDto> getListRestaurant() async {
    try {
      final response = await http.get(Uri.parse("${Constants.BASE_URL}list"));
      if (response.statusCode == 200) {
        return RestaurantsDto.fromJson(json.decode(response.body));
      } else {
        throw Exception(Constants.failed_get_data);
      }
    } catch (e) {
      throw Exception(e.message);
    }
  }

  Future<RestaurantsDto> searchRestaurant({String query = ""}) async {
    try {
      final response = await http.get(Uri.parse("${Constants.BASE_URL}search?q=$query"));
      if (response.statusCode == 200) {
        return RestaurantsDto.fromJson(json.decode(response.body));
      } else {
        throw Exception(Constants.failed_get_data);
      }
    } catch (e) {
      throw Exception(e.message);
    }
  }

  Future<RestaurantDetailDto> getDetailRestaurant(String id) async {
    final response = await http.get(Uri.parse("${Constants.BASE_URL}detail/$id"));
    if (response.statusCode == 200) {
      return RestaurantDetailDto.fromJson(json.decode(response.body));
    } else {
      throw Exception(Constants.failed_get_data);
    }
  }
}
