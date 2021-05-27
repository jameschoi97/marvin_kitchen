import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvin_kitchen/config/constants/ui/theme_constants.dart';
import 'package:marvin_kitchen/main_controller.dart';
import 'package:marvin_kitchen/ui/pages/timer/timer_page.dart';
import 'package:marvin_kitchen/ui/widgets/marvin_bottombar.dart';
import 'package:marvin_kitchen/ui/widgets/marvin_carousel.dart';
import 'package:marvin_kitchen/ui/widgets/marvin_notification.dart';
import 'package:marvin_kitchen/ui/widgets/marvin_text.dart';
import 'package:marvin_kitchen/ui/widgets/marvin_topbar.dart';



class RecipesPage extends StatelessWidget {
  static final String name = '/recipes';

  final _themeController = Get.find<MarvinThemeController>();

  final _controller = Get.find<MainController>();
  


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
                    child: Center(
                        child: MarvinNotification(),
                        )),
                Expanded(
                    flex: 3,
                    child: Obx(() => MarvinCarousel(
                      scrollable: true,
                      children: _controller.recipes.map((recipe) => Stack(
                        children: [

                          Center(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: MediaQuery.of(context).size.width / 60,
                                vertical: MediaQuery.of(context).size.width / 50,
                              ),

                              decoration: _controller.newRecipes.contains(recipe) ? BoxDecoration(
                                border: Border.all(
                                  color: _themeController.currentTheme.value.notificationColor,
                                  width: MediaQuery.of(context).size.width / 400,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ) : null,
                              margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 100),
                              child: TextButton(
                                onPressed: () => Get.toNamed(TimerPage.name, arguments: recipe),
                                child: MarvinText(
                                    text: Text(
                                      recipe.name,
                                      style: _themeController.getTheme().textTheme.headline2!.copyWith(
                                        fontSize: MediaQuery.of(context).size.width / 30
                                      ),
                                      textAlign: TextAlign.center,
                                    )),
                              ),
                            ),
                          ),
                          _controller.newRecipes.contains(recipe) ? Positioned(
                              top: 0,
                              bottom: MediaQuery.of(context).size.width/8.5,
                              right: 0,
                              left: 0,
                              child: Center(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 80,
                                    vertical: MediaQuery.of(context).size.width / 120,),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: _themeController.currentTheme.value.notificationColor,
                                    ),
                                    child: Text('New', style: TextStyle(
                                      color: _themeController.currentTheme.value.notificationTextColor,
                                      fontSize: MediaQuery.of(context).size.width / 50,
                                    ),)
                                ),
                              )
                          ) : Container(),
                        ],
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
