import 'package:flutter/material.dart';
class Constants{

  static String appName = "Whats Food";

  static Color lightPrimary = Color(0xfffcfcff);
  static Color darkPrimary = Colors.black;
  static Color lightAccent = Color(0xffE26A29);
  static Color darkAccent = Color(0xffEB762B);
  static Color lightBG = Color(0xfffcfcff);
  static Color darkBG = Colors.black;
  static Color ratingBG = Colors.yellow[600];
  static Color kOrangeSemi = Color(0xFFFFC61F);
  static Color kBlackSemiColor = Color(0xFF121212);

  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor:  lightAccent,
    textSelectionTheme: TextSelectionThemeData(
        selectionHandleColor : lightAccent
    ),
    cardColor: lightPrimary,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        subtitle1: TextStyle(
          color: darkBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    cardColor: kBlackSemiColor,
    textSelectionTheme: TextSelectionThemeData(
        selectionHandleColor : darkAccent
    ),
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        subtitle1: TextStyle(
          color: lightBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );

  static const String BASE_URL = 'https://restaurant-api.dicoding.dev/';
  static const String IMG_SMALL_URL = BASE_URL + "images/small/";
  static const String IMG_MEDIUM_URL = BASE_URL + "images/medium/";
  static const String IMG_LARGE_URL = BASE_URL + "images/large/";
  static const String BOX_FAVORITES = "favorites";
  static const String failed_get_data = "Failed to get the data, try again later";
  static const String failed_post_review = "Failed to send review, try again later";
}