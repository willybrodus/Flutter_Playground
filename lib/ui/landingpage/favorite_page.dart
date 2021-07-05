import 'package:flutter/material.dart';
import 'package:flutter_restaurant_apps/data/model/local/restaurant_dto.dart';
import 'package:flutter_restaurant_apps/data/result_state.dart';
import 'package:flutter_restaurant_apps/providers/favorite_app_provider.dart';
import 'package:flutter_restaurant_apps/ui/widget/restaurant_item.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage>
    with AutomaticKeepAliveClientMixin<FavoritePage> {
  var isNeedReload = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
          "My Favorite Restaurant",
        ),
        elevation: 0.0,
      ),
      body: ChangeNotifierProvider(
        create: (_) => FavoritePageProvider().getListFavoriteRestaurant(),
        child: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
          child: Container(
            child: Consumer<FavoritePageProvider>(builder: (context, state, _) {
              if (state.state == ResultState.Loading) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                        child: CircularProgressIndicator(
                            color: Theme.of(context).accentColor)),
                    SizedBox(height: 30),
                  ],
                );
              } else if (state.state == ResultState.Succeed) {
                var newData = state.result;
                return ListView.builder(
                  itemCount: newData == null ? 0 : newData.length,
                  itemBuilder: (BuildContext context, int index) {
                    RestaurantDto restaurant = newData[index];
                    return RestaurantItem(restaurant: restaurant, provider: state,);
                  },
                );
              } else if (state.state == ResultState.Error) {
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
              } else {
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
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
