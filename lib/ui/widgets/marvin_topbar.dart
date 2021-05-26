import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvin_kitchen/config/constants/ui/theme_constants.dart';
import 'package:marvin_kitchen/main_controller.dart';
import 'package:marvin_kitchen/ui/widgets/marvin_fireworks.dart';

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
              onPressed: () => main ? showPopup(context) : Get.back(),
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
                    height: barHeight * 0.5,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: MarvinText(
                          text: Text(
                        _controller.currentTime.value.format('jm'),
                      )),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 15),
                  ),
                  Icon(Icons.wifi, size: barHeight * 0.4),
                ],
              ),
            ),
            Icon(
              Icons.settings_outlined,
              size: barHeight * 0.7,
            ),
          ],
        ),
      ),
    );
  }

  void showPopup(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: _themeController.currentTheme.value.canvasColor.withOpacity(1),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: _themeController.currentTheme.value.borderColor.withOpacity(1), width: 2.0),
                  borderRadius: BorderRadius.circular(10)
                ),
                content: Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.6,
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.5,
                      child: MarvinFireWorks(
                          theme: _themeController.currentTheme.value,
                          width: MediaQuery.of(context).size.width * 0.3
                      )
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: MarvinText(
                              text: Text('Congratulations'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: MarvinText(text: Text('You won a\nfree coupon!', textAlign: TextAlign.center,))
                          )
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.08,
                            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                            decoration: BoxDecoration(
                              color: _themeController.currentTheme.value.canvasColor.withOpacity(1),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                color: _themeController.currentTheme.value.borderColor.withOpacity(1),
                                width: 1,
                              ),
                            ),
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                                child: MarvinText(text: Text('Close', style:
                                _themeController.getTheme().textTheme.bodyText1,
                                ))
                            ),
                          )
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
