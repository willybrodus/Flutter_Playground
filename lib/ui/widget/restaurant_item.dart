import 'package:flutter/material.dart';
import 'package:flutter_restaurant_apps/model/restaurantdto.dart';
import 'package:flutter_restaurant_apps/ui/detailrestaurantpage/detailrestaurantpage.dart';
import 'package:flutter_restaurant_apps/ui/widget/star_rating.dart';

import '../../constants.dart';


class RestaurantItem extends StatelessWidget {
  final Restaurants restaurants;

  RestaurantItem({
    Key key,
    @required this.restaurants,})
      :super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context){
                return RestaurantDetail(restaurants : restaurants);
              },
            ),
          );
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
                    restaurants.pictureId,
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
                  "${restaurants.name}",
                  style: TextStyle(
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
                      "${restaurants.rating}",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 6.0),
                Text(
                  "${restaurants.city}",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(width: 6.0),
                Text(
                  "${restaurants.description}",
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
