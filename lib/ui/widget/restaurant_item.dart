import 'package:flutter/material.dart';
import 'package:flutter_restaurant_apps/ui/widget/star_rating.dart';

import '../../constants.dart';


class RestaurantItem extends StatelessWidget {
  final String name;
  final String img;
  final String description;
  final String city;
  final double rating;


  RestaurantItem({
    Key key,
    @required this.name,
    @required this.img,
    @required this.description,
    @required this.city,
    @required this.rating})
      :super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: InkWell(
        onTap: (){
          // Todo Navigation to Detail Restaurant
        },
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 0.0, right: 10.0),
              child: Container(
                height: MediaQuery.of(context).size.width/3.5,
                width: MediaQuery.of(context).size.width/3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    img,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "$name",
                  style: TextStyle(
//                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 6.0),
                Row(
                  children: <Widget>[
                    StarRating(
                      starCount: 1,
                      color: Constants.ratingBG,
                      allowHalfRating: true,
                      rating: 5.0,
                      size: 12.0,
                    ),
                    SizedBox(width: 6.0),
                    Text(
                      "$rating",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 6.0),
                Text(
                  "$city",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(width: 6.0),
                Text(
                  "$description",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                )
              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}
