import 'package:get/get.dart';
import 'package:noticemeflutter/data/db/noticeme_database.dart';
import 'package:noticemeflutter/data/db/user_consumable_entity.dart';

class HomeController extends GetxController {
  bool checkUserConsumableList(int size) {
    if (size == 0) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<UserConsumableEntity>> getUserConsumableList() async {
    final database = await $FloorNoticemeDatabase
        .databaseBuilder('noticeme_database.db')
        .build();
    var dao = database.userConsumableDao;
    var list = await dao.getAllConsumable();

    var list2 = [
      UserConsumableEntity(
          0, '칫솔', 'images/img_toothbrush.png', '욕실', 7776000000, 0, 0, 0),
      UserConsumableEntity(
          0, '칫솔', 'images/img_toothbrush.png', '욕실', 7776000000, 0, 0, 0)
    ];

    if (list2.isNotEmpty) {
      return list2;
    } else {
      return throw Exception('Failed to load data');
    }
  }
}
