import 'package:get/get.dart';
import 'dart:async';

import 'package:marvin_kitchen/config/constants/ui/theme_constants.dart';

class MainController extends GetxController {
  final messageAppear = false.obs;
  final messageVisible = false.obs;
  final messageContent = ''.obs;
  var currentTime = DateTime.now().obs;

  var semaphore = 0;

  final _themeController = Get.find<MarvinThemeController>();
  
  
  @override
  void onInit() {
    Timer.periodic(Duration(seconds: 2), (Timer t) => currentTime.value = DateTime.now());
    super.onInit();
  }

  void changeTheme(MarvinTheme theme) {
    _themeController.currentTheme.value = theme;
    showMessage('Theme updated');
  }

  void showMessage(String message) async {
    semaphore++;
    messageAppear.value = true;
    await Future.delayed(Duration(milliseconds: 300));
    messageContent.value = message;
    messageVisible.value = true;
    await Future.delayed(Duration(seconds: 3));
    semaphore--;
    if (semaphore == 0){
      hideMessage();
    }
  }

  void hideMessage() async {
    messageVisible.value = false;
    await Future.delayed(Duration(milliseconds: 100));
    messageAppear.value = false;
  }
}