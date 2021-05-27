import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvin_kitchen/config/constants/ui/theme_constants.dart';
import 'package:marvin_kitchen/main_controller.dart';
import 'package:marvin_kitchen/ui/widgets/marvin_bottombar.dart';
import 'package:marvin_kitchen/ui/widgets/marvin_topbar.dart';

class TimerPage extends StatelessWidget {
  static final String name = '/timer';

  final _themeController = Get.find<MarvinThemeController>();
  final _controller = Get.find<MainController>();

  Recipe recipe = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: _themeController.getDecoration(),
            child: Column(
              children: [
                MarvinTopBar(),
                Expanded(
                  child: Center(
                    child: CircularCountDownTimer(
                      duration: 4,
                      initialDuration: 0,
                      controller: CountDownController(),
                      width: MediaQuery.of(context).size.height * 0.7,
                        height: MediaQuery.of(context).size.height * 0.7,
                      ringColor: Colors.grey[300]!,
                      ringGradient: null,
                      fillColor: _themeController.currentTheme.value.primaryColor,
                      fillGradient: null,
                      backgroundColor: _themeController.currentTheme.value.canvasColor.withOpacity(0.6),
                      backgroundGradient: null,
                      strokeWidth: MediaQuery.of(context).size.height * 0.02,
                      strokeCap: StrokeCap.round,
                      textStyle: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.25, color: _themeController.currentTheme.value.primaryColor, fontWeight: FontWeight.bold),
                      textFormat: CountdownTextFormat.S,
                      isReverse: true,
                      isReverseAnimation: false,
                      isTimerTextShown: true,
                      autoStart: true,
                      onStart: () {
                        print('Countdown Started');
                      },
                      onComplete: () {
                        _controller.foodComplete(context, recipe);
                      },
                    )
                  )
                ),
                MarvinBottomBar(),
              ],
            )));
  }
}
