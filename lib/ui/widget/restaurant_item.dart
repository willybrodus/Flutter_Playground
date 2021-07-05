import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant_apps/data/model/local/restaurant_dto.dart';
import 'package:flutter_restaurant_apps/providers/favorite_app_provider.dart';
import 'package:flutter_restaurant_apps/ui/detailrestaurantpage/detail_restaurant_page.dart';
import 'package:flutter_restaurant_apps/ui/widget/star_rating.dart';

import '../../constants.dart';

class RestaurantItem extends StatelessWidget {
  final RestaurantDto restaurant;
  final FavoritePageProvider provider;

  RestaurantItem({Key key, @required this.restaurant, this.provider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: InkWell(
        onTap: () {
          FocusScope.of(context).unfocus();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return RestaurantDetail(restaurant: restaurant);
              },
            ),
          ).then((value) => provider?.getListFavoriteRestaurant());
        },
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 0.0, right: 10.0),
              child: Container(
                height: MediaQuery.of(context).size.width / 3.5,
                width: MediaQuery.of(context).size.width / 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: CachedNetworkImage(
                    imageUrl: restaurant.getSmallPicture(),
                    width: 150,
                    height: 140,
                    fit: BoxFit.cover,
                    progressIndicatorBuilder: (context, data, _) => Center(
                      child: CircularProgressIndicator(
                          color: Theme.of(context).accentColor),
                      widthFactor: 0.5,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "${restaurant.name}",
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
                        "${restaurant.rating}",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 6.0),
                  Text(
                    "${restaurant.city}",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(width: 6.0),
                  Text(
                    "${restaurant.description}",
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
