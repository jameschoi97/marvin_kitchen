import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvin_kitchen/config/constants/ui/theme_constants.dart';
import 'package:marvin_kitchen/main_controller.dart';
import 'package:get/get.dart';

import 'marvin_text.dart';

class MarvinNotification extends StatelessWidget {
  final _controller = Get.find<MainController>();
  final _themeController = Get.find<MarvinThemeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedOpacity(
      opacity: _controller.messageVisible.value ? 1.0 : 0.0,
      duration: Duration(milliseconds: 700),
      child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeOut,
          width: _controller.messageAppear.value
              ? MediaQuery.of(context).size.width * 0.7
              : 0,
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            border: Border.all(
              color: _themeController.currentTheme.value.borderColor,
            ),
            color: _themeController.currentTheme.value.canvasColor,
          ),
          child: AnimatedOpacity(
            opacity: _controller.messageVisible.value ? 1.0 : 0.0,
            duration: Duration(milliseconds: 150),
            child: Row(
              children: [
                Container(
                    width:
                    MediaQuery.of(context).size.width / 30 + 40),
                Expanded(
                    child: Center(
                        child: MarvinText(
                            text: Text(
                                _controller.messageContent.value,
                                style: TextStyle(
                                    fontSize: MediaQuery.of(context)
                                        .size
                                        .width /
                                        40))))),
                TextButton(
                  onPressed: () => _controller.hideMessage(),
                  child: Icon(Icons.close,
                      color: Colors.red,
                      size: MediaQuery.of(context).size.width / 30),
                )
              ],
            ),
          )),
    ));
  }

}