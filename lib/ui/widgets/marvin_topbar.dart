import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvin_kitchen/config/constants/ui/theme_constants.dart';
import 'package:marvin_kitchen/main_controller.dart';
import 'package:http/http.dart' as http;

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
    final barHeight = MediaQuery.of(context).size.height * 0.1;
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
              onPressed: () => main ? _controller.showPopup() : Get.back(),
              child: Icon(
                main ? Icons.lightbulb_outlined : Icons.arrow_back_ios_sharp,
                size: barHeight * 0.7,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  main
                      ? Icon(Icons.phone_android, size: barHeight * 0.4)
                      : Container(width: barHeight * 0.4),
                  Container(
                      child: MarvinText(
                          text: Text(
                        _controller.currentTime.value.format('jm'),
                            style: _themeController.getTheme().textTheme.bodyText1!.copyWith(
                              fontSize: barHeight * 0.4,
                            ),
                      )),
                    margin: EdgeInsets.symmetric(horizontal: 15),
                  ),
                  Icon(Icons.wifi, size: barHeight * 0.4),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                final currentTheme = _themeController.currentTheme.value.name;
                var url = Uri.parse('${_controller.serverUrl}/api/api.php?2,0,1,$currentTheme');
                http.get(url);
              },
              child: Icon(
                Icons.settings_outlined,
                size: barHeight * 0.7,
              ),
            ),
          ],
        ),
      ),
    );
  }


}
