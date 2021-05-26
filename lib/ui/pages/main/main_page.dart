import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvin_kitchen/config/constants/ui/theme_constants.dart';
import 'package:get/get.dart';
import 'package:marvin_kitchen/ui/pages/microwave/microwave_page.dart';
import 'package:marvin_kitchen/ui/pages/recipes/recipes_page.dart';
import 'package:marvin_kitchen/ui/widgets/marvin_bottombar.dart';
import 'package:marvin_kitchen/ui/widgets/marvin_carousel.dart';
import 'package:marvin_kitchen/ui/widgets/marvin_text.dart';
import 'package:marvin_kitchen/ui/widgets/marvin_topbar.dart';

import '../../../config/constants/ui/theme_constants.dart';
import '../../../main_controller.dart';

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

  String get pageName {
    if (index == Menu.express.index) return 'Express\n30s';
    if (index == Menu.microwave.index) return MicrowavePage.name;
    if (index == Menu.oven.index) return 'Oven';
    if (index == Menu.precision.index) return 'Precision\nCooking';
    if (index == Menu.recipes.index) return RecipesPage.name;
    if (index == Menu.steam.index) return 'Steam Clean';
    return 'Error';
  }
}

class MainPage extends StatelessWidget {
  static final name = '/main';

  final _themeController = Get.find<MarvinThemeController>();
  final _controller = Get.find<MainController>();

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
          MarvinTopBar(main: true),
          Expanded(
              flex: 2,
              child: Center(
                  child: Obx(
                () => AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeOut,
                    width: _controller.messageAppear.value ? 300 : 0,
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
                                      text: Text(
                                          _controller.messageContent.value,
                                          style: TextStyle(fontSize: 20))))),
                          IconButton(
                            onPressed: () => _controller.hideMessage(),
                            icon:
                                Icon(Icons.close, color: Colors.red, size: 15),
                          )
                        ],
                      ),
                    )),
              ))),
          Expanded(
              flex: 3,
              child: MarvinCarousel(
                  children: menu
                      .map((menu) => Container(
                            child: TextButton(
                              onPressed: () => Get.toNamed(menu.pageName),
                              child: MarvinText(
                                  text: Text(
                                menu.name,
                                style: _themeController.getTheme().textTheme.headline2,
                                textAlign: TextAlign.center,
                              )),
                            ),
                          ))
                      .toList())),
          Expanded(
            flex: 2,
            child: Container(),
          ),
          MarvinBottomBar(main: true),
        ],
      ),
    ));
  }
}
