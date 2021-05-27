import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:marvin_kitchen/config/constants/ui/theme_constants.dart';
import 'package:marvin_kitchen/ui/widgets/marvin_fireworks.dart';
import 'package:marvin_kitchen/ui/widgets/marvin_text.dart';
import 'package:http/http.dart' as http;

final headers = {"Access-Control-Allow-Methods" : "POST, OPTIONS, GET",
"Access-Control-Allow-Origin" : "*",
'Access-Control-Allow-Headers' : '*'};

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
    if (index == Recipe.brownie.index) return 'Grandma\'s\nBrownie';
    return 'Error';
  }

  String get singleLineName {
    if (index == Recipe.cookie.index) return 'Cookie';
    if (index == Recipe.pizza.index) return 'Pizza';
    if (index == Recipe.oatmeal.index) return 'Oatmeal';
    if (index == Recipe.omelette.index) return 'Omelette';
    if (index == Recipe.friedRice.index) return 'Fried Rice';
    if (index == Recipe.chickenSoup.index) return 'Chicken Soup';
    if (index == Recipe.brownie.index) return 'Grandma\'s Brownie';
    return 'Error';
  }
}

class MainController extends GetxController {

  final serverUrl = 'https://c8586f05d592.ngrok.io';

  final messageAppear = false.obs;
  final messageVisible = false.obs;
  final messageContent = ''.obs;
  var currentTime = DateTime.now().obs;

  var semaphore = 0;
  var showingFireworks = false;

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
    Timer.periodic(
        Duration(seconds: 2), (Timer t) => currentTime.value = DateTime.now());
    Timer.periodic(
      Duration(milliseconds: 500), (Timer t) => readHttp()
    );

    super.onInit();
  }

  void readHttp() async {
    var url = Uri.parse('$serverUrl/api/api.php?1');

    http.get(url).then((response) {
      final json = jsonDecode(response.body);
      handleJson(json);
    });
  }

  void handleJson(Map<String, dynamic> json){
    final theme = json['theme'] ?? '';
    var newTheme = _themeController.currentTheme.value;
    if (theme == 'normal') {
      newTheme = MarvinTheme.normal;
    } else if (theme == 'christmas') {
      newTheme = MarvinTheme.christmas;
    } else if (theme == 'starWars') {
      newTheme = MarvinTheme.starWars;
    }
    if (newTheme != _themeController.currentTheme.value) {
      changeTheme(newTheme);
    }
    
    final showFireworks = json['firework'] ?? false;
    if (showFireworks && !showingFireworks) {
      final currentTheme = _themeController.currentTheme.value.name;
      var url = Uri.parse('$serverUrl/api/api.php?2,0,0,$currentTheme');
      http.get(url);
      showingFireworks = true;
      showPopup();
    }

    final addRecipe = json['recipeAdded'] ?? false;
    if (addRecipe) {
      final currentTheme = _themeController.currentTheme.value.name;
      var url = Uri.parse('$serverUrl/api/api.php?2,0,0,$currentTheme');
      http.get(url);

      addToRecipes(Recipe.brownie);
    }

    
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
    if (semaphore == 0) {
      hideMessage();
    }
  }

  void hideMessage() async {
    messageVisible.value = false;
    await Future.delayed(Duration(milliseconds: 100));
    messageAppear.value = false;
  }

  void addToRecipes(Recipe recipe) {
    if (!recipes.contains(recipe)) {
      recipes.add(recipe);
      newRecipes.add(recipe);
      showMessage('New recipe, "${recipe.singleLineName}" has been added');
    }
  }

  void showPopup() {
    final defaultWidth = 800.0;
    final defaultHeight = 500.0;
    Get.dialog(
      AlertDialog(
            contentPadding: EdgeInsets.zero,
            backgroundColor:
                _themeController.currentTheme.value.canvasColor.withOpacity(1),
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: _themeController.currentTheme.value.borderColor
                        .withOpacity(1),
                    width: 2.0),
                borderRadius: BorderRadius.circular(10)),
            content: Container(
              width: defaultWidth * 0.7,
              height: defaultHeight * 0.9,
              child: Stack(
                children: [
                  Opacity(
                      opacity: 0.5,
                      child: MarvinFireWorks(
                          theme: _themeController.currentTheme.value,
                          width: defaultWidth * 0.7)),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Column(
                      children: [
                        Center(
                          child: MarvinText(
                            text: Text('Congratulations',
                            style: _themeController.getTheme().textTheme.bodyText1!.copyWith(
                              fontSize: defaultWidth /
                                  15,
                            )),
                          ),
                        ),
                        Expanded(
                            child: Center(
                                child: MarvinText(
                                    text: Text(
                                  'You won a\nfree coupon!',
                                  textAlign: TextAlign.center,
                                      style: _themeController.getTheme().textTheme.bodyText1!.copyWith(
                                        fontSize: defaultWidth /
                                            10,
                                      ),
                                )))),
                        TextButton(
                            onPressed: () {
                              showingFireworks = false;
                              Get.back();
                              },
                            child: Container(
                              width: defaultWidth * 0.15,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 10),
                              decoration: BoxDecoration(
                                color: _themeController
                                    .currentTheme.value.canvasColor
                                    .withOpacity(1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                  color: _themeController
                                      .currentTheme.value.borderColor
                                      .withOpacity(1),
                                  width: 1,
                                ),
                              ),
                              child: Center(
                                  child: MarvinText(
                                      text: Text(
                                    'Close',
                                    style: _themeController
                                        .getTheme()
                                        .textTheme
                                        .bodyText1!.copyWith(
                                      fontSize: defaultWidth /
                                          30,
                                    ),
                                  ))),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }

  void foodComplete(BuildContext context, Recipe recipe) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
            contentPadding: EdgeInsets.zero,
            backgroundColor:
            _themeController.currentTheme.value.canvasColor.withOpacity(1),
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: _themeController.currentTheme.value.borderColor
                        .withOpacity(1),
                    width: 2.0),
                borderRadius: BorderRadius.circular(10)),
            content: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.9,
              child:
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Column(
                      children: [
                        Expanded(
                            child: Center(
                                child: MarvinText(
                                    text: Text(
                                      'Your\n${recipe.singleLineName}\nis ready',
                                      textAlign: TextAlign.center,
                                      style: _themeController.getTheme().textTheme.bodyText1!.copyWith(
                                        fontSize: MediaQuery.of(context)
                                            .size
                                            .width /
                                            15,
                                      ),
                                    )))),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              Get.back();
                              if (newRecipes.contains(recipe)) {
                                newRecipes.remove(recipe);
                                askToKeep(context, recipe);
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.15,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 10),
                              decoration: BoxDecoration(
                                color: _themeController
                                    .currentTheme.value.canvasColor
                                    .withOpacity(1),
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                  color: _themeController
                                      .currentTheme.value.borderColor
                                      .withOpacity(1),
                                  width: 1,
                                ),
                              ),
                              child: Center(
                                  child: MarvinText(
                                      text: Text(
                                        'Close',
                                        style: _themeController
                                            .getTheme()
                                            .textTheme
                                            .bodyText1!.copyWith(
                                          fontSize: MediaQuery.of(context)
                                              .size
                                              .width /
                                              30,
                                        ),
                                      ))),
                            ))
                      ],
                    ),
                  ),

            )));
  }

  void askToKeep(BuildContext context, Recipe recipe) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
            contentPadding: EdgeInsets.zero,
            backgroundColor:
            _themeController.currentTheme.value.canvasColor.withOpacity(1),
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: _themeController.currentTheme.value.borderColor
                        .withOpacity(1),
                    width: 2.0),
                borderRadius: BorderRadius.circular(10)),
            content: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.9,
              child:
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  children: [
                    Expanded(
                        child: Center(
                            child: MarvinText(
                                text: Text(
                                  'Would you like to keep\nyour new recipe \n"${recipe.singleLineName}\"?',
                                  textAlign: TextAlign.center,
                                  style: _themeController.getTheme().textTheme.bodyText1!.copyWith(
                                    fontSize: MediaQuery.of(context)
                                        .size
                                        .width /
                                        15,
                                  ),
                                )))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.15,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 10),
                              decoration: BoxDecoration(
                                color: _themeController
                                    .currentTheme.value == MarvinTheme.normal ? Colors.green : _themeController
                                    .currentTheme.value.canvasColor
                                    .withOpacity(1),
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                  color: _themeController
                                      .currentTheme.value.borderColor
                                      .withOpacity(1),
                                  width: 1,
                                ),
                              ),
                              child: Center(
                                  child: _themeController
                                      .currentTheme.value == MarvinTheme.normal ? Text(
                                    'Yes',
                                    style: _themeController
                                        .getTheme()
                                        .textTheme
                                        .bodyText1!.copyWith(
                                      color: Colors.white,
                                      fontSize: MediaQuery.of(context)
                                          .size
                                          .width /
                                          30,
                                    ),
                                  ) :MarvinText(
                                      text: Text(
                                        'Yes',
                                        style: _themeController
                                            .getTheme()
                                            .textTheme
                                            .bodyText1!.copyWith(
                                          fontSize: MediaQuery.of(context)
                                              .size
                                              .width /
                                              30,
                                        ),
                                      ))),
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              recipes.remove(recipe);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.15,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 10),
                              decoration: BoxDecoration(
                                color: _themeController
                                    .currentTheme.value == MarvinTheme.normal ? Colors.red :_themeController
                                    .currentTheme.value.canvasColor
                                    .withOpacity(1),
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                  color: _themeController
                                      .currentTheme.value.borderColor
                                      .withOpacity(1),
                                  width: 1,
                                ),
                              ),
                              child: Center(
                                  child: _themeController
                                      .currentTheme.value == MarvinTheme.normal ? Text(
                                    'No',
                                    style: _themeController
                                        .getTheme()
                                        .textTheme
                                        .bodyText1!.copyWith(
                                      color: Colors.white,
                                      fontSize: MediaQuery.of(context)
                                          .size
                                          .width /
                                          30,
                                    ),
                                  ) :MarvinText(
                                      text: Text(
                                        'No',
                                        style: _themeController
                                            .getTheme()
                                            .textTheme
                                            .bodyText1!.copyWith(
                                          fontSize: MediaQuery.of(context)
                                              .size
                                              .width /
                                              30,
                                        ),
                                      ))),
                            )),
                      ],
                    )
                  ],
                ),
              ),

            )));
  }
}
