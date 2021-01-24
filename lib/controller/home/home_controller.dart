import 'dart:ui';
import 'package:get/get.dart';
import 'package:noticemeflutter/data/db/noticeme_database.dart';
import 'package:noticemeflutter/data/db/user_consumable_entity.dart';
import 'package:noticemeflutter/provider/noticeme_provider.dart';

class HomeController extends GetxController {
  NoticemeProvider provider = Get.put(NoticemeProvider());

  Color colorFromHex(String hexColor) {
    return provider.colorFromHex(hexColor);
  }

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

    if (list.isNotEmpty) {
      return list;
    } else {
      return throw Exception('Failed to load data');
    }
  }
}
