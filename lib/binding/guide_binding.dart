import 'package:get/get.dart';
import 'package:noticemeflutter/controller/guide/guide_controller.dart';
import 'package:noticemeflutter/data/db/noticeme_database.dart';
import 'package:noticemeflutter/data/repository/main_repository.dart';

class GuideBinding extends Bindings {
  @override
  void dependencies() async {
    final database = await $FloorNoticemeDatabase
        .inMemoryDatabaseBuilder()
        .build();
    final dao = database.consumableDao;

    Get.lazyPut<GuideController>(() =>
        GuideController(mainRepository: MainRepository(consumableDao: dao)));
  }
}