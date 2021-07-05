class ReviewDto {
  ReviewDto({this.id, this.name, this.review, this.date});

  String id;
  String name;
  String review;
  String date;

  factory ReviewDto.fromJson(Map<String, dynamic> json) => ReviewDto(
        id: json["id"] ?? null,
        name: json["name"],
        review: json["review"],
        date: json["date"] ?? null,
      );

  Map<String, dynamic> toJson() => {"id": id, "name": name, "review": review, "date": date};
}
