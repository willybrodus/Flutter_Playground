import 'package:flutter/foundation.dart';
import 'package:flutter_restaurant_apps/data/model/local/restaurant_dto.dart';
import 'package:flutter_restaurant_apps/data/result_state.dart';
import 'package:flutter_restaurant_apps/data/source/api/api_service.dart';

class DetailRestaurantProvider extends ChangeNotifier {

  final ApiService apiService = ApiService();
  RestaurantDto _responseDetailRestaurant;
  ResultState _state;
  String _message;

  RestaurantDto get result => _responseDetailRestaurant;
  ResultState get state => _state;
  String get message => _message;

  DetailRestaurantProvider getDetailRestaurant(String id) {
    _fetchGetRestaurant(id);
    return this;
  }

  Future<dynamic> _fetchGetRestaurant(String id) async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final response = await apiService.getDetailRestaurant(id);
      if (response.restaurant == null) {
        _state = ResultState.Empty;
        notifyListeners();
        return _message = 'There is no data restaurant';
      } else {
        _state = ResultState.Succeed;
        notifyListeners();
        return _responseDetailRestaurant = response.restaurant;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = "There is something wrong, please try again later! ";
    }
  }
}