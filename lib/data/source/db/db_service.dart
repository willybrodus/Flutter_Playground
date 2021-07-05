import 'dart:async';

import 'package:flutter_restaurant_apps/constants.dart';
import 'package:flutter_restaurant_apps/data/model/local/restaurant_dto.dart';
import 'package:hive/hive.dart';

class DbService {
  Box<dynamic> box;
  Box<dynamic> theme;

  DbService() {
    box = Hive.box(Constants.DB_NAME_FAVORITES);
  }

  Future<List<RestaurantDto>> getFavorites() async {
    return box.values.toList().cast<RestaurantDto>();
  }

  Future<RestaurantDto> getFavoritesById(RestaurantDto restaurant) async {
    return box.get(restaurant.id);
  }

  Future<bool> saveToDB(RestaurantDto restaurant) async {
    try{
      box.put(restaurant.id, restaurant);
      return true;
    } catch (e) {
      throw HiveError(e.toString());
    }
  }

  Future<bool> deleteToDB(RestaurantDto restaurant) async {
    try{
      box.delete(restaurant.id);
      return true;
    } catch (e) {
      throw HiveError(e.toString());
    }
  }

  Future<List<RestaurantDto>> getFavorite() async {
    try {
      return box.values.toList().cast<RestaurantDto>();
    } catch (e) {
      throw HiveError(e.toString());
    }
  }
}
