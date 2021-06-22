import 'package:flutter_restaurant_apps/model/restaurantdto.dart';

class Restaurant {
  List<Restaurants> restaurants;

  Restaurant({this.restaurants});

  Restaurant.fromJson(Map<String, dynamic> json) {
    if (json['restaurants'] != null) {
      restaurants = [];
      json['restaurants'].forEach((v) {
        restaurants.add(new Restaurants.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.restaurants != null) {
      data['restaurants'] = this.restaurants.map((v) => v.toJson()).toList();
    }
    return data;
  }
}