import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvin_kitchen/config/constants/ui/theme_constants.dart';
import 'package:marvin_kitchen/ui/widgets/marvin_bottombar.dart';
import 'package:marvin_kitchen/ui/widgets/marvin_carousel.dart';
import 'package:marvin_kitchen/ui/widgets/marvin_text.dart';
import 'package:marvin_kitchen/ui/widgets/marvin_topbar.dart';

enum Recipe {
  cookie,
  pizza,
}

extension RecipeExtension on Recipe {
  String get name {
    if (index == Recipe.cookie.index) return 'Cookie';
    if (index == Recipe.pizza.index) return 'Pizza';
    return 'Error';
  }
}


class RecipesPage extends StatelessWidget {
  static final String name = '/recipes';

  final _themeController = Get.find<MarvinThemeController>();
  
  var recipes = [
    Recipe.cookie,
    Recipe.cookie,
    /*Recipe.cookie,
    Recipe.cookie,
    Recipe.cookie,
    Recipe.cookie,
    Recipe.cookie,
    Recipe.cookie,
    Recipe.cookie,
    Recipe.cookie,
    Recipe.cookie,
    Recipe.cookie,*/
  ].obs;

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
                      children: recipes.map((recipe) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        child: TextButton(
                          onPressed: () => addToRecipes(Recipe.pizza),
                          child: MarvinText(
                              text: Text(
                                recipe.name,
                                style: _themeController.getTheme().textTheme.headline2,
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

  void addToRecipes(Recipe recipe) {
    recipes.add(recipe);
  }
}
