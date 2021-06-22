import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_restaurant_apps/model/restaurantdto.dart';
import 'package:flutter_restaurant_apps/ui/widget/restaurant_item.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> with AutomaticKeepAliveClientMixin<FavoritePage>{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10.0),
            Text(
              "My Favorite Items",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 10.0),
            FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString('assets/data/data.json'),
              builder: (context, snapshot) {
                var newData = json.decode(snapshot.data.toString());
                var restaurantList = Restaurant.fromJson(newData);
                return ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: restaurantList == null ? 0 :restaurantList.restaurants.length,
                  itemBuilder: (BuildContext context, int index) {
                    Restaurants restaurant = restaurantList.restaurants[index];
                    return RestaurantItem(
                      name: restaurant.name,
                      img: restaurant.pictureId,
                      description: restaurant.description,
                      city: restaurant.city,
                      rating: restaurant.rating,
                    );
                  },
                );
              },
            ),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
