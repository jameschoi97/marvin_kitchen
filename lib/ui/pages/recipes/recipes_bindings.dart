import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get.dart';
import 'package:marvin_kitchen/ui/pages/recipes/recipes_controller.dart';

class RecipesBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => RecipesController());
  }
}