import 'package:flutter/material.dart';
import 'package:flutter_restaurant_apps/model/drinkdto.dart';
import 'package:flutter_restaurant_apps/model/fooddto.dart';
import 'package:flutter_restaurant_apps/model/restaurantdto.dart';
import 'package:flutter_restaurant_apps/ui/widget/menu_item.dart';
import 'package:flutter_restaurant_apps/ui/widget/star_rating.dart';

import '../../constants.dart';

class RestaurantDetail extends StatefulWidget {
  final Restaurants restaurants;

  RestaurantDetail({Key key, @required this.restaurants}) : super(key: key);

  @override
  _RestaurantDetailState createState() => _RestaurantDetailState(restaurants);
}

class _RestaurantDetailState extends State<RestaurantDetail> {
  final Restaurants restaurants;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          "Restaurants Details",
        ),
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 10.0),
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 3.2,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      restaurants.pictureId,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: -10.0,
                  bottom: 3.0,
                  child: RawMaterialButton(
                    onPressed: () {},
                    fillColor: Colors.white,
                    shape: CircleBorder(),
                    elevation: 4.0,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                        size: 17,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Text(
              restaurants.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
              maxLines: 2,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5.0, top: 2.0),
              child: Row(
                children: <Widget>[
                  StarRating(
                    starCount: 5,
                    color: Constants.ratingBG,
                    allowHalfRating: true,
                    rating: 5.0,
                    size: 10.0,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    "${restaurants.rating}",
                    style: TextStyle(
                      fontSize: 11.0,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5.0, top: 2.0),
              child: Container(
                child: Text(
                  "${restaurants.menus.foods.length} foods, ${restaurants.menus.drinks.length} drinks",
                  style: TextStyle(
                    fontSize: 11.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              "Restaurant Description",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
              maxLines: 2,
            ),
            SizedBox(height: 10.0),
            Text(
              "${restaurants.description}",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              "Menu",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              "Food",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 15.0),
            Container(
                child: SizedBox(
              height: 225,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                primary: false,
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: restaurants.menus.foods == null
                    ? 0
                    : restaurants.menus.foods.length,
                itemBuilder: (BuildContext context, int index) {
                  Foods menu = restaurants.menus.foods[index];
                  return MenuItem(
                      title: menu.name,
                      svgSrc: index % 2 == 0
                          ? "assets/icons/food_one.svg"
                          : "assets/icons/food_two.svg");
                },
              ),
            )),
            SizedBox(height: 10.0),
            Text(
              "Beverage",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 15.0),
            Container(
                child: SizedBox(
                  height: 225,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    primary: false,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: restaurants.menus.drinks == null
                        ? 0
                        : restaurants.menus.drinks.length,
                    itemBuilder: (BuildContext context, int index) {
                      Drinks menu = restaurants.menus.drinks[index];
                      return MenuItem(
                          title: menu.name,
                          svgSrc: index % 2 == 0
                              ? "assets/icons/beverage_one.svg"
                              : "assets/icons/beverage_two.svg");
                    },
                  ),
                )),
          ],
        )),
      ),
    );
  }

  _RestaurantDetailState(this.restaurants);
}
