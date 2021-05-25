import 'package:flutter/material.dart';
import 'package:marvin_kitchen/config/constants/ui/theme_constants.dart';
import 'package:marvin_kitchen/kitchen_app.dart';
import 'package:get/get.dart';

void main() {
  Get.put(MarvinThemeController());
  runApp(KitchenApp());
}