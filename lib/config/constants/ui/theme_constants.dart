import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum MarvinTheme {
  normal,
  christmas,
}

extension ThemeExtension on MarvinTheme {
  Color get primaryColor {
    if (index == MarvinTheme.normal.index) return Colors.black;
    if (index == MarvinTheme.christmas.index) return Colors.red;
    return Colors.white;
  }

  Color get canvasColor {
    if (index == MarvinTheme.normal.index) return Colors.white;
    if (index == MarvinTheme.christmas.index) return Colors.green;
    return Colors.white;
  }

  Color get overlayColor {
    if (index == MarvinTheme.normal.index) return Colors.blueGrey;
    if (index == MarvinTheme.christmas.index) return Colors.pinkAccent;
    return Colors.white;
  }

}

class MarvinThemeController extends GetxController {
  var currentTheme = MarvinTheme.normal.obs;

  ThemeData getTheme() {
    return ThemeData(
        canvasColor: currentTheme.value.canvasColor,
        textTheme: TextTheme(
          headline1:
              TextStyle(color: currentTheme.value.primaryColor, fontSize: 96),
          headline2:
              TextStyle(color: currentTheme.value.primaryColor, fontSize: 60),
          headline3:
              TextStyle(color: currentTheme.value.primaryColor, fontSize: 48),
          headline4:
              TextStyle(color: currentTheme.value.primaryColor, fontSize: 34),
          headline5:
              TextStyle(color: currentTheme.value.primaryColor, fontSize: 24),
          headline6:
              TextStyle(color: currentTheme.value.primaryColor, fontSize: 20),
          subtitle1:
              TextStyle(color: currentTheme.value.primaryColor, fontSize: 16),
          subtitle2:
              TextStyle(color: currentTheme.value.primaryColor, fontSize: 14),
          bodyText1:
              TextStyle(color: currentTheme.value.primaryColor, fontSize: 16),
          bodyText2:
              TextStyle(color: currentTheme.value.primaryColor, fontSize: 14),
          button:
              TextStyle(color: currentTheme.value.primaryColor, fontSize: 14),
          caption:
              TextStyle(color: currentTheme.value.primaryColor, fontSize: 12),
          overline:
              TextStyle(color: currentTheme.value.primaryColor, fontSize: 10),
        ),
      iconTheme: IconThemeData(
        color: currentTheme.value.primaryColor,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          foregroundColor: MaterialStateProperty.all(currentTheme.value.overlayColor)
        )
      )
    );
  }
}
