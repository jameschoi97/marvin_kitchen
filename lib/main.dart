import 'package:flutter/material.dart';
import 'package:marvin_kitchen/config/constants/ui/theme_constants.dart';
import 'package:marvin_kitchen/kitchen_app.dart';
import 'package:get/get.dart';
import 'package:marvin_kitchen/main_controller.dart';

void main() {
  Get.put(MarvinThemeController());
  Get.put(MainController());
  runApp(KitchenApp());
}