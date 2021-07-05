import 'package:flutter/material.dart';
import 'package:flutter_restaurant_apps/providers/theme_app_provider.dart';
import 'package:flutter_restaurant_apps/ui/splash/splash.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'constants.dart';
import 'data/model/local/categories_dto.dart';
import 'data/model/local/menu_dto.dart';
import 'data/model/local/menus_dto.dart';
import 'data/model/local/restaurant_dto.dart';
import 'data/model/local/review_dto.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(RestaurantDtoAdapter());
  Hive.registerAdapter(MenusDtoAdapter());
  Hive.registerAdapter(MenuDtoAdapter());
  Hive.registerAdapter(CategoriesDtoAdapter());
  Hive.registerAdapter(ReviewDtoAdapter());
  await Hive.openBox(Constants.DB_NAME_FAVORITES);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeAppProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeAppProvider>(
      builder: (BuildContext context, ThemeAppProvider appProvider, Widget child) {
        return MaterialApp(
          key: appProvider.key,
          debugShowCheckedModeBanner: false,
          navigatorKey: appProvider.navigatorKey,
          title: Constants.appName,
          theme: appProvider.theme,
          darkTheme: Constants.darkTheme,
          home: SplashScreen(),
        );
      },
    );
  }
}