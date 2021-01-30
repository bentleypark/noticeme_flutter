import 'package:get/get.dart';
import 'package:noticemeflutter/controller/category/category_detail_controller.dart';

class CategoryDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryDetailController>(() => CategoryDetailController());
  }
}
