import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant_apps/data/model/local/menu_dto.dart';
import 'package:flutter_restaurant_apps/data/model/local/restaurant_dto.dart';
import 'package:flutter_restaurant_apps/data/result_state.dart';
import 'package:flutter_restaurant_apps/providers/detai_restaurantl_app_provider.dart';
import 'package:flutter_restaurant_apps/ui/widget/menu_item.dart';
import 'package:flutter_restaurant_apps/ui/widget/star_rating.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class RestaurantDetail extends StatelessWidget {
  final RestaurantDto restaurant;

  RestaurantDetail({Key key, @required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
        body: ChangeNotifierProvider(
            create: (_) => DetailRestaurantProvider().getDetailRestaurant(restaurant.id),
            child : Padding(
              padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
              child: Container(
                child: Consumer<DetailRestaurantProvider>(builder: (context, state, _) {
                  if (state.state == ResultState.Loading) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(child: CircularProgressIndicator(color: Theme.of(context).accentColor)),
                        SizedBox(height: 30),
                      ],
                    );
                  } else if (state.state == ResultState.Succeed) {
                    var restaurantDetail = state.result;
                    return SingleChildScrollView(
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
                                    child: CachedNetworkImage(
                                      imageUrl : restaurantDetail.getMediumPicture(),
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
                              restaurantDetail.name,
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
                                    "${restaurantDetail.rating}",
                                    style: TextStyle(
                                      fontSize: 11.0,
                                    ),
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    "(${restaurantDetail.customerReviews.length} Reviewers)",
                                    style: TextStyle(
                                      fontSize: 11.0,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 5.0, top: 2.0),
                              child: Container(
                                child: Text(
                                  "${restaurantDetail.menus.foods.length} foods, ${restaurantDetail.menus.drinks.length} drinks",
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
                              "${restaurantDetail.description}",
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
                                    itemCount: restaurantDetail.menus.foods == null
                                        ? 0
                                        : restaurantDetail.menus.foods.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      MenuDto menu = restaurantDetail.menus.foods[index];
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
                                    itemCount: restaurantDetail.menus.drinks == null
                                        ? 0
                                        : restaurantDetail.menus.drinks.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      MenuDto menu = restaurantDetail.menus.drinks[index];
                                      return MenuItem(
                                          title: menu.name,
                                          svgSrc: index % 2 == 0
                                              ? "assets/icons/beverage_one.svg"
                                              : "assets/icons/beverage_two.svg");
                                    },
                                  ),
                                )),
                          ],
                        ));
                  } else if(state.state == ResultState.Error){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Icon(
                                  Icons.bug_report_sharp,
                                  size: 150.0,
                                  color: Theme.of(context).accentColor,
                                ),
                                SizedBox(width: 40.0),
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(
                                    top: 15.0,
                                  ),
                                  child: Text(
                                    state.message,
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w700,
                                      color: Theme.of(context).accentColor,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(height: 30),
                      ],
                    );
                  }else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Icon(
                                  Icons.food_bank,
                                  size: 150.0,
                                  color: Theme.of(context).accentColor,
                                ),
                                SizedBox(width: 40.0),
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(
                                    top: 15.0,
                                  ),
                                  child: Text(
                                    state.message,
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w700,
                                      color: Theme.of(context).accentColor,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(height: 30),
                      ],
                    );
                  }
                }),
              ),
            )
        )
    );
  }
}