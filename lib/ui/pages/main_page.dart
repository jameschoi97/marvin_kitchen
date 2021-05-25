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
      decoration: _themeController.getDecoration(),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(
                color:
                Colors.white,
                spreadRadius: 20,
                blurRadius: 40,
                offset: Offset(0, -10)// changes position of shadow
              )],
            ),
            child: Row(
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
          ),
          Expanded(
            child: Center(
                child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                children: [
                  Container(
                    height: 2,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color:
                              _themeController.currentTheme.value.borderColor,
                          spreadRadius: 5,
                          blurRadius: 20, // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      color: _themeController.currentTheme.value.canvasColor,
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
                              .toList()),
                    ),
                  ),
                  Container(
                    height: 2,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color:
                              _themeController.currentTheme.value.borderColor,
                          spreadRadius: 5,
                          blurRadius: 20, // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(
                  color:
                  Colors.white,
                  spreadRadius: 20,
                  blurRadius: 40,
                  offset: Offset(0, 10)// changes position of shadow
              )],
            ),
            child: Row(
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
          ),
        ],
      ),
    ));
  }
}
