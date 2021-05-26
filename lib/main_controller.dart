import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:marvin_kitchen/config/constants/ui/theme_constants.dart';
import 'package:marvin_kitchen/ui/widgets/marvin_fireworks.dart';
import 'package:marvin_kitchen/ui/widgets/marvin_text.dart';

enum Recipe {
  cookie,
  pizza,
  oatmeal,
  omelette,
  friedRice,
  chickenSoup,
  brownie,
}

extension RecipeExtension on Recipe {
  String get name {
    if (index == Recipe.cookie.index) return 'Cookie';
    if (index == Recipe.pizza.index) return 'Pizza';
    if (index == Recipe.oatmeal.index) return 'Oatmeal';
    if (index == Recipe.omelette.index) return 'Omelette';
    if (index == Recipe.friedRice.index) return 'Fried\nRice';
    if (index == Recipe.chickenSoup.index) return 'Chicken\nSoup';
    if (index == Recipe.brownie.index) return 'Brownie';
    return 'Error';
  }
}


class MainController extends GetxController {
  final messageAppear = false.obs;
  final messageVisible = false.obs;
  final messageContent = ''.obs;
  var currentTime = DateTime.now().obs;

  var semaphore = 0;

  var recipes = [
    Recipe.cookie,
    Recipe.pizza,
    Recipe.oatmeal,
    Recipe.omelette,
    Recipe.friedRice,
    Recipe.chickenSoup,
  ].obs;

  var newRecipes = <Recipe>[].obs;

  final _themeController = Get.find<MarvinThemeController>();
  
  
  @override
  void onInit() {
    Timer.periodic(Duration(seconds: 2), (Timer t) => currentTime.value = DateTime.now());
    super.onInit();
  }

  void changeTheme(MarvinTheme theme) {
    _themeController.currentTheme.value = theme;
    showMessage('Theme updated');
  }

  void showMessage(String message) async {
    semaphore++;
    messageAppear.value = true;
    await Future.delayed(Duration(milliseconds: 300));
    messageContent.value = message;
    messageVisible.value = true;
    await Future.delayed(Duration(seconds: 3));
    semaphore--;
    if (semaphore == 0){
      hideMessage();
    }
  }

  void hideMessage() async {
    messageVisible.value = false;
    await Future.delayed(Duration(milliseconds: 100));
    messageAppear.value = false;
  }

  void addToRecipes(Recipe recipe) {
    if (!recipes.contains(recipe)){
      recipes.add(recipe);
      newRecipes.add(recipe);
    }
  }

  void showPopup(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
            contentPadding: EdgeInsets.zero,
            backgroundColor: _themeController.currentTheme.value.canvasColor.withOpacity(1),
            shape: RoundedRectangleBorder(
                side: BorderSide(color: _themeController.currentTheme.value.borderColor.withOpacity(1), width: 2.0),
                borderRadius: BorderRadius.circular(10)
            ),
            content: Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.6,
              child: Stack(
                children: [
                  Opacity(
                      opacity: 0.5,
                      child: MarvinFireWorks(
                          theme: _themeController.currentTheme.value,
                          width: MediaQuery.of(context).size.width * 0.3
                      )
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: MarvinText(
                              text: Text('Congratulations'),
                            ),
                          ),
                        ),
                        Expanded(
                            child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: MarvinText(text: Text('You won a\nfree coupon!', textAlign: TextAlign.center,))
                            )
                        ),
                        TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.08,
                              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                              decoration: BoxDecoration(
                                color: _themeController.currentTheme.value.canvasColor.withOpacity(1),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                  color: _themeController.currentTheme.value.borderColor.withOpacity(1),
                                  width: 1,
                                ),
                              ),
                              child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: MarvinText(text: Text('Close', style:
                                  _themeController.getTheme().textTheme.bodyText1,
                                  ))
                              ),
                            )
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}