import 'dart:ui';

import 'package:flutter/material.dart';

class MyThemeData {
  static Color LightColorGreen = Color.fromRGBO(223, 236, 219, 1.0);
  static Color ColorBlue = Color.fromRGBO(93, 156, 236, 1.0);
  static Color DarkColorBlack = Color.fromRGBO(6, 14, 30, 1.0);
  static Color ColorGray = Color.fromRGBO(200, 201, 203, 1.0);
  static Color ColorWhite = Color.fromRGBO(255, 255, 255, 1.0);
  static Color ColorGreen = Color.fromRGBO(97, 231, 87, 1.0);
  static Color ColorBlack = Color.fromRGBO(20, 25, 34, 1.0);

  static ThemeData LightTheme = ThemeData(
    colorScheme: ColorScheme(
      primary: LightColorGreen,
      onPrimary: ColorBlack,
      background: Colors.transparent,
      onBackground: ColorBlack,
      error: Colors.red,
      onError: ColorWhite,
      secondary: ColorWhite,
      onSecondary: ColorBlack,
      surface: LightColorGreen,
      onSurface: ColorWhite,
      brightness: Brightness.light,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorWhite,
      selectedItemColor: ColorBlue,
      unselectedItemColor: ColorGray,
    ),
    textTheme: TextTheme(
        headline1: TextStyle(
            color: ColorWhite, fontSize: 22, fontWeight: FontWeight.bold),
        headline2: TextStyle(
            color: ColorBlue, fontSize: 18, fontWeight: FontWeight.bold),
        headline3: TextStyle(
            color: ColorGreen, fontSize: 18, fontWeight: FontWeight.bold)),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: ColorWhite,
    ),
  );
  static ThemeData DarkTheme = ThemeData(
    colorScheme: ColorScheme(
      primary: DarkColorBlack,
      onPrimary: ColorWhite,
      background: Colors.transparent,
      onBackground: ColorWhite,
      error: Colors.red,
      onError: ColorWhite,
      secondary: ColorBlack,
      onSecondary: ColorWhite,
      surface: DarkColorBlack,
      onSurface: ColorWhite,
      brightness: Brightness.dark,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorBlack,
      selectedItemColor: ColorBlue,
      unselectedItemColor: ColorGray,
    ),
    textTheme: TextTheme(
        headline1: TextStyle(
            color: ColorBlack, fontSize: 22, fontWeight: FontWeight.bold),
        headline2: TextStyle(
            color: ColorBlue, fontSize: 18, fontWeight: FontWeight.bold),
        headline3: TextStyle(
            color: ColorGreen, fontSize: 18, fontWeight: FontWeight.bold)),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: ColorBlack,
    ),
  );
}
