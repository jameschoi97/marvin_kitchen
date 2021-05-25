import 'package:get/get.dart';

class MainPageController extends GetxController {
  final showMessage = false.obs;
  final messageVisible = false.obs;
  final messageContent = ''.obs;

  var semaphore = 0;
}