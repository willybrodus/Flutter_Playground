import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant_apps/data/model/local/restaurant_dto.dart';
import 'package:flutter_restaurant_apps/data/result_state.dart';
import 'package:flutter_restaurant_apps/providers/favorite_app_provider.dart';
import 'package:provider/provider.dart';

class FavoriteButton extends StatelessWidget {
  final RestaurantDto restaurant;

  const FavoriteButton({this.restaurant});

  /*@override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) =>
          DetailRestaurantProvider().isFavorite(restaurant),
      child:
          Consumer<DetailRestaurantProvider>(builder: (context, provider, _) {
        switch (provider.favoritestate) {
          case FavoriteState.Loading:
            return Icon(Icons.favorite_outline, color: Colors.red);
            break;
          case FavoriteState.isNotFavorite:
            return IconButton(
              icon: Icon(Icons.favorite_outline, color: Colors.red),
              onPressed: () {
                provider.saveFavorite(restaurant);
              },
            );
            break;
          case FavoriteState.isFavorite:
            return IconButton(
              icon: Icon(Icons.favorite),
              color: Colors.red,
              onPressed: () {
                provider.saveFavorite(restaurant);
              },
            );
            break;
        }
        return Container();
      }),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) =>
          FavoritePageProvider().isFavorite(restaurant),
      child:
      Consumer<FavoritePageProvider>(builder: (context, provider, _) {
        switch (provider.favoritestate) {
          case FavoriteState.Loading:
            return Icon(Icons.favorite_outline, color: Colors.red);
            break;
          case FavoriteState.isNotFavorite:
            return IconButton(
              icon: Icon(Icons.favorite_outline, color: Colors.red),
              onPressed: () {
                provider.saveFavorite(restaurant);
              },
            );
            break;
          case FavoriteState.isFavorite:
            return IconButton(
              icon: Icon(Icons.favorite),
              color: Colors.red,
              onPressed: () {
                provider.saveFavorite(restaurant);
              },
            );
            break;
        }
        return Container();
      }),
    );
  }
}
