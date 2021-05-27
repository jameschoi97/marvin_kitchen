/*
import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class MainPage extends StatelessWidget {
  static final String name = '/main';
  StreamController<int> selected = StreamController<int>();

  @override
  Widget build(BuildContext context) {
    final borderColor = Color(0xFF3BBEC2);
    final rouletteColor = Color(0xFFDDFBFC);
    final items = [
      Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Container(
            height: 150,
              width: 150,
              padding: EdgeInsets.only(bottom: 50),
              child: Image.asset('rullette_1st.png',)
          ),
        )
      ),
      Container(
          color: rouletteColor,
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Container(
                height: 150,
                width: 150,
                padding: EdgeInsets.only(bottom: 50),
                child: Image.asset('rullette_2nd.png',)
            ),
          )
      ),
      Container(
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Container(
                height: 150,
                width: 150,
                padding: EdgeInsets.only(bottom: 50),
                child: Image.asset('rullette_3rd.png',)
            ),
          )
      ),
      Container(
          color: rouletteColor,
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Container(
                height: 150,
                width: 150,
                padding: EdgeInsets.only(bottom: 50),
                child: Image.asset('rullette_2nd.png',)
            ),
          )
      ),
      Container(
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Container(
                height: 150,
                width: 150,
                padding: EdgeInsets.only(bottom: 50),
                child: Image.asset('rullette_3rd.png',)
            ),
          )
      ),
      Container(
          color: rouletteColor,
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Container(
                height: 150,
                width: 150,
                padding: EdgeInsets.only(bottom: 50),
                child: Image.asset('rullette_better_luck.png',)
            ),
          )
      ),
    ];
    return
          Center(
              child: Container(
                decoration: BoxDecoration(
                  color: borderColor,
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(20),
                child: FortuneWheel(
                  selected: selected.stream,
                  items:
                  items.map((item) => FortuneItem(child: Transform.rotate(
                      angle: pi/2,
                      child: item
                  ))).toList()
                  ,

                ),
              )

    );
  }

}
*/




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvin_kitchen/config/constants/ui/theme_constants.dart';
import 'package:get/get.dart';
import 'package:marvin_kitchen/ui/pages/microwave/microwave_page.dart';
import 'package:marvin_kitchen/ui/pages/recipes/recipes_page.dart';
import 'package:marvin_kitchen/ui/widgets/marvin_bottombar.dart';
import 'package:marvin_kitchen/ui/widgets/marvin_carousel.dart';
import 'package:marvin_kitchen/ui/widgets/marvin_notification.dart';
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

  final menuItems = [
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
                  child:  MarvinNotification(),
              )),
          Expanded(
              flex: 3,
              child: MarvinCarousel(
                  children: menuItems
                      .map((menu) => Obx( () => Stack(
                            children: [
                              Center(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width / 60,
                                    vertical:
                                        MediaQuery.of(context).size.width / 30,
                                  ),
                                  decoration: _controller.newRecipes.isNotEmpty && menu == Menu.recipes
                                      ? BoxDecoration(
                                          border: Border.all(
                                            color: _themeController.currentTheme
                                                .value.notificationColor,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                400,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        )
                                      : null,
                                  child: TextButton(
                                    onPressed: () => Get.toNamed(menu.pageName),
                                    child: MarvinText(
                                      text: Text(
                                        menu.name,
                                        style: _themeController
                                            .getTheme()
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  6 /
                                                  menuItems.length,
                                            ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              _controller.newRecipes.isNotEmpty && menu == Menu.recipes
                                  ? Positioned(
                                      top: 0,
                                      bottom:
                                          MediaQuery.of(context).size.width / 10,
                                      right: 0,
                                      left: 0,
                                      child: Center(
                                        child: Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  80,
                                              vertical: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  100,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: _themeController
                                                  .currentTheme
                                                  .value
                                                  .notificationColor,
                                            ),
                                            child: Text(
                                              'New',
                                              style: TextStyle(
                                                color: _themeController
                                                    .currentTheme
                                                    .value
                                                    .notificationTextColor,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    50,
                                              ),
                                            )),
                                      ))
                                  : Container(),
                            ],
                          )))
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
