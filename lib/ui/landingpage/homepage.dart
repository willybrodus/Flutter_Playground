import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_restaurant_apps/model/restaurantdto.dart';
import 'package:flutter_restaurant_apps/ui/widget/restaurant_item.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin<HomePage >{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
        child:FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/data/data.json'),
          builder: (context, snapshot) {
            var newData = json.decode(snapshot.data.toString());
            var restaurantList = Restaurant.fromJson(newData);
            return ListView.builder(
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
      ),
    );

  }

  @override
  bool get wantKeepAlive => true;
}
