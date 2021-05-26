import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvin_kitchen/config/constants/ui/theme_constants.dart';
import 'package:marvin_kitchen/ui/pages/recipes/recipes_controller.dart';
import 'package:marvin_kitchen/ui/widgets/marvin_bottombar.dart';
import 'package:marvin_kitchen/ui/widgets/marvin_carousel.dart';
import 'package:marvin_kitchen/ui/widgets/marvin_text.dart';
import 'package:marvin_kitchen/ui/widgets/marvin_topbar.dart';



class RecipesPage extends GetView<RecipesController> {
  static final String name = '/recipes';

  final _themeController = Get.find<MarvinThemeController>();
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: _themeController.getDecoration(),
            child: Column(
              children: [
                MarvinTopBar(),
                Expanded(
                  flex: 2,
                  child: Container(),
                ),
                Expanded(
                    flex: 3,
                    child: Obx(() => MarvinCarousel(
                      scrollable: true,
                      children: controller.recipes.map((recipe) => Container(
                        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 50),
                        child: TextButton(
                          onPressed: () => controller.addToRecipes(Recipe.pizza),
                          child: MarvinText(
                              text: Text(
                                recipe.name,
                                style: _themeController.getTheme().textTheme.headline2!.copyWith(
                                  fontSize: MediaQuery.of(context).size.width / 30
                                ),
                                textAlign: TextAlign.center,
                              )),
                        ),
                      ))
                          .toList()
                    ))),
                Expanded(
                  flex: 2,
                  child: Container(),
                ),
                MarvinBottomBar(),
              ],
            )));
  }


}
