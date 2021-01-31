import 'package:get/get.dart';
import 'package:noticemeflutter/ui/add/add_custom_consumable_controller.dart';

class AddCustomConsumableBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddCustomConsumableController>(
        () => AddCustomConsumableController());
  }
}
