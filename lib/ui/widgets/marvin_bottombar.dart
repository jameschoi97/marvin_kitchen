import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvin_kitchen/config/constants/ui/theme_constants.dart';
import 'package:marvin_kitchen/main_controller.dart';

class MarvinBottomBar extends StatelessWidget {
  MarvinBottomBar({this.main = false});

  bool main;
  final _controller = Get.find<MainController>();
  final _themeController = Get.find<MarvinThemeController>();


  @override
  Widget build(BuildContext context) {
    final barHeight = MediaQuery.of(context).size.height * 0.1;
    return Container(
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
          main ? TextButton(
              onPressed: () => _controller.showMessage('Update completed'),
              child: Icon(
                Icons.favorite_outline,
                size: barHeight * 0.7,
              )) : Container(),
          Expanded(
            child: main ? Center(
              child: TextButton(
                onPressed: () => _themeController.currentTheme.value ==
                    MarvinTheme.normal
                    ? _controller.changeTheme(MarvinTheme.christmas)
                    : _controller.changeTheme(MarvinTheme.normal),
                child: Icon(
                  Icons.lock_outlined,
                  size: barHeight * 0.7,
                ),
              ),
            ) : Container(),
          ),
          TextButton(
            onPressed: () => _controller.changeTheme(MarvinTheme.starWars),
            child: Icon(
              Icons.timer_outlined,
              size: barHeight * 0.7,
            ),
          ),
        ],
      ),
    );
  }

}