import 'dart:ui';
import 'package:get/get.dart';
import 'package:noticemeflutter/data/db/noticeme_database.dart';
import 'package:noticemeflutter/data/db/user_consumable_entity.dart';
import 'package:noticemeflutter/provider/noticeme_provider.dart';

class HomeController extends GetxController {
  HomeController() {
    getUserConsumableList();
  }

  NoticemeProvider provider = Get.put(NoticemeProvider());

  Color colorFromHex(String hexColor) {
    return provider.colorFromHex(hexColor);
  }

  var _currentListLength = 1.obs;

  get currentListLength => this._currentListLength.value;

  set currentListLength(value) => this._currentListLength.value = value;

  var _isLoadingData = false.obs;

  get isLoadingData => this._isLoadingData.value;

  set isLoadingData(value) => this._isLoadingData.value = value;

  bool checkUserConsumableList(int page) {
    if (page == 0) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<UserConsumableEntity>> getUserConsumableList() async {
    isLoadingData = true;

    final database = await $FloorNoticemeDatabase
        .databaseBuilder('noticeme_database.db')
        .build();
    var dao = database.userConsumableDao;

    var list = await dao.getAllConsumable();

    currentListLength = list.length;
    isLoadingData = false;

    return list;
  }
}
