import 'package:get/get.dart';
import 'package:noticemeflutter/data/db/consumable_entity.dart';
import 'package:noticemeflutter/data/db/noticeme_database.dart';

class CategoryDetailController extends GetxController {


  Future<List<ConsumableEntity>> fetchConsumableByCategory(
      String category) async {
    final database = await $FloorNoticemeDatabase
        .databaseBuilder('noticeme_database.db')
        .build();
    var dao = database.consumableDao;

    var list = await dao.fetchConsumableByCategory(category);

    if (list.isNotEmpty) {
      return list;
    } else {
      return throw Exception('Failed to load data');
    }
  }
}
