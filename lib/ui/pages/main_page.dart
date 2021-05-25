import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dart_date/dart_date.dart';
import 'package:marvin_kitchen/config/constants/ui/theme_constants.dart';
import 'package:get/get.dart';
import 'package:marvin_kitchen/ui/widgets/marvin_text.dart';

import '../../config/constants/ui/theme_constants.dart';
import 'main_page_controller.dart';

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
  final _controller = Get.find<MainPageController>();

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
            flex: 2,
              child: Center(
                  child: Obx(
            () => AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeOut,
                width: _controller.showMessage.value ? 300 : 0,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border: Border.all(
                    color: _themeController.currentTheme.value.borderColor,
                  ),
                  color: _themeController.currentTheme.value.canvasColor,
                ),
                child: AnimatedOpacity(
                  opacity: _controller.messageVisible.value ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 150),
                  child: Row(
                    children: [
                      Container(width: 40),
                      Expanded(
                          child: Center(
                              child: MarvinText(
                                  content: _controller.messageContent.value,
                                  style: TextStyle(fontSize: 20)))),
                      IconButton(
                        onPressed: () => hideMessage(),
                        icon: Icon(Icons.close, color: Colors.red, size: 15),
                      )
                    ],
                  ),
                )),
          ))),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Container(
                  height: 2,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: _themeController.currentTheme.value.borderColor,
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
                        color: _themeController.currentTheme.value.borderColor,
                        spreadRadius: 5,
                        blurRadius: 20, // changes position of shadow
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(),
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
    showMessage('Theme updated');
  }

  void showMessage(String message) async {
    _controller.semaphore++;
    final id = _controller.semaphore;
    _controller.showMessage.value = true;
    await Future.delayed(Duration(milliseconds: 300));
    _controller.messageContent.value = message;
    _controller.messageVisible.value = true;
    await Future.delayed(Duration(seconds: 3));
    if (id == _controller.semaphore){
      hideMessage();
    }
  }

  void hideMessage() async {
    _controller.messageVisible.value = false;
    await Future.delayed(Duration(milliseconds: 100));
    _controller.showMessage.value = false;
  }
}
