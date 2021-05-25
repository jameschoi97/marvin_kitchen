import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dart_date/dart_date.dart';
import 'package:marvin_kitchen/config/constants/ui/theme_constants.dart';
import 'package:get/get.dart';
import 'package:marvin_kitchen/ui/widgets/marvin_text.dart';

import '../../config/constants/ui/theme_constants.dart';

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
  final _showMessage = false.obs;
  final _messageVisible = false.obs;
  final _messageContent = ''.obs;

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
              boxShadow: [
                BoxShadow(
                    color: _themeController.currentTheme.value.barColor,
                    spreadRadius: 20,
                    blurRadius: 40,
                    offset: Offset(0, -10) // changes position of shadow
                    )
              ],
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
                        child: MarvinText(
                          content: DateTime.now().format('jm'),
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
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                children: [
                  Obx(() => Container(
                    height: 200,
                    child:
                        Center(
                          child: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeOut,
                              width: _showMessage.value ? 300 : 0,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                border: Border.all(
                                  color: _themeController
                                      .currentTheme.value.borderColor,
                                ),
                                color: _themeController
                                    .currentTheme.value.canvasColor,
                              ),
                              child: Visibility(
                                visible: _messageVisible.value ? true : false,
                                child: Row(
                                  children: [
                                    Container(width: 40),
                                    Expanded(child: Center(child: MarvinText(content: _messageContent.value, style: TextStyle(fontSize: 20)))),
                                    IconButton(
                                      onPressed: () => hideMessage(),
                                      icon: Icon(Icons.close,
                                          color: Colors.red, size: 15),
                                    )
                                  ],
                                ),
                              )),
                        ),

                  )),
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
                      color: _themeController.currentTheme.value.canvasColor,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: menu
                              .map((menu) => Container(
                                    child: MarvinText(
                                      content: menu.name,
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
                  Container(height: 200),
                ],
              ),
            )),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: _themeController.currentTheme.value.barColor,
                    spreadRadius: 20,
                    blurRadius: 40,
                    offset: Offset(0, 10) // changes position of shadow
                    )
              ],
            ),
            child: Row(
              children: [
                TextButton(
                  onPressed: () => showMessage('Update completed'),
                    child: Icon(
                  Icons.favorite_outline,
                  size: 50,
                )),
                Expanded(
                  child: Center(
                    child: TextButton(
                      onPressed: () => _themeController.currentTheme.value ==
                              MarvinTheme.normal
                          ? changeTheme(MarvinTheme.christmas)
                          : changeTheme(MarvinTheme.normal),
                      child: Icon(
                        Icons.lock_outlined,
                        size: 50,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => changeTheme(MarvinTheme.starWars),
                  child: Icon(
                    Icons.timer_outlined,
                    size: 50,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  void changeTheme(MarvinTheme theme) {
    _themeController.currentTheme.value = theme;
  }

  void showMessage(String message){
    _showMessage.value = true;
    _messageVisible.value = true;
    _messageContent.value = message;
  }

  void hideMessage(){
    _messageVisible.value = false;
    _showMessage.value = false;
  }
}
