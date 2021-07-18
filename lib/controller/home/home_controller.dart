import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noticemeflutter/data/db/user_consumable_entity.dart';
import 'package:noticemeflutter/data/repository/user_repository.dart';

class HomeController extends GetxController {
  final UserRepository userRepository;

  HomeController({@required this.userRepository})
      : assert(userRepository != null);

  bool checkUserConsumableList(int size) {
    if (size == 0) {
      return true;
    } else {
      return false;
    }
  }

  final _userConsumableList = <UserConsumableEntity>[].obs;

  get userConsumableList => this._userConsumableList.value;

  set postList(value) => this._userConsumableList.value = value;

  getUserConsumableList() {
    userRepository.getUserConsumableList().then((data) => this.postList = data);
    // final database = await $FloorNoticemeDatabase
    //     .databaseBuilder('noticeme_database.db')
    //     .build();
    // var dao = database.userConsumableDao;
    // var list = await dao.getAllConsumable();
    //
    // if (list.isNotEmpty) {
    //   this.postList = list;
    // } else {
    //   return throw Exception('Failed to load data');
    // }
  }
}
