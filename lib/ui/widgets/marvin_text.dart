import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/constants/ui/theme_constants.dart';
import 'package:get/get.dart';

import '../../config/constants/ui/theme_constants.dart';

class MarvinText extends StatelessWidget {
  MarvinText({
    required this.content,
    this.style,
    this.textAlign = TextAlign.start,
  });

  final _themeController = Get.find<MarvinThemeController>();
  String content;
  TextStyle? style;
  TextAlign textAlign;


  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      child: _themeController.currentTheme.value == MarvinTheme.starWars ? BorderedText(
        strokeWidth: 2.0,
          strokeColor: Colors.yellow,
          child: Text(content, style: style?.copyWith(color: Colors.black,fontWeight: FontWeight.bold) ?? null, textAlign: textAlign,)
      ) : Text(content, style: style, textAlign: textAlign,)
    ));
  }
}