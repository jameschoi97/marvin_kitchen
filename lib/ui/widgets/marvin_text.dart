import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/constants/ui/theme_constants.dart';
import 'package:get/get.dart';

class MarvinText extends StatelessWidget {
  MarvinText({
    required this.text
  });

  final _themeController = Get.find<MarvinThemeController>();
  Text text;


  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      child: getText(text),
    ));
  }

  Widget getText(Text text) {
    final theme = _themeController.currentTheme.value;
    if (theme == MarvinTheme.normal) {
      return text;
    } else if (theme == MarvinTheme.christmas) {
      return BorderedText(
        strokeWidth: 2.0,
          strokeColor: MarvinTheme.christmas.primaryColor,
          child: text,
      );
    } else {
      return BorderedText(
        strokeWidth: 2.0,
        strokeColor: MarvinTheme.starWars.primaryColor,
        child: text,
      );
    }
  }
}