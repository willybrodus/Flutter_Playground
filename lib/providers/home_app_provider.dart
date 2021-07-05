import 'package:flutter/foundation.dart';
import 'package:flutter_restaurant_apps/data/model/response/restaurants_dto.dart';
import 'package:flutter_restaurant_apps/data/result_state.dart';
import 'package:flutter_restaurant_apps/data/source/api/api_service.dart';

class HomePageProvider extends ChangeNotifier {

  final ApiService apiService = ApiService();
  RestaurantsDto _responseRestaurant;
  ResultState _state;
  String _message;

  RestaurantsDto get result => _responseRestaurant;
  ResultState get state => _state;
  String get message => _message;

  HomePageProvider getListRestaurant() {
    _fetchListRestaurant();
    return this;
  }

  Future<dynamic> _fetchListRestaurant() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final response = await apiService.getListRestaurant();
      if (response.restaurants.isEmpty) {
        _state = ResultState.Empty;
        notifyListeners();
        return _message = 'There is no data list';
      } else {
        _state = ResultState.Succeed;
        notifyListeners();
        return _responseRestaurant = response;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = "There is something wrong, please try again later! ";
    }
  }
}