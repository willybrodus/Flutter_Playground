import 'package:flutter/foundation.dart';
import 'package:flutter_restaurant_apps/data/model/local/restaurant_dto.dart';
import 'package:flutter_restaurant_apps/data/result_state.dart';
import 'package:flutter_restaurant_apps/data/source/db/db_service.dart';

class FavoritePageProvider extends ChangeNotifier {

  final DbService dbService = DbService();
  List<RestaurantDto> _favoriteRestaurant;
  ResultState _state;
  String _message;
  FavoriteState _isFavoriteState;
  FavoriteState get favoritestate => _isFavoriteState;

  List<RestaurantDto> get result => _favoriteRestaurant;
  ResultState get state => _state;
  String get message => _message;

  FavoritePageProvider getListFavoriteRestaurant() {
    _fetchListFavoriteRestaurant();
    return this;
  }

  Future<dynamic> _fetchListFavoriteRestaurant() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final response = await dbService.getFavorite();
      if (response.isEmpty) {
        _state = ResultState.Empty;
        notifyListeners();
        return _message = 'There is no data list';
      } else {
        _state = ResultState.Succeed;
        notifyListeners();
        return _favoriteRestaurant = response;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = "There is something wrong, please try again later! ";
    }
  }

  FavoritePageProvider isFavorite(RestaurantDto restaurant) {
    _isFavorite(restaurant);
    return this;
  }

  FavoritePageProvider saveFavorite(RestaurantDto restaurant) {
    _saveFavorite(restaurant);
    return this;
  }



  Future<dynamic> _isFavorite(RestaurantDto restaurant) async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final response = await dbService.getFavoritesById(restaurant);
      if (response != null) {
        _isFavoriteState = FavoriteState.isFavorite;
        notifyListeners();
      } else {
        _isFavoriteState = FavoriteState.isNotFavorite;
        notifyListeners();
      }
    } catch (e) {
      _isFavoriteState = FavoriteState.isNotFavorite;
      notifyListeners();
    }
  }

  Future<dynamic> _saveFavorite(RestaurantDto restaurant) async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final response = await dbService.getFavoritesById(restaurant);
      if (response != null) {
        _isFavoriteState = FavoriteState.isNotFavorite;
        dbService.deleteToDB(restaurant);
        getListFavoriteRestaurant();
        notifyListeners();
      } else {
        _isFavoriteState = FavoriteState.isFavorite;
        dbService.saveToDB(restaurant);
        getListFavoriteRestaurant();
        notifyListeners();
      }
    } catch (e) {
      _isFavoriteState = FavoriteState.isNotFavorite;
      notifyListeners();
    }
  }
}