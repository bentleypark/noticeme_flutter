import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noticemeflutter/data/db/consumable_dao.dart';
import 'package:noticemeflutter/data/db/consumable_entity.dart';
import 'package:noticemeflutter/data/db/noticeme_database.dart';
import 'package:noticemeflutter/data/repository/main_repository.dart';
import 'package:noticemeflutter/provider/noticeme_provider.dart';

class GuideController extends GetxController {
  GuideController() {
    insertInitialData();
  }

  List<ConsumableEntity> consumableList;
  NoticemeProvider provider = Get.put(NoticemeProvider());

  // final PageController _pageController = PageController(initialPage: 0);
  //
  // get pageController => this._pageController;
  //
  // var _currentPage = 0.obs;
  //
  // get currentPage => this._currentPage;
  //
  // set currentPage(value) => this._currentPage = value;

  insertInitialData() async {
    final database = await $FloorNoticemeDatabase
        .databaseBuilder('noticeme_database.db')
        .build();
    var dao = database.consumableDao;
    consumableList = provider.getConsumableList();

    consumableList.forEach((element) {
      dao.insertConsumable(element);
    });
  }
}
