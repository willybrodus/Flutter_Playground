import 'package:flutter/cupertino.dart';
import 'package:flutter_restaurant_apps/data/model/local/review_dto.dart';

class ReviewsDto {
  bool error;
  String message;
  List<ReviewDto> customerReviews;

  ReviewsDto({@required this.error, @required this.message, @required this.customerReviews});

  factory ReviewsDto.fromJson(Map<String, dynamic> json) => ReviewsDto(
        error: json["error"],
        message: json["message"],
        customerReviews: List<ReviewDto>.from(json["customerReviews"].map((x) => ReviewDto.fromJson(x))),
      );
}
