import 'package:flutter/foundation.dart';
import 'package:flutter_restaurant_apps/data/model/local/review_dto.dart';
import 'package:hive/hive.dart';

import '../../../constants.dart';
import 'categories_dto.dart';
import 'menus_dto.dart';

part 'restaurant_dto.g.dart';

@HiveType(typeId: 0)
class RestaurantDto {
  RestaurantDto(
      {@required this.id,
      @required this.name,
      @required this.description,
      @required this.pictureId,
      @required this.city,
      @required this.rating,
      this.address,
      this.categories,
      this.menus,
      this.customerReviews});

  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String description;
  @HiveField(3)
  String pictureId;
  @HiveField(4)
  String address;
  @HiveField(5)
  String city;
  @HiveField(6)
  double rating;
  @HiveField(7)
  List<CategoriesDto> categories;
  @HiveField(8)
  MenusDto menus;
  @HiveField(9)
  List<ReviewDto> customerReviews;

  factory RestaurantDto.fromJson(Map<String, dynamic> json) => RestaurantDto(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      pictureId: json["pictureId"],
      address: json["address"] == null ? null : json["address"],
      city: json["city"],
      rating: json["rating"].toDouble(),
      categories: json["categories"] == null
          ? null
          : List<CategoriesDto>.from(json['categories'].map((x) => CategoriesDto.fromJson(x))),
      menus: json["menus"] == null ? null : MenusDto.fromJson(json["menus"]),
      customerReviews: json["customerReviews"] == null
          ? null
          : List<ReviewDto>.from((json["customerReviews"] as List)
              .map((x) => ReviewDto.fromJson(x))
              .where((review) => review.review != null && review.name.length > 0)));

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "pictureId": pictureId,
        "address": address,
        "city": city,
        "rating": rating,
        "categories": categories == null ? null : List<dynamic>.from(categories.map((e) => e.toJson())),
        "menus": menus == null ? null : menus.toJson(),
        "customerReviews":
            customerReviews == null ? null : List<dynamic>.from(customerReviews.map((e) => e.toJson()))
      };

  String getSmallPicture() => Constants.IMG_SMALL_URL + this.pictureId;

  String getMediumPicture() => Constants.IMG_MEDIUM_URL + this.pictureId;

  String getLargePicture() => Constants.IMG_LARGE_URL + this.pictureId;
}
