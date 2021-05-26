import 'package:get/get.dart';

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

class RecipesController extends GetxController {
  var recipes = [
    Recipe.cookie,
    Recipe.cookie,
  ].obs;

  void addToRecipes(Recipe recipe) {
    recipes.add(recipe);
  }

}