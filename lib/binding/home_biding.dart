import 'package:get/get.dart';
import 'package:noticemeflutter/controller/home/home_controller.dart';
import 'package:noticemeflutter/data/repository/user_repository.dart';

class HomeBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut<HomeController>(
        () => HomeController(userRepository: UserRepository()));
  }
}
