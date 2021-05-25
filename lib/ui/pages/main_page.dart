import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dart_date/dart_date.dart';
import 'package:marvin_kitchen/config/constants/ui/theme_constants.dart';
import 'package:get/get.dart';

enum Menu {
  express,
  microwave,
  oven,
  precision,
  recipes,
  steam,
}

extension MenuExtension on Menu {
  String get name {
    if (index == Menu.express.index) return 'Express\n30s';
    if (index == Menu.microwave.index) return 'Microwave';
    if (index == Menu.oven.index) return 'Oven';
    if (index == Menu.precision.index) return 'Precision\nCooking';
    if (index == Menu.recipes.index) return 'Recipes';
    if (index == Menu.steam.index) return 'Steam Clean';
    return 'Error';
  }
}

class MainPage extends StatelessWidget {
  static final name = '/main';

  final _themeController = Get.find<MarvinThemeController>();

  final menu = [
    Menu.express,
    Menu.microwave,
    Menu.oven,
    Menu.precision,
    Menu.recipes,
    Menu.steam,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage()
            )
          ),
          child: Column(
      children: [
          Row(
            children: [
              Icon(
                Icons.lightbulb_outlined,
                size: 50,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone_android, size: 30),
                    Container(
                      child: Text(
                        DateTime.now().format('jm'),
                        style: TextStyle(fontSize: 20),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 15),
                    ),
                    Icon(Icons.wifi, size: 30),
                  ],
                ),
              ),
              Icon(
                Icons.settings_outlined,
                size: 50,
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: _themeController.currentTheme.value.primaryColor),
                      bottom: BorderSide(color: _themeController.currentTheme.value.primaryColor),
                    ),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: menu
                          .map((menu) => Container(
                                child: Text(
                                  menu.name,
                                  style: TextStyle(fontSize: 25),
                                  textAlign: TextAlign.center,
                                ),
                              ))
                          .toList())),
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.favorite_outline,
                size: 50,
              ),
              Expanded(
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      _themeController.currentTheme.value =
                          _themeController.currentTheme.value ==
                                  MarvinTheme.normal
                              ? MarvinTheme.christmas
                              : MarvinTheme.normal;
                    },
                    child: Icon(
                      Icons.lock_outlined,
                      size: 50,
                    ),
                  ),
                ),
              ),
              Icon(
                Icons.timer_outlined,
                size: 50,
              ),
            ],
          ),
      ],
    ),
        ));
  }
}
