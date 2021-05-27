import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:marvin_kitchen/config/constants/ui/theme_constants.dart';
import 'package:marvin_kitchen/ui/pages/main/main_page.dart';
import 'package:marvin_kitchen/ui/pages/microwave/microwave_page.dart';
import 'package:marvin_kitchen/ui/pages/recipes/recipes_page.dart';
import 'package:marvin_kitchen/ui/pages/timer/timer_page.dart';

class KitchenApp extends StatelessWidget {
  final _themeController = Get.find<MarvinThemeController>();

  @override
  Widget build(BuildContext context) {

    return Obx(() => GetMaterialApp(
      title: 'Marvin Kitchen',
      initialRoute: MainPage.name,
      theme: _themeController.getTheme(),
      routes: {
        MainPage.name: (_) => MainPage(),
      },
      getPages: [
        GetPage(
          name: MainPage.name,
          page: () => MainPage(),
        ),
        GetPage(
          name: MicrowavePage.name,
          page: () => MicrowavePage(),
        ),
        GetPage(
          name: RecipesPage.name,
          page: () => RecipesPage(),
        ),
        GetPage(
          name: TimerPage.name,
          page: () => TimerPage(),
        ),
      ],
    ));
  }
}