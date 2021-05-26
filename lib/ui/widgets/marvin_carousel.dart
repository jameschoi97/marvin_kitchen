import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvin_kitchen/config/constants/ui/theme_constants.dart';

class MarvinCarousel extends StatelessWidget {
  MarvinCarousel({
    this.scrollable = false,
    required this.children,
  });

  bool scrollable;
  List<Widget> children;
  final _themeController = Get.find<MarvinThemeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 2,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: _themeController.currentTheme.value.borderColor,
                spreadRadius: 5,
                blurRadius: 20, // changes position of shadow
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: _themeController.currentTheme.value.canvasColor,
            child: scrollable ? SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  color: Colors.transparent,
                  child: Row(
                      children: children),
                )
            ) : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: children),
          ),
        ),
        Container(
          height: 2,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: _themeController.currentTheme.value.borderColor,
                spreadRadius: 5,
                blurRadius: 20, // changes position of shadow
              ),
            ],
          ),
        ),
      ],
    );
  }

}