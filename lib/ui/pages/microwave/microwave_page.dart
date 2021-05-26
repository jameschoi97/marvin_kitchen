import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvin_kitchen/config/constants/ui/theme_constants.dart';
import 'package:marvin_kitchen/ui/widgets/marvin_bottombar.dart';
import 'package:marvin_kitchen/ui/widgets/marvin_carousel.dart';
import 'package:marvin_kitchen/ui/widgets/marvin_topbar.dart';

class MicrowavePage extends StatelessWidget {
  static final String name = '/microwave';

  final _themeController = Get.find<MarvinThemeController>();

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
                  child: Container(),
                ),
                Expanded(
                    flex: 3,
                    child: MarvinCarousel(
                      children: [],
                    )),
                Expanded(
                  flex: 2,
                  child: Container(),
                ),
                MarvinBottomBar(),
              ],
            )));
  }
}
