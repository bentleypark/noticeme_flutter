import 'package:get/get.dart';
import 'package:noticemeflutter/controller/guide/guide_controller.dart';

class GuideBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut<GuideController>(() => GuideController());
  }
}