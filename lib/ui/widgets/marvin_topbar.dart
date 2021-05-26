import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvin_kitchen/config/constants/ui/theme_constants.dart';
import 'package:marvin_kitchen/main_controller.dart';

import 'marvin_text.dart';
import 'package:dart_date/dart_date.dart';

class MarvinTopBar extends StatelessWidget {
  MarvinTopBar({
    this.main = false,
  });

  bool main;
  final _controller = Get.find<MainController>();
  final _themeController = Get.find<MarvinThemeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: _themeController.currentTheme.value.barColor,
                spreadRadius: 20,
                blurRadius: 40,
                offset: Offset(0, -10) // changes position of shadow
                )
          ],
        ),
        child: Row(
          children: [
            TextButton(
              onPressed: main ? null : () => Get.back(),
              child: Icon(
                main ? Icons.lightbulb_outlined : Icons.arrow_back_ios_sharp,
                size: 80,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  main
                      ? Icon(Icons.phone_android, size: 60)
                      : Container(width: 50),
                  Container(
                    child: MarvinText(
                        text: Text(_controller.currentTime.value.format('jm'),
                            style: TextStyle(fontSize: 40))),
                    margin: EdgeInsets.symmetric(horizontal: 15),
                  ),
                  Icon(Icons.wifi, size: 60),
                ],
              ),
            ),
            Icon(
              Icons.settings_outlined,
              size: 80,
            ),
          ],
        ),
      ),
    );
  }
}
